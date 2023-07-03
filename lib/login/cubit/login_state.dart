part of 'login_cubit.dart';

class LoginPageState extends Equatable {
  final String login;
  final String password;
  final String errorMessage;
  final ButtonStatus buttonStatus;

  const LoginPageState({
    required this.login,
    required this.password,
    required this.errorMessage,
    required this.buttonStatus,
  });

  const LoginPageState.initial()
      : login = '',
        password = '',
        errorMessage = '',
        buttonStatus = ButtonStatus.unActive;

  bool get isValid => login.isNotEmpty && password.isNotEmpty && buttonStatus == ButtonStatus.active ;

  @override
  List<Object> get props => [login, password, errorMessage, buttonStatus];
}

class UserPageIsLogin extends LoginPageState {
  const UserPageIsLogin({
    required super.login,
    required super.password,
    required super.errorMessage,
    required super.buttonStatus,
  });
}

class UserPageNotLogin extends LoginPageState {
  const UserPageNotLogin({
    required super.login,
    required super.password,
    required super.errorMessage,
    required super.buttonStatus,
  });
}
