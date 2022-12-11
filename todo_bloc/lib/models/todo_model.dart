import 'package:equatable/equatable.dart';

class ToDo extends Equatable{
  final String id;
  final String task;
  final String description;
    bool? isCompleted;
    bool? isCancelled;

  ToDo(
  {
   required this.id,
   required this.task, 
   required this.description,
   this.isCompleted,
   this.isCancelled}){
      isCancelled=isCancelled?? false;
      isCompleted=isCompleted?? false;
   }
   
   ToDo copyWith({
    String? id,
    String? task,
    String? description,
    bool? isCancelled,
    bool? isCompleted,
   }){
    return ToDo(
      id: id ?? this.id,
      task: task ?? this.task,
      description: description ??this.description,
      isCancelled: isCancelled?? this.isCancelled,
      isCompleted: isCompleted ?? this.isCompleted
    );
   }
   
     @override
     List<Object?> get props => [
      id,
      task,
      description,
      isCancelled,
      isCompleted,
     ];
  static List<ToDo> todo=[
  
  ] ;
}