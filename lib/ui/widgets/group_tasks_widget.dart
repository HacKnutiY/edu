import 'package:edu/entities/task.dart';
import 'package:edu/models/group_tasks_model.dart';
import 'package:edu/ui/navigation/main_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GroupTasksWidget extends StatefulWidget {
  final int groupKey;
  const GroupTasksWidget({super.key, required this.groupKey});

  @override
  State<GroupTasksWidget> createState() => _GroupTasksWidgetState();
}

class _GroupTasksWidgetState extends State<GroupTasksWidget> {
  late GroupTasksModel notifier;

  @override
  void initState() {
    notifier = GroupTasksModel(groupKey: widget.groupKey);
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   groupKey ??= ModalRoute.of(context)?.settings.arguments as int;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return GroupTasksProvider(
      notifier: notifier,
      child: _GroupTasksBody(
        groupKey: widget.groupKey,
      ),
    );
  }
}

class _GroupTasksBody extends StatelessWidget {
  final int? groupKey;
  const _GroupTasksBody({super.key, required this.groupKey});

  @override
  Widget build(BuildContext context) {
    final model = GroupTasksProvider.watch(context);
    final title = model?.group?.name ?? "Группа";
    List<Task> tasks = model?.group?.tasks?.toList() ?? <Task>[];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.separated(
          itemBuilder: ((context, index) =>
              TaskWidget(name: tasks[index].title, index: index)),
          separatorBuilder: ((context, index) => const Divider(
                color: Colors.black,
                height: 2,
              )),
          itemCount: tasks.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.pushNamed(context, MainNavigationNames.newTaskScreen,
              arguments: groupKey),
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
