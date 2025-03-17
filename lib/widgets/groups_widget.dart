import 'package:edu/entities/group.dart';
import 'package:edu/models/groups_model.dart';
import 'package:flutter/material.dart';

class GroupsWidget extends StatefulWidget {
  const GroupsWidget({super.key});

  @override
  State<GroupsWidget> createState() => _GroupsWidgetState();
}

class _GroupsWidgetState extends State<GroupsWidget> {
  GroupsModel model = GroupsModel();

  @override
  Widget build(BuildContext context) {
    return GroupsModelProvider(model: model, child: GroupsWidgetBody());
  }
}

class GroupsWidgetBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    GroupsModel? model = GroupsModelProvider.watch(context);
    return Scaffold(
      body: ListView.separated(
          itemBuilder: ((context, index) => GroupWidget(
                group: model.groups[index],
              )),
          separatorBuilder: ((context, index) => const Divider(
                color: Colors.black,
                height: 2,
              )),
          itemCount: model!.groups.length),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, '/group_form/')},
        child: const Icon(Icons.add),
      ),
    );
  }
}
