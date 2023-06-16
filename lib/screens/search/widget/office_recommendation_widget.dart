// ignore_for_file: prefer_const_declarations, unrelated_type_equality_checks, sized_box_for_whitespace

import 'package:flutter/material.dart';
//import 'package:flutter_capstone/model/search_office/search_model.dart';
//import 'package:office_booking/model/search_office/search_model.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/core/init/utils/open_close.dart';

class OfficeRecommendationWidget extends StatelessWidget {
  final String namaKantor;
  final String statusKantor;
  final String img;
  final String imgRating;
  final double rating;
  final String office;
  final String imgCoWorkingOffice;
  final String imgLocation;
  final String location;
  final String imgTime;
  final String time;
  final int price;
  final String open;
  final String close;

  const OfficeRecommendationWidget({
    super.key,
    required this.namaKantor,
    required this.statusKantor,
    required this.img,
    required this.rating,
    required this.imgRating,
    required this.imgCoWorkingOffice,
    required this.office,
    required this.imgLocation,
    required this.location,
    required this.time,
    required this.imgTime,
    required this.price,
    required this.open,
    required this.close,
  });

  @override
  Widget build(BuildContext context) {
    //   SearchModel searchModel;
    bool isStatus = false;

    return Padding(
      padding: const EdgeInsets.only(bottom: 19.26, right: 19.09, left: 16),
      child: Container(
        width: double.infinity,
        // padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              height: 130,
              width: 117,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  img,
                  width: 116.87,
                  height: 128,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          namaKantor,
                          style:
                              setTextStyle(NeutralColor().neutral20).copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                            color: checkOpeningStatus(open, close)
                                ? SuccessColor().green
                                : WarningColor().red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          // decoration: BoxDecoration(
                          //   color: statusKantor == 'Open'
                          //       ? SuccessColor().green
                          //       : WarningColor().red,
                          //   borderRadius: BorderRadius.circular(12),
                          // ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            child: Text(
                              checkOpeningStatus(open, close)
                                  ? 'Open'
                                  : 'Close',
                              style: setTextStyle(SourceColor().white).copyWith(
                                fontSize: 13,
                                fontWeight: medium,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7.67,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          imgRating,
                          width: 13.33,
                          height: 12.67,
                        ),
                        const SizedBox(
                          width: 4.33,
                        ),
                        Text(
                          rating.toString(),
                          style:
                              setTextStyle(NeutralColor().neutral17).copyWith(
                            fontSize: 13,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7.67,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          imgCoWorkingOffice ==
                                      'assets/icons/office_card/co_working_space.png' &&
                                  office == 'coworking'
                              ? 'assets/icons/office_card/co_working_space.png'
                              : 'assets/icons/office_card/office.png',
                          width: 13.33,
                          height: 12.67,
                        ),
                        const SizedBox(
                          width: 4.33,
                        ),
                        Text(
                          office,
                          style:
                              setTextStyle(NeutralColor().neutral60).copyWith(
                            fontSize: 12,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7.67,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          imgLocation,
                          width: 13.33,
                          height: 12.67,
                        ),
                        const SizedBox(
                          width: 4.33,
                        ),
                        Text(
                          location,
                          style:
                              setTextStyle(NeutralColor().neutral60).copyWith(
                            fontSize: 12,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7.67,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          imgTime,
                          width: 13.33,
                          height: 12.67,
                        ),
                        const SizedBox(
                          width: 4.33,
                        ),
                        Text(
                          time,
                          style:
                              setTextStyle(NeutralColor().neutral60).copyWith(
                            fontSize: 12,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Text(
                          "IDR ${price.toString()}",
                          style:
                              setTextStyle(NeutralColor().neutral20).copyWith(
                            fontSize: 16,
                            fontWeight: regular,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
