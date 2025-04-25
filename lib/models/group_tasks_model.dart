import 'package:edu/entities/group.dart';
import 'package:edu/entities/task.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GroupTasksModel extends ChangeNotifier {
  int groupKey;
  Group? group;

  List<Task> _tasks = <Task>[];
  List<Task> get tasks => _tasks.toList();

  late Box<Group> groupBox;

  GroupTasksModel({required this.groupKey}) {
    _setup();
    notifyListeners();
  }

  void toggleDone(int index) {
    Task? task = group?.tasks?[index];
    bool taskState = task?.isDone ?? false;

    task?.isDone = !taskState;
    task?.save();
    notifyListeners();
  }

  void deleteTask(int index) {
    group?.tasks?.deleteFromHive(index);
    group?.save();
  }

  void _setup() {
    groupBox = Hive.box<Group>("groupsBox");
    //получаем группу по ключу
    group = groupBox.get(groupKey);
    //обновляем список задач беря их из группы
    _tasks = group?.tasks?.toList() ?? <Task>[];

    //слушатель если состояние бокса поменяется
    groupBox.listenable(keys: [groupKey]).addListener(() {
      _tasks = group?.tasks?.toList() ?? <Task>[];
      notifyListeners();
    });
  }
}

class GroupTasksProvider extends InheritedNotifier {
  GroupTasksModel notifier;
  GroupTasksProvider({
    required super.child,
    required this.notifier,
  }) : super(
          notifier: notifier,
        );

  static GroupTasksModel? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GroupTasksProvider>()
        ?.notifier;
  }
}
