import 'package:flutter/material.dart';
import 'package:flutter_capstone/widget/login-widget/footer-login.dart';
import 'package:flutter_capstone/widget/login-widget/form-login.dart';
import 'package:flutter_capstone/widget/login-widget/header-login.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(20.0),
            child: const Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    HeaderLogin(),
                    FormLogin(),
                  ],
                ),
                FooterLogin(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
