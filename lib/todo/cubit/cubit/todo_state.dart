// ignore_for_file: override_on_non_overriding_member

part of 'todo_cubit.dart';

class TodoState{
  final List<TodoDTO> todoList;
  final TodoDTO todoItem;
  final ButtonStatus status;

  const TodoState({
    required this.todoList,
    required this.todoItem,
    required this.status,
  });

  TodoState.initial()
      : todoList = [],
        todoItem = TodoDTO(),
        status = ButtonStatus.unActive;

  bool get isFilled => todoItem.title.isNotEmpty && todoItem.shortDescription.isNotEmpty && todoItem.description.isNotEmpty;

  @override
  List<Object> get props => [todoList, todoItem, status];
}

// class TodoLoadingState extends TodoState {
//   const TodoLoadingState({required super.todoList, required super.todoItem});
// }

class TodoLoadedState extends TodoState {
  const TodoLoadedState({
    required super.todoList, 
    required super.todoItem, 
    required super.status,
    });
}
