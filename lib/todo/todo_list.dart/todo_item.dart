import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/color_source.dart';
import 'package:flutter_application_1/utils/text_style_source.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../model/todo_dto.dart';

enum ActionType { delete, edit }

class TodoItem extends StatefulWidget {
  final Function(ActionType) event;
  final TodoDTO todoItem;
  final Function onTap;
  
  const TodoItem({super.key, 
  required this.event, 
  required this.todoItem, 
  required this.onTap,
  });

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  void doNothing(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: widget.key,
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => widget.event(ActionType.delete),
            backgroundColor: ColorSource.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) => widget.event(ActionType.edit),
            backgroundColor: ColorSource.orange,
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: GestureDetector(
        onTap:()=> widget.onTap(),
        child: Container(
          color: ColorSource.todoItem.withOpacity(.5),
          margin: const EdgeInsets.only(bottom: 1),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                width: double.infinity,
                color: ColorSource.todoItem.withOpacity(.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.todoItem.title,
                          style: TextStyleSource.body1
                              .copyWith(color: ColorSource.white),
                        ),
                        Text(
                          widget.todoItem.shortDescription,
                          style: TextStyleSource.body1
                              .copyWith(color: ColorSource.white),
                        ),
                      ],
                    ),
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                      checkColor: ColorSource.black,
                      fillColor: MaterialStatePropertyAll(ColorSource.white),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: ColorSource.todoItem,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.favorite_border, color: ColorSource.white),
                    Text(
                      '28/03/2023',
                      style: TextStyleSource.body1
                          .copyWith(color: ColorSource.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
