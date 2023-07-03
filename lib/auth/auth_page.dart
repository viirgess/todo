import 'package:flutter/material.dart';

import '../login/login_page.dart';
import '../register/register_page.dart';
import '../widget/app_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: AppButton(
                title: 'Login',
                callBack: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginPage()),
                  );
                },
              ),
            ),
            const SizedBox(
              width: 24,
            ),
            Expanded(
              child: AppButton(
                title: 'Register',
                callBack: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()
                        ),
                  );
                },
              ),
            ),
          ],
        ),
      )),
    );
  }
}
