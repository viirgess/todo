// ignore_for_file: unused_import

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/edit_todo_item/edit_todo_item.dart';

import '../../../locator/locator.dart';
import '../../../model/todo_dto.dart';
import '../../../storage/shared_preferences_service.dart';
import '../../../utils/fire_key.dart';
import '../../../widget/app_button.dart';
import '../../todo_list.dart/todo_item.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState.initial());

  final db = FirebaseFirestore.instance;

  final SharedPreferencesService _sharedPreferencesService =
      locator<SharedPreferencesService>();

  getTodo() async {
    try {
      db
          .collection(FireKey.todoCollection)
          .doc(await _sharedPreferencesService.getPreference(FireKey.uid))
          .snapshots()
          .listen((event) {
        emit(TodoState(todoList: [
          ...event.data()!['todos'].map((todo) => TodoDTO.fromJson(todo))
        ], todoItem: state.todoItem, status: ButtonStatus.unActive));
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  addTodo() async {
    emit(TodoState(
      todoList: [...state.todoList, state.todoItem],
      todoItem: state.todoItem,
      status: ButtonStatus.loading,
    ));
    try {
      db
          .collection(FireKey.todoCollection)
          .doc(await _sharedPreferencesService.getPreference(FireKey.uid))
          .set({'todos': state.todoList.map((TodoDTO todo) => todo.toJson())});
      emit(TodoLoadedState(
          todoList: state.todoList,
          todoItem: TodoDTO.clearData(),
          status: ButtonStatus.unActive));
    } on Exception catch (e) {
      print(e);
    }
  }

  deleteTodo(TodoDTO todo) async {
    List<TodoDTO> list = state.todoList;
    list.remove(todo);
    try {
      db
          .collection(FireKey.todoCollection)
          .doc(await _sharedPreferencesService.getPreference(FireKey.uid))
          .update({'todos': list.map((TodoDTO todo) => todo.toJson())});
      emit(TodoLoadedState(
          todoList: state.todoList,
          todoItem: TodoDTO.clearData(),
          status: ButtonStatus.unActive));
    } on Exception catch (e) {
      print(e);
    }
  }

  EditTodo(int index) async {
    List<TodoDTO> list = state.todoList;
    list.removeAt(index);
    list.add(state.todoItem);
    try {
      db
          .collection(FireKey.todoCollection)
          .doc(await _sharedPreferencesService.getPreference(FireKey.uid))
          .update({'todos': list.map((TodoDTO todo) => todo.toJson())});
      emit(TodoLoadedState(
          todoList: state.todoList,
          todoItem: state.todoItem,
          status: ButtonStatus.unActive));
    } on Exception catch (e) {
      print(e);
    }
  }

  setTitle(String title) {
    TodoDTO todoItem = state.todoItem;
    todoItem.title = title;
    emit(TodoState(
      todoList: state.todoList,
      todoItem: todoItem,
      status: state.status,
    ));
  }

  setShortDescription(String shortDescription) {
    TodoDTO todoItem = state.todoItem;
    todoItem.shortDescription = shortDescription;
    emit(TodoState(
      todoList: state.todoList,
      todoItem: todoItem,
      status: state.status,
    ));
  }

  setDescription(String description) {
    TodoDTO todoItem = state.todoItem;
    todoItem.description = description;
    emit(TodoState(
      todoList: state.todoList,
      todoItem: todoItem,
      status: state.status,
    ));
  }
}
