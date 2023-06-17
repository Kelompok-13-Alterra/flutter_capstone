import 'package:flutter/material.dart';
import 'package:flutter_capstone/core/init/utils/price_convert.dart';
import 'package:flutter_capstone/model/home/home_model.dart';
import 'package:flutter_capstone/model/midtrans/midtrans_model.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuccessBookingScreen extends StatefulWidget {
  Data? bookingData;
  String dateData;
  SuccessBookingScreen({
    super.key,
    required this.bookingData,
    required this.dateData,
  });

  @override
  State<SuccessBookingScreen> createState() => _SuccessBookingScreenState();
}

class _SuccessBookingScreenState extends State<SuccessBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, '/bottom-nav');
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Text(
            'Detail Booking',
            style: setTextStyle(NeutralColor().neutral12)
                .copyWith(fontWeight: semiBold, fontSize: 16),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView(
          children: [
            // Transaksi sukses
            //===================================================================
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/icons/payment/check_circle.svg'),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'TRANSACTION SUCCESSFUL',
                  style: setTextStyle(NeutralColor().neutral20)
                      .copyWith(fontWeight: bold, fontSize: 22),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Booking ID : #ID20230506',
                  style: setTextStyle(SourceColor().black)
                      .copyWith(fontWeight: bold, fontSize: 14),
                ),
              ],
            ),

            // Detail Office Booking
            //===================================================================
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 130,
                        width: 117,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            "assets/images/home/office-list.jpg",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.bookingData?.office.name ?? '',
                            style: setTextStyle(NeutralColor().neutral20)
                                .copyWith(fontWeight: semiBold, fontSize: 16),
                          ),
                          const SizedBox(
                            height: 5,
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
                                "4.6",
                                style: setTextStyle(NeutralColor().neutral17)
                                    .copyWith(
                                        fontWeight: semiBold, fontSize: 13),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
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
                                widget.bookingData?.office.type.toUpperCase() ??
                                    '',
                                style: setTextStyle(NeutralColor().neutral60)
                                    .copyWith(
                                        fontWeight: semiBold, fontSize: 12),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 15,
                                color: NeutralColor().neutral60,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.bookingData?.office.location ?? '',
                                style: setTextStyle(NeutralColor().neutral60)
                                    .copyWith(
                                        fontWeight: semiBold, fontSize: 12),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),

                  // Detail Transaksi
                  //===================================================================
                  Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                        color: NeutralColor().neutral90,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Detail Transaksi',
                          style: setTextStyle(
                                  NeutralVariantColor().neutralVariant30)
                              .copyWith(fontWeight: semiBold, fontSize: 14),
                        ),
                        const SizedBox(
                          height: 17,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Harga Unit',
                              style: setTextStyle(
                                const Color(0xFF44474E),
                              ).copyWith(fontWeight: medium, fontSize: 12),
                            ),
                            Text(
                              'IDR ${priceConvert(widget.bookingData?.paymentData.price ?? 0)}',
                              style: setTextStyle(
                                const Color(0xFF44474E),
                              ).copyWith(fontWeight: semiBold, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Diskon',
                              style: setTextStyle(
                                const Color(0xFF44474E),
                              ).copyWith(fontWeight: medium, fontSize: 12),
                            ),
                            Text(
                              'IDR ${priceConvert(widget.bookingData?.paymentData.discount ?? 0)}',
                              style: setTextStyle(
                                const Color(0xFF44474E),
                              ).copyWith(fontWeight: semiBold, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pajak',
                              style: setTextStyle(
                                const Color(0xFF44474E),
                              ).copyWith(fontWeight: medium, fontSize: 12),
                            ),
                            Text(
                              'IDR ${priceConvert(widget.bookingData?.paymentData.tax ?? 0)}',
                              style: setTextStyle(
                                const Color(0xFF44474E),
                              ).copyWith(fontWeight: semiBold, fontSize: 14),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: setTextStyle(
                                NeutralColor().neutral10,
                              ).copyWith(fontWeight: medium, fontSize: 12),
                            ),
                            Text(
                              'IDR ${priceConvert(widget.bookingData?.paymentData.totalPrice ?? 0)}',
                              style: setTextStyle(
                                const Color(0xFF44474E),
                              ).copyWith(fontWeight: semiBold, fontSize: 14),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // Date-Start-End
                  //==============================================================
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      border: Border.all(
                        color: NeutralColor().neutral90,
                        width: 1.0,
                      ),
                    ),
                    height: 56,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Date',
                                style: setTextStyle(
                                        NeutralVariantColor().neutralVariant30)
                                    .copyWith(
                                        fontWeight: semiBold, fontSize: 14),
                              ),
                              Text(
                                widget.dateData,
                                style: setTextStyle(NeutralColor().neutral10)
                                    .copyWith(
                                        fontWeight: semiBold, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          color: NeutralColor().neutral90,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Start',
                                style: setTextStyle(
                                        NeutralVariantColor().neutralVariant30)
                                    .copyWith(
                                        fontWeight: semiBold, fontSize: 14),
                              ),
                              Text(
                                widget.bookingData?.office.open ?? '',
                                style: setTextStyle(NeutralColor().neutral10)
                                    .copyWith(
                                        fontWeight: semiBold, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          color: NeutralColor().neutral90,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'End',
                                style: setTextStyle(
                                        NeutralVariantColor().neutralVariant30)
                                    .copyWith(
                                        fontWeight: semiBold, fontSize: 14),
                              ),
                              Text(
                                widget.bookingData?.office.close ?? '',
                                style: setTextStyle(NeutralColor().neutral10)
                                    .copyWith(
                                        fontWeight: semiBold, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
