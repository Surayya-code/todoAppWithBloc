part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
  
  @override
  List<Object> get props => [];
}

class TodoLoading extends TodoState {}
class TodoLoaded extends TodoState {
  final List<ToDo> todo;

  const TodoLoaded({this.todo=const <ToDo>[]});

 @override
 List<Object> get props =>[todo];
}
