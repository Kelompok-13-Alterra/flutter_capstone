import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/gestures.dart';

class FooterLogin extends StatelessWidget {
  const FooterLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'You don\'t have an account? ',
        style: GoogleFonts.roboto(
          color: Color(0xFF77777A),
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Register here',
            style: GoogleFonts.roboto(
                color: Color(0xFF0074E5), fontWeight: FontWeight.w600),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
