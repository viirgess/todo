// ignore_for_file: unused_field

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/utils/fire_key.dart';

import '../../locator/locator.dart';
import '../../storage/shared_preferences_service.dart';
import '../../widget/app_button.dart';

part 'login_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(const LoginPageState.initial());

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final SharedPreferencesService _sharedPreferencesService =
      locator<SharedPreferencesService>();

  inputlogin(String newLogin) {
    emit(
      LoginPageState(
        login: newLogin,
        password: state.password,
        errorMessage: '',
        buttonStatus: ButtonStatus.active,
      ),
    );
  }

  inputPassword(String newPassword) {
    emit(LoginPageState(
      login: state.login,
      password: newPassword,
      errorMessage: '',
      buttonStatus: ButtonStatus.active,
    ));
  }

  login() async {
    emit(LoginPageState(
        login: state.login,
        password: state.password,
        errorMessage: '',
        buttonStatus: ButtonStatus.loading));

    try {
      // ignore: unused_local_variable
      final uid = await firebaseAuth.signInWithEmailAndPassword(
          email: state.login, password: state.password);
          print(['=========>, ${uid}']);
      _sharedPreferencesService.setPreference(FireKey.uid, uid.toString());
      emit(UserPageIsLogin(
        login: state.login,
        password: state.password,
        errorMessage: '',
        buttonStatus: ButtonStatus.unActive,
      ));
      // ignore: unused_catch_clause
    } on FirebaseAuthException catch (e) {
      emit(UserPageNotLogin(
        login: state.login,
        password: state.password,
        errorMessage: e.message ?? '',
        buttonStatus: ButtonStatus.unActive,
      ));
    }
  }
}
