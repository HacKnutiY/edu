import 'package:edu/entities/group.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GroupsModel extends ChangeNotifier {
  GroupsModel() {
    setup();
  }
  List<Group> _groups = <Group>[];

  List<Group> get groups => _groups.toList();

  Future<void> setup() async {
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(GroupAdapter());
    }

    if (!Hive.isBoxOpen("groupsBox")) {
      var box = await Hive.openBox<Group>("groupsBox");
      _groups = box.values.toList();
      notifyListeners();
      box.listenable().addListener(() {
        _groups = box.values.toList();
        notifyListeners();
      });
    } else {
      var box = Hive.box<Group>("groupsBox");
      _groups = box.values.toList();
      notifyListeners();
      box.listenable().addListener(() {
        _groups = box.values.toList();
        notifyListeners();
      });
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
