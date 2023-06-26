// ignore_for_file: unnecessary_brace_in_string_interps, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

// class OrderValue {
//   Booked? bookedData;
//   History? historyData;
// }

class OrderWidget extends StatelessWidget {
  // dynamic data;
  // Booked bookedData;
  // History historyData;
  final String? imageUrl;
  final String title;
  final double rating;
  final String type;
  final String duration;
  final String statusPayment;

  final String buttonText1;
  final Function()? routeButton1;
  final String buttonText2;
  final Function()? routeButton2;

  const OrderWidget({
    super.key,
    // required this.data,
    // required this.bookedData,
    // required this.historyData,
    required this.title,
    required this.imageUrl,
    required this.rating,
    required this.type,
    required this.duration,
    required this.statusPayment,
    required this.buttonText1,
    required this.routeButton1,
    required this.buttonText2,
    required this.routeButton2,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      imageUrl!.isEmpty || imageUrl == ''
                          ? "https://img.freepik.com/premium-photo/modern-corporate-architecture-can-be-seen-cityscape-office-buildings_410516-276.jpg"
                          : imageUrl!,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Wrap with flexible to know that the Row that's okay to be narrower than its intrinsic width
                            Flexible(
                              child: Text(
                                title,
                                overflow: TextOverflow.ellipsis,
                                style: setTextStyle(NeutralColor().neutral20)
                                    .copyWith(
                                  fontSize: 16,
                                  fontWeight: bold,
                                ),
                              ),
                            ),
                            Container(
                              height: 28,
                              width: 81,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: statusPayment == 'success'
                                    ? SuccessColor().green
                                    : statusPayment == 'deny'
                                        ? WarningColor().red
                                        : statusPayment == 'failure' ||
                                                statusPayment == 'pending' ||
                                                statusPayment == 'untrack'
                                            ? NeutralColor().neutral50
                                            : SourceColor().seed,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  statusPayment,
                                  style: setTextStyle(SourceColor().white)
                                      .copyWith(
                                    fontWeight: medium,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: SourceColor().yellow,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              rating.toStringAsFixed(1),
                              style: GoogleFonts.roboto(
                                color: NeutralColor().neutral17,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Image.asset(
                                type == 'office'
                                    ? 'assets/icons/office_card/office.png'
                                    : 'assets/icons/office_card/co_working_space.png',
                                width: 12,
                                height: 12,
                                color: NeutralColor().neutral60,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              child: Text(
                                type,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                  color: NeutralColor().neutral60,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.av_timer,
                              size: 15,
                              color: NeutralColor().neutral60,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              duration,
                              style: GoogleFonts.roboto(
                                color: NeutralColor().neutral60,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     //Image
            //     Container(
            //       width: 130,
            //       height: 100,
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(12),
            //         image: DecorationImage(
            //           image: NetworkImage(
            //             urlImg!.isEmpty || urlImg == ''
            //                 ? 'https://img.freepik.com/premium-photo/modern-corporate-architecture-can-be-seen-cityscape-office-buildings_410516-276.jpg'
            //                 : urlImg!,
            //           ),
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ),

            //     //Contain
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           title,
            //           overflow: TextOverflow.ellipsis,
            //           style: TextStyle(
            //             fontWeight: semiBold,
            //             fontSize: 16,
            //           ),
            //         ),
            //         const SizedBox(height: 4),
            //         Row(
            //           children: [
            //             Icon(Icons.star, color: SourceColor().yellow),
            //             const SizedBox(width: 4),
            //             Text(
            //               rating.toStringAsFixed(1),
            //               style: TextStyle(
            //                 fontWeight: medium,
            //                 fontSize: 13,
            //                 color: NeutralColor().neutral17,
            //               ),
            //             ),
            //           ],
            //         ),
            //         const SizedBox(height: 4),
            //         Row(
            //           children: [
            //             Icon(Icons.business,
            //                 size: 14, color: NeutralColor().neutral60),
            //             const SizedBox(width: 4),
            //             Text(
            //               type,
            //               style: TextStyle(
            //                 fontSize: 12,
            //                 fontWeight: medium,
            //                 color: NeutralColor().neutral60,
            //               ),
            //             ),
            //           ],
            //         ),
            //         const SizedBox(height: 4),
            //         Row(
            //           children: [
            //             Icon(Icons.access_time,
            //                 size: 14, color: NeutralColor().neutral60),
            //             const SizedBox(width: 4),
            //             Text(
            //               duration,
            //               style: TextStyle(
            //                 fontSize: 12,
            //                 fontWeight: medium,
            //                 color: NeutralColor().neutral60,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ],
            //     ),

            //     //Button status
            //     Container(
            //       height: 28,
            //       width: 81,
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            //       decoration: BoxDecoration(
            //         color: statusPayment == 'success'
            //             ? SuccessColor().green
            //             : statusPayment == 'deny'
            //                 ? WarningColor().red
            //                 : statusPayment == 'failure' ||
            //                         statusPayment == 'pending' ||
            //                         statusPayment == 'untrack'
            //                     ? NeutralColor().neutral50
            //                     : SourceColor().seed,
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //       child: Center(
            //         child: Text(
            //           statusPayment,
            //           style: TextStyle(
            //             color: SourceColor().white,
            //             fontWeight: medium,
            //             fontSize: 13,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            const SizedBox(
              height: 8,
            ),

            //Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Button 1
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: routeButton1,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: SourceColor().white,
                        backgroundColor: PrimaryColor().primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        visualDensity: VisualDensity.compact,
                      ),
                      child: Text(
                        buttonText1,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ),
                ),

                const Padding(padding: EdgeInsets.only(right: 10)),

                //Button 2
                Expanded(
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: routeButton2,
                      style: ElevatedButton.styleFrom(
                        foregroundColor: buttonText2 == 'Cancel Book'
                            ? ErrorColor().error50
                            : PrimaryColor().primary,
                        backgroundColor: SourceColor().white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: BorderSide(
                            color: buttonText2 == 'Cancel Book'
                                ? ErrorColor().error50
                                : PrimaryColor().primary,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        visualDensity: VisualDensity.compact,
                      ),
                      child: Text(buttonText2,
                          style: buttonText2 == 'Cancel Book'
                              ? setTextStyle(ErrorColor().error50).copyWith(
                                  fontSize: 14,
                                  fontWeight: medium,
                                )
                              : setTextStyle(PrimaryColor().primary).copyWith(
                                  fontSize: 14,
                                  fontWeight: medium,
                                )),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
