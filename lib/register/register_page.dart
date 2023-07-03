import 'package:flutter/material.dart';
//import 'package:flutter_application_1/login/cubit/login_cubit.dart';
import 'package:flutter_application_1/todo/to_do_page.dart';
import 'package:flutter_application_1/widget/app_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/input_app.dart';
import '../widget/show_toast.dart';
import 'cubit/cubit/register_cubit.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: BlocProvider<RegisterPageCubit>(
        create: (context) => RegisterPageCubit(),
        child: BlocListener<RegisterPageCubit, RegisterPageState>(
          listener: (context, state) {
            if(state is RegisterPageDone){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ToDoPage()),
              );
            }else if(state is RegisterPageBlock){
              ShowToast(context, state.errorMessage);
            }
          },
          child: BlocBuilder<RegisterPageCubit, RegisterPageState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  InputApp(
                    onChanged: (newLogin) =>
                        context.read<RegisterPageCubit>().inputlogin(newLogin),
                    labelText: 'Login',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InputApp(
                    onChanged: (newPassword) => context
                        .read<RegisterPageCubit>()
                        .inputPassword(newPassword),
                    labelText: 'Password',
                  ),
                  const Spacer(),
                  AppButton(
                    title: 'Regist',
                    callBack: () =>
                        context.read<RegisterPageCubit>().register(),
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
