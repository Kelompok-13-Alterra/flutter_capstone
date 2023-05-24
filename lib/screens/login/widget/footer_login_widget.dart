// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_capstone/screens/sign_up/sign_up_screen.dart';

class FooterLogin extends StatelessWidget {
  const FooterLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'You don\'t have an account? ',
        style: GoogleFonts.roboto(
          color: const Color(0xFF77777A),
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Register here',
            style: GoogleFonts.roboto(
                color: const Color(0xFF0074E5), fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, '/sign-up');
              },
          ),
        ],
      ),
    );
  }
}
