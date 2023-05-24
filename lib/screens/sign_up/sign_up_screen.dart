import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/login/widget/header_login_widget.dart';
import 'package:flutter_capstone/screens/sign_up/widget/form_sign_up_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: const <Widget>[
                    HeaderLogin(),
                    FormSignup(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
