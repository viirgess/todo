import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/todo_dto.dart';

import '../locator/locator.dart';
import '../todo/cubit/cubit/todo_cubit.dart';
import '../utils/text_style_source.dart';
import '../widget/app_button.dart';
import '../widget/input_app.dart';

class EditTodoItem extends StatelessWidget {
  final TodoDTO todoItem;
  final int index;

  const EditTodoItem({
    super.key,
    required this.todoItem, required this.index,
  });

  //get cubit => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit TODO'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              'todoList',
              style: TextStyleSource.body1,
            ),
            const SizedBox(
              height: 10,
            ),
            InputApp(
              onChanged: (value) {
                locator<TodoCubit>().setTitle(value);
              },
              labelText: 'title',
              initialValue: todoItem.title,
              exp: true,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Short Description',
              style: TextStyleSource.body1,
            ),
            const SizedBox(
              height: 10,
            ),
            InputApp(
              onChanged: (value) {},
              labelText: 'Short Description',
              initialValue: todoItem.shortDescription,
              exp: true,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Description',
              style: TextStyleSource.body1,
            ),
            const SizedBox(
              height: 10,
            ),
            InputApp(
              onChanged: (value) {},
              labelText: 'description',
              initialValue: todoItem.description,
              exp: true,
            ),
            const Spacer(),
            AppButton(
                isEnable: true,
                //status: state.status,
                title: 'Edit TODO',
                callBack: () {
                  locator<TodoCubit>().EditTodo(index);
                },
                exp: true),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
