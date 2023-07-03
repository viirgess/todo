import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/app_button.dart';
import 'package:flutter_application_1/widget/show_toast.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../todo/to_do_page.dart';
import '../widget/input_app.dart';
import 'cubit/login_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider<LoginPageCubit>(
        create: (context) => LoginPageCubit(),
        child: BlocListener<LoginPageCubit, LoginPageState>(
          listener: (context, state) {
            if (state is UserPageIsLogin) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ToDoPage()),
              );
            } else if (state is UserPageNotLogin) {
              ShowToast(context, state.errorMessage);
            }
          },
          child: BlocBuilder<LoginPageCubit, LoginPageState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  InputApp(
                    onChanged: (newLogin) =>
                        context.read<LoginPageCubit>().inputlogin(newLogin),
                    labelText: 'Login',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InputApp(
                    onChanged: (newPassword) => context
                        .read<LoginPageCubit>()
                        .inputPassword(newPassword),
                    labelText: 'Password',
                  ),
                  const Spacer(),
                  AppButton(
                    title: 'Login',
                    callBack: () => context.read<LoginPageCubit>().login(),
                    isEnable: state.isValid,
                    status: state.buttonStatus,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              );
            },
          ),
        ),
      )),
    );
  }
}
