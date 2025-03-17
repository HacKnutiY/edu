import 'package:edu/widgets/example.dart';
import 'package:edu/widgets/groups_widget.dart';
import 'package:edu/widgets/new_group_widget.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("hello");
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const GroupsWidget(),
        '/group_form/': (context) => const GroupFormWidget(),
      },
      initialRoute: '/',
    );
  }
}
