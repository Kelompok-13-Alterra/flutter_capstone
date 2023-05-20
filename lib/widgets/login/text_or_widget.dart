import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextOr extends StatelessWidget {
  const TextOr({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: const Divider(
              color: Color(0xFF77777A),
              thickness: 1.0,
            ),
          ),
        ),
        Text(
          "OR",
          style: GoogleFonts.roboto(
            color: Color(0xFF77777A),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: const Divider(
              color: Color(0xFF77777A),
              thickness: 1.0,
            ),
          ),
        ),
      ],
    );
  }
}
