import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

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
        Center(
          child: SizedBox(
            width: 100,
            height: 42.67,
            child: Image.asset('assets/logo_colour.png'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 24,
          ),
        ),
        Text(
          'Sign Up',
          style: setTextStyle(SourceColor().black).copyWith(
            fontSize: 22.0,
            fontWeight: regular,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Silahkan isi data diri anda untuk daftar akun',
          style: setTextStyle(NeutralColor().neutral60).copyWith(
            fontSize: 12.0,
            fontWeight: regular,
          ),
        ),
        const SizedBox(height: 30.0),
      ],
    );
  }
}
