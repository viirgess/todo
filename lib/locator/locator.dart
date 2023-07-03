import 'package:flutter_application_1/storage/shared_preferences_service.dart';
import 'package:flutter_application_1/todo/cubit/cubit/todo_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

setup() {
  locator
  ..registerSingleton<SharedPreferencesService>(SharedPreferencesService())
  ..registerSingleton<TodoCubit>(TodoCubit());
}
