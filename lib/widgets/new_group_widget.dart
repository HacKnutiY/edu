import 'package:edu/models/new_group_model.dart';
import 'package:flutter/material.dart';

class GroupFormWidget extends StatefulWidget {
  const GroupFormWidget({super.key});

  @override
  State<GroupFormWidget> createState() => _GroupFormWidgetState();
}

class _GroupFormWidgetState extends State<GroupFormWidget> {
  NewGroupModel model = NewGroupModel();
  @override
  Widget build(BuildContext context) {
    return NewGroupModelProvider(
        model: model, child: const GroupFormWidgetBody());
  }
}

class GroupFormWidgetBody extends StatelessWidget {
  const GroupFormWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TFWidget(),
            TBWidget(),
          ],
        ),
      ),
    );
  }
}

class TBWidget extends StatelessWidget {
  const TBWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        NewGroupModelProvider.watch(context)?.model.saveToBox();
        Navigator.pop(context);
      },
      child: const Text("Save"),
    );
  }
}

class TFWidget extends StatelessWidget {
  const TFWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) =>
          NewGroupModelProvider.watch(context)?.model.name = value,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
      ),
    );
  }
}
