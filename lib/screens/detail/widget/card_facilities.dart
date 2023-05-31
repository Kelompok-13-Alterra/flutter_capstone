import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CardFacilities extends StatelessWidget {
  final String text;
  final String logo;

  const CardFacilities({super.key, required this.text, required this.logo});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: const Color(0xFFD6E3FF),
          ),
          child: Center(
            child: SvgPicture.asset(logo),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: setTextStyle(NeutralColor().neutral0)
              .copyWith(fontWeight: semiBold, fontSize: 11),
        ),
      ],
    );
  }
}
