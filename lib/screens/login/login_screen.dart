import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/login/widget/footer_login_widget.dart';
import 'package:flutter_capstone/screens/login/widget/form_login_widget.dart';
import 'package:flutter_capstone/screens/login/widget/header_login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 80.15),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: const [
                    HeaderLogin(),
                    FormLogin(),
                  ],
                ),
              ),
              const FooterLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
