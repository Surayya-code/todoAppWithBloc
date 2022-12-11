import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/todo/todo_bloc.dart';
import 'models/todo_model.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => TodoBloc()
              ..add(LoadToDo(todo: [
                ToDo(
                  id: '1',
                  task: 'Sample Todo 1',
                  description: 'This is a test To Do',
                ),
                ToDo(
                  id: '2',
                  task: 'Sample Todo 2',
                  description: 'This is a test To Do',
                ),
              ])))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.black,
          appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 2, 35, 51)),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
