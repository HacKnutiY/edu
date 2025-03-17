import 'package:edu/models/groups_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'group.g.dart';

@HiveType(typeId: 0)
class Group {
  @HiveField(0)
  String name;
  @HiveField(1)
  int index;
  Group({required this.name, required this.index});
}

class GroupWidget extends StatelessWidget {
  Group group;
  GroupWidget({
    required this.group,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: const ScrollMotion(), children: [
        SlidableAction(
          onPressed: ((context) {
            if (Hive.isBoxOpen("groupsBox")) {
              deleteGroup(group.index);
            }
          }),
          backgroundColor:const  Color(0xFFFE4A49),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          icon: Icons.delete,
          label: 'Delete',
        ),
      ]),
      child: ListTile(
        title: Text(group.name.toString()),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}

Future<void> deleteGroup(int index) async {
  var box = Hive.box<Group>("groupsBox");
  await box.deleteAt(index);
}
