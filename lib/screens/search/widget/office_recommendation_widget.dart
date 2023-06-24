// ignore_for_file: prefer_const_declarations, unrelated_type_equality_checks, sized_box_for_whitespace, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/home/home_model.dart';
//import 'package:flutter_capstone/model/search_office/search_model.dart';
//import 'package:office_booking/model/search_office/search_model.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/core/init/utils/open_close.dart';

class OfficeRecommendationWidget extends StatelessWidget {
  final Office officeData;
  // final String namaKantor;
  // final String img;
  // final String imgRating;
  // final double rating;
  // final String office;
  // final String imgCoWorkingOffice;
  // final String imgLocation;
  // final String location;
  // final String imgTime;
  // final String time;
  // final int price;
  // final String open;
  // final String close;

  const OfficeRecommendationWidget({
    super.key,
    required this.officeData,
    // required this.namaKantor,
    // required this.img,
    // required this.rating,
    // required this.imgRating,
    // required this.imgCoWorkingOffice,
    // required this.office,
    // required this.imgLocation,
    // required this.location,
    // required this.time,
    // required this.imgTime,
    // required this.price,
    // required this.open,
    // required this.close,
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
                child: Image.network(
                  officeData.imageUrl.isEmpty
                      ? "https://img.freepik.com/premium-photo/modern-corporate-architecture-can-be-seen-cityscape-office-buildings_410516-276.jpg"
                      : officeData.imageUrl,
                  fit: BoxFit.fill,
                  // width: 116.87,
                  // height: 128,
                ),

                //  Image.asset(
                //   img,
                //   width: 116.87,
                //   height: 128,
                // ),
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
                          officeData.name,
                          style:
                              setTextStyle(NeutralColor().neutral20).copyWith(
                            fontSize: 16,
                            fontWeight: semiBold,
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                            color: checkOpeningStatus(
                                    officeData.open, officeData.close)
                                ? SuccessColor().green
                                : WarningColor().red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 16),
                            child: Text(
                              checkOpeningStatus(
                                      officeData.open, officeData.close)
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
                          'assets/icons/office_card/star_purple500.png',
                          width: 13.33,
                          height: 12.67,
                        ),
                        const SizedBox(
                          width: 4.33,
                        ),
                        Text(
                          officeData.rating.toStringAsFixed(1),
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
                          officeData.type == 'office'
                              ? 'assets/icons/office_card/office.png'
                              : 'assets/icons/office_card/co_working_space.png',
                          width: 13.33,
                          height: 12.67,
                        ),
                        const SizedBox(
                          width: 4.33,
                        ),
                        Text(
                          officeData.type,
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
                          'assets/icons/office_card/location.png',
                          width: 13.33,
                          height: 12.67,
                        ),
                        const SizedBox(
                          width: 4.33,
                        ),
                        Text(
                          officeData.location,
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
                          'assets/icons/office_card/time.png',
                          width: 13.33,
                          height: 12.67,
                        ),
                        const SizedBox(
                          width: 4.33,
                        ),
                        Text(
                          officeData.open,
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
                          "IDR ${officeData.price.toString()}",
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
