import 'package:edu/entities/group.dart';
import 'package:edu/entities/task.dart';
import 'package:edu/ui/widgets/app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  registerAdapters();
  await Hive.openBox<Group>("groupsBox");
  await Hive.openBox<Task>("tasks_box");

  runApp(MyApp());
}

void registerAdapters() {
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(TaskAdapter());
  }
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(GroupAdapter());
  }
}
