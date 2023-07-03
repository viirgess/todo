import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../locator/locator.dart';
import '../../../storage/shared_preferences_service.dart';
import '../../../utils/fire_key.dart';
import '../../../widget/app_button.dart';

part 'register_state.dart';

class RegisterPageCubit extends Cubit<RegisterPageState> {
  RegisterPageCubit() : super( RegisterPageState.initial());

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
final SharedPreferencesService _sharedPreferencesService =
      locator<SharedPreferencesService>();

  inputlogin(String newLogin) {
    emit(
      RegisterPageState(
        login: newLogin, 
        password: state.password, 
        errorMessage: '', 
        buttonStatus: ButtonStatus.active
        ),
    );
  }

  inputPassword(String newPassword) {
    emit(RegisterPageState(
      login: state.login, 
      password: newPassword, 
      errorMessage: '', 
      buttonStatus: ButtonStatus.active
      ));
  }

  register() async {
    emit(RegisterPageState(
        login: state.login,
        password: state.password,
        errorMessage: '',
        buttonStatus: ButtonStatus.loading));
    try {
      // ignore: unused_local_variable
      final uid = await firebaseAuth.createUserWithEmailAndPassword(
          email: state.login, password: state.password);
          print(['=========>, ${uid}']);
          _sharedPreferencesService.setPreference(FireKey.uid, uid.toString());
      emit(RegisterPageDone(
        login: state.login, 
        password: state.password, 
        errorMessage: '', 
        buttonStatus: ButtonStatus.unActive
        ));
      // ignore: unused_catch_clause
    } on FirebaseAuthException catch (e) {
       emit( RegisterPageBlock(
        login: state.login, 
        password: state.password, 
        errorMessage: e.message ?? '', 
        buttonStatus: ButtonStatus.unActive
        ));
    }
  }
}
