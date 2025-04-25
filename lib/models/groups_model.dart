import 'package:edu/entities/group.dart';
import 'package:edu/entities/task.dart';
import 'package:edu/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GroupsModel extends ChangeNotifier {
  GroupsModel() {
    setup();
  }

  List<Group> _groups = <Group>[];
  List<Group> get groups => _groups.toList();

  Box<Group> box = Hive.box<Group>("groupsBox");

  setup() {
    _updateGroupsData();
    box.listenable().addListener(() => _updateGroupsData());
  }

  void _updateGroupsData() {
    _groups = box.values.toList();
    notifyListeners();
  }

  Future<void> deleteGroup(int index) async {
    var box = Hive.box<Group>("groupsBox");
    box.getAt(index)?.tasks?.deleteAllFromHive();

    await box.deleteAt(index);
  }

  showGroupTasks(BuildContext context, int index) async {
    var box = Hive.box<Group>("groupsBox");
    int key = await box.keyAt(index) as int;
    if (context.mounted) {
      Navigator.pushNamed(context, MainNavigationNames.groupTasksScreen,
          arguments: key);
    }
  }
}

class GroupsModelProvider extends InheritedNotifier<GroupsModel> {
  final GroupsModel model;
  const GroupsModelProvider({
    super.key,
    required super.child,
    required this.model,
  }) : super(
          notifier: model,
        );

  static GroupsModel? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GroupsModelProvider>()
        ?.model;
  }
}
