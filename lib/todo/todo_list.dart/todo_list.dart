import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/todo_dto.dart';
import 'package:flutter_application_1/todo/todo_list.dart/todo_item.dart';

import '../../edit_todo_item/edit_todo_item.dart';

class TodoList extends StatelessWidget {
  final List<TodoDTO> todoList;
  final Function(ActionType, TodoDTO) action;

  const TodoList({
    Key? key,
    required this.todoList,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (_, index) {
          return TodoItem(
              todoItem: todoList[index],
              event: (eventType) => action(
                    eventType,
                    todoList[index],
                  ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditTodoItem(
                            todoItem: todoList[index],
                            index: index,
                          )),
                );
              });
        });
  }
}
