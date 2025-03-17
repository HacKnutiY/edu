import 'package:edu/entities/group.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NewGroupModel {
  String groupName = "";
  set name(String name) => groupName = name;
  Future<void> saveToBox() async {
    if (groupName.isNotEmpty) {
      if (!Hive.isAdapterRegistered(0)) {
        Hive.registerAdapter(GroupAdapter());
      }
      if (!Hive.isBoxOpen("groupsBox")) {
        var box = await Hive.openBox<Group>("groupsBox");
        await box.add(Group(name: groupName, index: box.values.length));
      } else {
        var box = await Hive.box<Group>("groupsBox");
        await box.add(Group(name: groupName, index: box.values.length));
      }
    }
  }
}

class NewGroupModelProvider extends InheritedWidget {
  final NewGroupModel model;
  const NewGroupModelProvider({
    required this.model,
    super.key,
    required super.child,
  });

  static NewGroupModelProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<NewGroupModelProvider>();
  }

  static InheritedElement? read(BuildContext context) {
    return context
        .getElementForInheritedWidgetOfExactType<NewGroupModelProvider>();
  }

  @override
  bool updateShouldNotify(covariant NewGroupModelProvider oldWidget) {
    return false;
  }
}
