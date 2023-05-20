import 'package:flutter/material.dart';
import 'package:flutter_capstone/widgets/login/footer_login_widget.dart';
import 'package:flutter_capstone/widgets/login/form_login_widget.dart';
import 'package:flutter_capstone/widgets/login/header_login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: const <Widget>[
                    HeaderLogin(),
                    FormLogin(),
                  ],
                ),
                const FooterLogin(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
