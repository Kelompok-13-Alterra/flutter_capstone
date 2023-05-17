import 'package:flutter/material.dart';
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
        ),
        Text(
          'Sign Up',
          style: GoogleFonts.roboto(
            fontSize: 22.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10.0),
        Text(
          'Silahkan isi data diri anda untuk daftar akun',
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
