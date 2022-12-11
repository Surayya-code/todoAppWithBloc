import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/todo/todo_bloc.dart';
import '../../models/todo_model.dart';
import 'add_todo_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do with Bloc'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddToDoScreen()));
              },
              icon: const Icon(Icons.add)),
        ],
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if(state is TodoLoading){
            return const CircularProgressIndicator();
          }
          if(state is TodoLoaded){
            return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Pending To Do:',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.todo.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _toDoCard(context,state.todo[index]);
                    }),
              ],
            ),
          );
          }
          else{
            return const Text('Something is wrong');
          }
        },
      ),
    );
  }

  Card _toDoCard(BuildContext context,ToDo todo) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            '#${todo.id}:${todo.task}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              IconButton(onPressed: () {
                context.read<TodoBloc>().add(UpdateToDo(todo: todo.copyWith(isCompleted: true)));
              }, icon: const Icon(Icons.add_task)),
              IconButton(onPressed: () {
                context.read<TodoBloc>().add(DeleteToDo(todo: todo));
              }, icon: const Icon(Icons.cancel)),
            ],
          ),
        ]),
      ),
    );
  }
}
