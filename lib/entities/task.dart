import 'package:edu/models/group_tasks_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  bool isDone;

  Task({
    required this.title,
    required this.isDone,
  });
}

class TaskWidget extends StatelessWidget {
  int index;
  String name;

  TaskWidget({
    required this.name,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GroupTasksModel? model = GroupTasksProvider.watch(context);
    //при отрисовке можно получить группу по индексу, не по ключу
    Task? task = model?.group?.tasks?[index];
    Icon icon = task?.isDone == true ? Icon(Icons.done) : Icon(Icons.close);
    print(task?.isDone);

    return Slidable(
      startActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => model?.deleteTask(index),
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => model?.toggleDone(index),
        child: ListTile(
          title: Text(
            name.toString(),
          ),
          trailing: icon,
        ),
      ),
    );
  }
}
