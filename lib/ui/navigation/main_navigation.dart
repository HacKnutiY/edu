import 'package:edu/ui/widgets/groups_widget.dart';
import 'package:edu/ui/widgets/new_task_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/group_tasks_widget.dart';
import '../widgets/new_group_widget.dart';

abstract class MainNavigationNames {
  static const String groupsScreen = '/';
  static const String newGroupScreen = '/new_group_screen';
  static const String groupTasksScreen = '/group_tasks';
  static const String newTaskScreen = '/group_tasks/new_task';
}

class MainNavigation {
  String initialRoute = MainNavigationNames.groupsScreen;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationNames.groupsScreen: (context) =>
        const GroupsWidget(), //groups
    MainNavigationNames.newGroupScreen: (context) => const GroupFormWidget(),
    //new_group
//new_task
  };
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationNames.groupTasksScreen:
        int groupKey = settings.arguments as int;

        return MaterialPageRoute(
            builder: (context) => GroupTasksWidget(
                  groupKey: groupKey,
                ));
      case MainNavigationNames.newTaskScreen:
        int groupKey = settings.arguments as int;

        return MaterialPageRoute(
            builder: (context) => NewTaskWidget(
                  groupKey: groupKey,
                ));

      default:
        return MaterialPageRoute(
            builder: (context) => const Text("Ошибка навигации"));
    }
  }
}
