// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/auth/cubit/cubit/auth_cubit.dart';
import 'package:flutter_application_1/storage/shared_preferences_service.dart';
import 'package:flutter_application_1/todo/to_do_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth/auth_page.dart';
import 'firebase_options.dart';
import 'locator/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  //locator<SharedPreferencesService>().clearData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<AuthCubit>(
        create: (context) => AuthCubit()..init(),
        child: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            if (state is AuthLogin) {
              return ToDoPage();
            } else if (state is AuthNotLogin) {
              return const AuthPage(
                title: '',
              );
            } else {
              return SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
