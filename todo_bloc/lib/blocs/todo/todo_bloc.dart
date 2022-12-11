
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoLoading()) {
    on<LoadToDo>(_onLoadToDo);
    on<AddToDo>(_onAddToDo);
    on<UpdateToDo>(_onUpdateToDo);
    on<DeleteToDo>(_onDeleteToDo);
  }

  FutureOr<void> _onLoadToDo(LoadToDo event, Emitter<TodoState> emit) {
    emit(
      TodoLoaded(todo: event.todo),
    );
  }

  FutureOr<void> _onAddToDo(AddToDo event, Emitter<TodoState> emit) {
    final state =this.state;
    if(state is TodoLoaded){
       emit(TodoLoaded(todo: List.from(state.todo)..add(event.todo)));
    }
  }

  FutureOr<void> _onUpdateToDo(UpdateToDo event, Emitter<TodoState> emit) {
    final state=this.state;
    if(state is TodoLoaded){
      List<ToDo> todo =(state.todo.map((todo) {
         return todo.id == event.todo.id ? event.todo : todo;
      } )).toList();

      emit(TodoLoaded(todo: todo));
    }
  }

  FutureOr<void> _onDeleteToDo(DeleteToDo event, Emitter<TodoState> emit) {
     final state=this.state;
    if(state is TodoLoaded){
      List<ToDo> todo =state.todo.where((todo) {
         return todo.id!= event.todo.id;
      }).toList();
      emit(TodoLoaded(todo: todo));
    }
  }
}
