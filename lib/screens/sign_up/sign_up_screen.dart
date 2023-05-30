import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/sign_up/widget/footer_login_widget.dart';
import 'package:flutter_capstone/screens/sign_up/widget/form_sign_up_widget.dart';
import 'package:flutter_capstone/screens/sign_up/widget/header_sign_up_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: const Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  HeaderLogin(),
                  FormSignup(),
                ],
              ),
              const FooterSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}
