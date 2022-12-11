part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}
class LoadToDo extends TodoEvent{
  final List<ToDo> todo;

  const LoadToDo({this.todo=const <ToDo>[]});

   @override
 List<Object> get props =>[todo];
}
class AddToDo extends TodoEvent{
  final ToDo todo;
  const AddToDo({required this.todo});
}
class UpdateToDo extends TodoEvent{
  final ToDo todo;
  const UpdateToDo({required this.todo});
}
class DeleteToDo extends TodoEvent{
  final ToDo todo;
  const DeleteToDo({required this.todo}); 
}
