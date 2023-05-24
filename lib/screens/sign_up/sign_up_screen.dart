import 'package:flutter/material.dart';
import 'package:flutter_capstone/widgets/sign_up/form_sign_up_widget.dart';
import 'package:flutter_capstone/widgets/sign_up/header_sign_up_widget.dart';

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
            child: const Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
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
