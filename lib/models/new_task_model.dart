import 'package:edu/entities/group.dart';
import 'package:edu/entities/task.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NewTaskModel {
  String title = "";
  int? groupKey;

  NewTaskModel({required this.groupKey});
  //Сохранение задачи
  saveTask(int groupKey) {
    if (title.isNotEmpty) {
      var tasksBox = Hive.box<Task>("tasks_box");
      Task task = Task(title: title, isDone: false);
      tasksBox.add(task);

      var groupBox = Hive.box<Group>("groupsBox");
      Group group = groupBox.get(groupKey)!;

      group.addTask(tasksBox, task);
      group.save();
    } else {}
  }
}

class NewTaskModelProvider extends InheritedWidget {
  NewTaskModel model;
  NewTaskModelProvider({super.key, required super.child, required this.model});

  static NewTaskModel? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NewTaskModelProvider>()
        ?.model;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    throw false;
  }
}
