part of 'todo_filter_bloc.dart';

abstract class TodoFilterState extends Equatable {
  const TodoFilterState();
  
  @override
  List<Object> get props => [];
}

class TodoFilterLoading extends TodoFilterState {}

class TodoFilterLoaded extends TodoFilterState {
  final List<ToDo> filteredToDo;
  final ToDoFilter todoFilter;

  const TodoFilterLoaded({required this.filteredToDo, this.todoFilter=ToDoFilter.all}); 

  @override
  List<Object> get props => [
    filteredToDo,
    todoFilter,
  ];
}
