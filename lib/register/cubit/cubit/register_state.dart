part of 'register_cubit.dart';

class RegisterPageState extends Equatable {
  final String login;
  final String password;
  final String errorMessage;
  final ButtonStatus buttonStatus;

  RegisterPageState({
    required this.login,
    required this.password,
    required this.errorMessage,
    required this.buttonStatus,
  });

  const RegisterPageState.initial()
      : login = '',
        password = '',
        errorMessage = '',
        buttonStatus = ButtonStatus.unActive;

  bool get isValid =>
      login.isNotEmpty &&
      password.isNotEmpty &&
      buttonStatus == ButtonStatus.active;

  @override
  List<Object> get props => [login, password, errorMessage, buttonStatus];
}

class RegisterPageDone extends RegisterPageState {
  RegisterPageDone({
    required String login,
    required String password,
    required String errorMessage,
    required ButtonStatus buttonStatus,
  }) : super(
          login: login,
          password: password,
          errorMessage: errorMessage,
          buttonStatus: buttonStatus,
        );
}

class RegisterPageBlock extends RegisterPageState {
  RegisterPageBlock({
    required String login,
    required String password,
    required String errorMessage,
    required ButtonStatus buttonStatus,
  }) : super(
          login: login,
          password: password,
          errorMessage: errorMessage,
          buttonStatus: buttonStatus,
        );
}
