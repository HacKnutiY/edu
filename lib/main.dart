import 'package:edu/entities/group.dart';
import 'package:edu/widgets/app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(GroupAdapter());
  }

  await Hive.openBox<Group>("groupsBox");

  runApp(MyApp());
}
