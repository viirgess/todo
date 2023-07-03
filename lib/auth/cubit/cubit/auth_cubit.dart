// ignore_for_file: unused_local_variable
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/locator/locator.dart';
import 'package:flutter_application_1/utils/fire_key.dart';

import '../../../storage/shared_preferences_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final SharedPreferencesService _sharedPreferencesService =
      locator<SharedPreferencesService>();

  init() async{
    final uid =  await _sharedPreferencesService.getPreference(FireKey.uid);

     if (uid != null) {
       emit(AuthLogin());
    } else {
       emit(AuthNotLogin());
     }
   
  }
}
