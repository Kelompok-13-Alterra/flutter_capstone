// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_capstone/screens/sign_up/sign_up_screen.dart';

class FooterSignUp extends StatelessWidget {
  const FooterSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'You have an account? ',
        style: setTextStyle(NeutralColor().neutral50)
            .copyWith(fontSize: 12, fontWeight: regular),
        children: <TextSpan>[
          TextSpan(
            text: 'Login Here',
            style: setTextStyle(SourceColor().seed)
                .copyWith(fontSize: 12, fontWeight: bold),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, '/login');
              },
          ),
        ],
      ),
    );
  }
}
