import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/todo/todo_bloc.dart';
import '../../models/todo_model.dart';

class AddToDoScreen extends StatelessWidget {
  const AddToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerId = TextEditingController();
    TextEditingController controllerTask = TextEditingController();
    TextEditingController controllerDescription = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a To Do'),
      ),
      body: BlocListener<TodoBloc, TodoState>(
        listener: (context, state) {
          if(state is TodoLoaded){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('To Do Added!')));
          }
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              _inputField('ID', controllerId),
              _inputField('Task', controllerTask),
              _inputField('Description', controllerDescription),
              ElevatedButton(
                  onPressed: () {
                    var todo = ToDo(
                      id: controllerId.value.text,
                      task: controllerTask.value.text,
                      description: controllerDescription.value.text,
                    );
                    context.read<TodoBloc>().add(
                        AddToDo(todo: todo)
                      );
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Text('Add To Do')),
            ]),
          ),
        ),
      ),
    );
  }
}

Column _inputField(String field, TextEditingController controller) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '$field:',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      Container(
        height: 50,
        margin: const EdgeInsets.only(bottom: 10),
        width: double.infinity,
        child: TextFormField(
          controller: controller,
        ),
      ),
    ],
  );
}
