import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_main/cart/view/main_view.dart';
// import 'package:todo_main/todo/todomain/view.dart';
// import 'package:todo_main/todo_2/view/main_view.dart';
// import 'package:todo_main/todo_2/view/sam_view.dart';
// import 'package:todo_main/todo/view.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Shopping());
  }
}
