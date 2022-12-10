import 'package:flutter/material.dart';

import '../../models/todo_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do with Bloc'),
        actions: [
          IconButton(onPressed: (){
            //Navigator.push(context, AddToScreen());
          },
           icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: const Text('Pending To Do:',
            style: TextStyle(fontSize: 18,color: Colors.black,
            fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: ToDo.todo.length,
            itemBuilder: 
          (BuildContext context,int index){
            return _toDoCard(ToDo.todo[index]);
          }),
        ],
      ),
    );
  }
  
  Card _toDoCard(ToDo todo) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
        [
         Text('#${todo.id}:${todo.task}',
         style: const TextStyle(fontSize: 18,
         fontWeight: FontWeight.bold),),
         Row(children: [
           IconButton(onPressed: (){},
            icon: const Icon(Icons.add_task)),
          IconButton(onPressed: (){},
            icon: const Icon(Icons.cancel)),
         ],),
        ]
        ),),
    );
  }
}