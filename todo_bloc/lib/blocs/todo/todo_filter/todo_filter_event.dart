part of 'todo_filter_bloc.dart';

abstract class TodoFilterEvent extends Equatable {
  const TodoFilterEvent();

  @override
  List<Object> get props => [];
}

class UpdateToDo extends TodoFilterEvent{
  final ToDoFilter todoFilter;

  const UpdateToDo({this.todoFilter=ToDoFilter.all});

  @override
  List<Object> get props => [todoFilter];
}
