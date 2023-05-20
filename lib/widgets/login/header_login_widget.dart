import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SvgPicture.asset('assets/img/logo-sign.svg'),
        ),
        const SizedBox(height: 25.0),
        Text(
          'Sign In',
          style: GoogleFonts.roboto(
            fontSize: 22.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          'Silahkan masuk dengan akunmu yang sudah terdaftar di Office Buddy',
          style: GoogleFonts.roboto(
              fontSize: 12.0,
              color: Color(0xFF98A2B3),
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 30.0),
      ],
    );
  }
}
