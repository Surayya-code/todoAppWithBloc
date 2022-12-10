import 'package:flutter/material.dart';

import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.amber,
        appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 2, 35, 51)),
      ),
      home: const HomeScreen(),
    );
  }
}

