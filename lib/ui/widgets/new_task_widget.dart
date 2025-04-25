import 'package:edu/models/new_task_model.dart';
import 'package:flutter/material.dart';

class NewTaskWidget extends StatefulWidget {
  final int groupKey;
  const NewTaskWidget({super.key, required this.groupKey});

  @override
  State<NewTaskWidget> createState() => _NewTaskWidgetState();
}

class _NewTaskWidgetState extends State<NewTaskWidget> {
  late NewTaskModel model;
  @override
  void initState() {
    model = NewTaskModel(groupKey: widget.groupKey);

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return NewTaskModelProvider(
      model: model,
      child: _NewTaskWidget(),
    ); //Provider
  }
}

class _NewTaskWidget extends StatelessWidget {
  const _NewTaskWidget({super.key});
  @override
  Widget build(BuildContext context) {
    var groupKey = NewTaskModelProvider.watch(context)?.groupKey;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) =>
                  NewTaskModelProvider.watch(context)?.title = value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            TextButton(
              onPressed: () {
                NewTaskModelProvider.watch(context)?.saveTask(groupKey!);
                Navigator.pop(context);
              },
              child: const Text("Save task"),
            ),
          ],
        ),
      ),
    );
  }
}
