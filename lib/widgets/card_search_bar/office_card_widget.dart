// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/widgets/card_search_bar/office_recommendation_widget.dart';

//import 'package:flutter_capstone/widget/card_rekomendasi_kantor.dart';

class OfficeCardWidget extends StatefulWidget {
  const OfficeCardWidget({super.key});

  @override
  State<OfficeCardWidget> createState() => _OfficeCardWidgetState();
}

class _OfficeCardWidgetState extends State<OfficeCardWidget> {
  //List data rekomendasi kantor
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
    'assets/image/star_purple500.png',
    'assets/image/co_working_space.png',
    'assets/image/location.png',
    'assets/image/time.png',
  ];

  List imageKantor = [
    'assets/image/wellspace.png',
    'assets/image/seo_office.png',
    'assets/image/pase_office.png',
    'assets/image/agung_space.png',
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
          ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: listNamaKantor.length,
            itemBuilder: (context, index) {
              return OfficeRecommendationWidget(
                img: imageKantor[index],
                statusKantor: statusKantor[index],
                namaKantor: listNamaKantor[index],
                imgRating: iconImage[0],
                rating: rating[index],
                imgCoWorkingOffice: iconImage[1],
                office: office[index],
                imgLocation: iconImage[2],
                location: location[index],
                imgTime: iconImage[3],
                time: time[index],
                price: price[index],
              );
            },
          ),
        ],
      ),
    );
  }
}





// Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(16),
//           child: Row(
//             children: [
//               Container(
//                 height: 130,
//                 width: 117,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: Colors.black,
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(12),
//                   child: Image.asset(
//                     "assets/OfficeCardWidgetscreen/office-list.jpg",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(left: 16.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             "Wellspace",
//                             style: GoogleFonts.roboto(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                             ),
//                           ),
//                           ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color(0xFF20E500),
//                                 elevation: 0,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                 ),
//                               ),
//                               onPressed: () {},
//                               child: Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 8),
//                                 child: Text(
//                                   "Open",
//                                   style: GoogleFonts.roboto(
//                                     color: Colors.white,
//                                     fontSize: 13,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ))
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.star,
//                             size: 15,
//                             color: Color(0xFFF5EF5A),
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(
//                             "4.6",
//                             style: GoogleFonts.roboto(
//                               color: const Color(0xFF292A2D),
//                               fontSize: 13,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           )
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 2,
//                       ),
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.location_on,
//                             size: 15,
//                             color: Color(0xFF909094),
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(
//                             "Mampang - 400",
//                             style: GoogleFonts.roboto(
//                               color: const Color(0xFF909094),
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           )
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 2,
//                       ),
//                       Row(
//                         children: [
//                           const Icon(
//                             Icons.av_timer,
//                             size: 15,
//                             color: Color(0xFF909094),
//                           ),
//                           const SizedBox(
//                             width: 5,
//                           ),
//                           Text(
//                             "06:00 AM - 10:00 PM",
//                             style: GoogleFonts.roboto(
//                               color: const Color(0xFF909094),
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           )
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 8,
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "IDR 20.999",
//                             style: GoogleFonts.roboto(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),