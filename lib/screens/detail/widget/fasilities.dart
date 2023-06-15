import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/detail/widget/card_facilities.dart';
import 'package:flutter_capstone/style/text_style.dart';

class OfficeFalicities extends StatelessWidget {
  const OfficeFalicities({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> facilitiesData = {
      'facilities': [
        {
          'logo': "assets/icons/detail/water.svg",
          'text': 'Refill Water',
        },
        {
          'logo': "assets/detail/mic.svg",
          'text': 'Speaker',
        },
        {
          'logo': "assets/detail/board.svg",
          'text': 'White Boarding',
        },
        {
          'logo': "assets/detail/projector.svg",
          'text': 'Projector',
        },
      ]
    };
    return Column(
      children: [
        const Divider(
          color: Color(0xFFF5F5F5), // Warna garis
          thickness: 2.0, // Ketebalan garis
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Facilities",
                style: setTextStyle(BlackColor().black)
                    .copyWith(fontWeight: semiBold, fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: CardFacilities(
                      text: facilitiesData['facilities'][0]['text'],
                      logo: facilitiesData['facilities'][0]['logo'],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: CardFacilities(
                      text: facilitiesData['facilities'][1]['text'],
                      logo: facilitiesData['facilities'][1]['logo'],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: CardFacilities(
                      text: facilitiesData['facilities'][2]['text'],
                      logo: facilitiesData['facilities'][2]['logo'],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: CardFacilities(
                      text: facilitiesData['facilities'][3]['text'],
                      logo: facilitiesData['facilities'][3]['logo'],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const Divider(
          color: Color(0xFFF5F5F5), // Warna garis
          thickness: 2.0, // Ketebalan garis
        ),
      ],
    );
  }
}
