import 'package:flutter/material.dart';
import 'package:flutter_application_1/locator/locator.dart';
import 'package:flutter_application_1/todo/cubit/cubit/todo_cubit.dart';
import 'package:flutter_application_1/todo/todo_list.dart/todo_item.dart';
import 'package:flutter_application_1/todo/todo_list.dart/todo_list.dart';
import 'package:flutter_application_1/utils/color_source.dart';
import 'package:flutter_application_1/utils/text_style_source.dart';
import 'package:flutter_application_1/widget/input_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/app_button.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  TodoCubit cubit = locator<TodoCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TodoCubit>(
      create: (context) => cubit..getTodo(),
      child: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Welcome to TODO'),
            ),
            body: SafeArea(
              child: TodoList(
                action: (action, todo) {
                  if (action == ActionType.delete) {
                    cubit.deleteTodo(todo);
                  }
                },
                todoList: state.todoList,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: ColorSource.addButton,
              child: const Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return BlocListener<TodoCubit, TodoState>(
                      bloc: cubit,
                      listener: (context, state) {
                        if (state is TodoLoadedState) {
                          Navigator.pop(context);
                        }
                        //TodoLoadedState
                        // TODO: implement listener
                      },
                      child: BlocBuilder<TodoCubit, TodoState>(
                        bloc: cubit,
                        builder: (context, state) {
                          return FractionallySizedBox(
                            heightFactor: 0.7,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height: 10,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: ColorSource.lightGrey,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Enter data',
                                    style: TextStyleSource.body1,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
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
                                      cubit.setTitle(value);
                                    },
                                    labelText: 'title',
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
                                    onChanged: (value) {
                                      cubit.setShortDescription(value);
                                    },
                                    labelText: 'Description',
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
                                    onChanged: (value) {
                                      cubit.setDescription(value);
                                    },
                                    labelText: 'description',
                                    exp: true,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  AppButton(
                                      isEnable: state.isFilled,
                                      status: state.status,
                                      title: 'Create TODO',
                                      callBack: () {
                                        cubit.addTodo();
                                      },
                                      exp: true)
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
