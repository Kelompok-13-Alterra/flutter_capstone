// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, avoid_print

// import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_capstone/screens/card-search-bar/office_recommendation_widget.dart';
import 'package:flutter_capstone/style/text_style.dart';

//import 'package:flutter_capstone/widget/card_rekomendasi_kantor.dart';

class OfficeCardWidget extends StatefulWidget {
  const OfficeCardWidget({super.key});

  @override
  State<OfficeCardWidget> createState() => _OfficeCardWidgetState();
}

class _OfficeCardWidgetState extends State<OfficeCardWidget> {
  List<String> listNamaKantor = [
    'Wellspace',
    'Seo Office',
    'Pase Office',
    'Agung Space',
  ];

  List price = [
    20.999,
    120.999,
    220.999,
    120.999,
  ];

  List<String> time = [
    '06:00  AM - 10:00 PM',
    '06:00  AM - 10:00 PM',
    '06:00  AM - 10:00 PM',
    '06:00  AM - 10:00 PM',
  ];

  List<String> location = [
    'Sunter Agung - 400 M',
    'Pekojan - 800 M',
    'Serdang - 500 M',
    'Keagungan - 1.2 KM',
  ];
  List<String> office = [
    'Co-Working Space',
    'Co-Working Space',
    'Office',
    'Co-Working Space',
  ];
  List rating = [
    4.6,
    4.8,
    4.6,
    4.8,
  ];
  List iconImage = [
    'assets/icons/office_card/star_purple500.png',
    'assets/icons/office_card/co_working_space.png',
    'assets/icons/office_card/location.png',
    'assets/icons/office_card/time.png',
  ];

  List imageKantor = [
    'assets/images/office_image/wellspace.png',
    'assets/images/office_image/seo_office.png',
    'assets/images/office_image/pase_office.png',
    'assets/images/office_image/agung_space.png',
  ];
  List<String> statusKantor = [
    'Open',
    'Open',
    'Close',
    'Open',
  ];
  final _searchBarController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SourceColor().white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: TextFormField(
              controller: _searchBarController,
              decoration: InputDecoration(
                filled: true,
                fillColor: NeutralColor().neutral96,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Ketik Nama Daerah',
                hintStyle: setTextStyle(NeutralVariantColor().neutralVariant30)
                    .copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 22,
                    horizontal: 19,
                  ),
                  child: Image.asset(
                    "assets/image/icon.png",
                    width: 18,
                    height: 12,
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(
                    right: 13,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.search,
                        color: NeutralVariantColor().neutralVariant30,
                      ),
                      const SizedBox(
                        width: 19.51,
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: CircleAvatar(
                          backgroundColor: PrimaryColor().primary,
                          child: Text(
                            "A",
                            style: setTextStyle(PrimaryColor().onPrimary)
                                .copyWith(fontSize: 16, fontWeight: medium),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 13.63, left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kantor yang cocok untuk kamu",
                  style: setTextStyle(BlackColor().black).copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
