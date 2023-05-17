import 'package:flutter/material.dart';
import 'package:flutter_capstone/widget/signup-widget/form_signup.dart';
import 'package:flutter_capstone/widget/signup-widget/header_signup.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
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
      ),
    );
  }
}
