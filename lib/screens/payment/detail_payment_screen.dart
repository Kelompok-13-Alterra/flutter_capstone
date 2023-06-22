// ignore_for_file: unnecessary_null_comparison

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_capstone/core/init/utils/price_convert.dart';
import 'package:flutter_capstone/screens/payment/success_booking_screen.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'payment_view_model.dart';

// ignore: must_be_immutable
class DetailPaymentScreen extends StatefulWidget {
  final int paymentId;
  final int officeId;
  final String selectedDateRange;

  const DetailPaymentScreen({
    super.key,
    required this.paymentId,
    required this.officeId,
    required this.selectedDateRange,
  });

  @override
  State<DetailPaymentScreen> createState() => _DetailPaymentScreenState();
}

class _DetailPaymentScreenState extends State<DetailPaymentScreen> {
  PaymentViewModel? paymentViewModel;

  void paymenStatus() async {
    await paymentViewModel?.getMidtrans(paymentId: widget.paymentId);
    paymentViewModel?.setPaymentStatus = '';
    paymentViewModel?.setPaymentStatus =
        paymentViewModel?.getMidtransModel.data?.status ?? '';
  }

  @override
  void didChangeDependencies() {
    paymentViewModel = Provider.of<PaymentViewModel>(context, listen: false);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    Future.microtask(() => Provider.of<PaymentViewModel>(context, listen: false)
        .getMidtrans(paymentId: widget.paymentId));

    Future.microtask(
        () => paymentViewModel?.startCountdown(context, widget.officeId));

    super.initState();

    paymenStatus();
  }

  @override
  void dispose() {
    //It`s because you called the inherited widget inside dispose of, in you're sample this is Provider.of<"Type">
    if (mounted) {
      Future.microtask(() => paymentViewModel?.stopCountdown());
    }

    super.dispose();
  }

  Widget buildDetailTransaksi(BuildContext context) {
    return Consumer<PaymentViewModel>(builder: (context, provider, _) {
      return Column(
        children: [
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
                provider.getMidtransModel.data?.paymentData.price == null
                    ? ""
                    : 'IDR ${priceConvert(provider.getMidtransModel.data?.paymentData.price)}',
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
                provider.getMidtransModel.data?.paymentData.discount == null
                    ? ''
                    : 'IDR ${priceConvert(provider.getMidtransModel.data?.paymentData.discount)}',
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
                provider.getMidtransModel.data?.paymentData.tax == null
                    ? ''
                    : 'IDR ${priceConvert(provider.getMidtransModel.data?.paymentData.tax)}',
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
                provider.getMidtransModel.data?.paymentData.totalPrice == null
                    ? ''
                    : 'IDR ${priceConvert(provider.getMidtransModel.data?.paymentData.totalPrice)}',
                style: setTextStyle(
                  const Color(0xFF44474E),
                ).copyWith(fontWeight: semiBold, fontSize: 14),
              ),
            ],
          )
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // print('This is payment ID in Detail Payment Screen ${widget.paymentId}');

    return Consumer<PaymentViewModel>(builder: (context, provider, _) {
      paymenStatus();
      // ignore: unrelated_type_equality_checks
      if (provider.getPaymentStatus == 'success') {
        provider.getMidtransModel.data?.status = '';
        provider.stopCountdown();

        return SuccessBookingScreen(
          bookingData: provider.getMidtransModel.data,
          dateData: widget.selectedDateRange,
        );

        // );
      } else {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            title: Text(
              'Detail Pembayaran',
              style: setTextStyle(NeutralColor().neutral12)
                  .copyWith(fontWeight: semiBold, fontSize: 16),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_sharp),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/bottom-nav');
              },
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  color: PrimaryColor().primary,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timer_sharp,
                        color: PrimaryColor().onPrimary,
                        size: 15,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Menunggu pembayaran ${provider.getTimeRemaining() ?? ''}',
                        style: setTextStyle(PrimaryColor().onPrimary)
                            .copyWith(fontWeight: semiBold, fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
              ListView(
                children: [
                  //Detail Office
                  //================================================================
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 38),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Utk API get detail office
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
                                child: provider.getMidtransModel.data!.office
                                        .imageUrl.isNotEmpty
                                    ? Image.network(provider
                                        .getMidtransModel.data!.office.imageUrl)
                                    : Image.network(
                                        'https://img.freepik.com/premium-photo/modern-corporate-architecture-can-be-seen-cityscape-office-buildings_410516-276.jpg',
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
                                  provider.getMidtransModel.data?.office.name ??
                                      '',
                                  style: setTextStyle(NeutralColor().neutral20)
                                      .copyWith(
                                          fontWeight: semiBold, fontSize: 16),
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
                                      style:
                                          setTextStyle(NeutralColor().neutral17)
                                              .copyWith(
                                                  fontWeight: semiBold,
                                                  fontSize: 13),
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
                                      provider.getMidtransModel.data?.office
                                              .type ??
                                          '',
                                      style:
                                          setTextStyle(NeutralColor().neutral60)
                                              .copyWith(
                                                  fontWeight: semiBold,
                                                  fontSize: 12),
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
                                      provider.getMidtransModel.data?.office
                                              .location ??
                                          '',
                                      style:
                                          setTextStyle(NeutralColor().neutral60)
                                              .copyWith(
                                                  fontWeight: semiBold,
                                                  fontSize: 12),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        //Text Silahkan melakukan pembayaran
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Text(
                            'Silahkan melakukan pembayaran di bawah ini',
                            style: setTextStyle(SourceColor().black)
                                .copyWith(fontWeight: semiBold, fontSize: 14),
                          ),
                        ),
                        //Transfer Pembayaran - Get Midtrans API

                        Container(
                          padding: const EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            border: Border.all(
                              color: NeutralColor().neutral90,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      'assets/icons/payment/BNI.svg'),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'BNI VA',
                                        style: setTextStyle(
                                                NeutralColor().neutral10)
                                            .copyWith(
                                                fontWeight: medium,
                                                fontSize: 16),
                                      ),
                                      Text(
                                        'PT OFFICE BUDDY',
                                        style: setTextStyle(
                                                NeutralColor().neutral50)
                                            .copyWith(
                                                fontWeight: semiBold,
                                                fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 14),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  color: Color(0xFFE8F2FF),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      provider.getMidtransModel.data
                                              ?.paymentData.vaNumber ??
                                          '',
                                      style:
                                          setTextStyle(NeutralColor().neutral10)
                                              .copyWith(
                                                  fontWeight: semiBold,
                                                  fontSize: 22),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.transparent),
                                        elevation:
                                            const MaterialStatePropertyAll(0),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            side: BorderSide(
                                                color: SourceColor().seed,
                                                width: 1),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Clipboard.setData(
                                          ClipboardData(
                                            text: provider.getMidtransModel.data
                                                    ?.paymentData.vaNumber ??
                                                '',
                                          ),
                                        );
                                        const snackBar = SnackBar(
                                            content: Text(
                                                'Rekening berhasil disalin'));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      child: Text(
                                        'Salin',
                                        style: setTextStyle(SourceColor().seed)
                                            .copyWith(
                                                fontWeight: semiBold,
                                                fontSize: 11),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              // Detail Jumlaj Transfer
                              //====================================================
                              Text(
                                'Jumlah Transfer',
                                style: setTextStyle(
                                        NeutralVariantColor().neutralVariant30)
                                    .copyWith(
                                        fontWeight: semiBold, fontSize: 14),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 14),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  color: Color(0xFFE8F2FF),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      provider.getMidtransModel.data
                                                  ?.paymentData.totalPrice ==
                                              null
                                          ? ''
                                          : priceConvert(provider
                                              .getMidtransModel
                                              .data
                                              ?.paymentData
                                              .totalPrice),
                                      style:
                                          setTextStyle(NeutralColor().neutral10)
                                              .copyWith(
                                                  fontWeight: semiBold,
                                                  fontSize: 22),
                                    ),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.transparent),
                                        elevation:
                                            const MaterialStatePropertyAll(0),
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            side: BorderSide(
                                                color: SourceColor().seed,
                                                width: 1),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {
                                        Clipboard.setData(
                                          ClipboardData(
                                              text: provider.getMidtransModel
                                                      .data?.paymentData.price
                                                      .toString() ??
                                                  ''),
                                        );
                                        const snackBar = SnackBar(
                                            content: Text(
                                                'Rekening berhasil disalin'));
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      },
                                      child: Text(
                                        'Salin',
                                        style: setTextStyle(SourceColor().seed)
                                            .copyWith(
                                                fontWeight: semiBold,
                                                fontSize: 11),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 16,
                        ),
                        //Detail  Transaksi
                        Container(
                          padding: const EdgeInsets.all(16),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4)),
                            border: Border.all(
                              color: NeutralColor().neutral90,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Detail Transaksi',
                                    style: setTextStyle(NeutralVariantColor()
                                            .neutralVariant30)
                                        .copyWith(
                                            fontWeight: semiBold, fontSize: 14),
                                  ),
                                  IconButton(
                                    constraints: const BoxConstraints(),
                                    padding: EdgeInsets.zero,
                                    onPressed: provider.toggleDetailTransaksi,
                                    icon: provider.isDetailTransaksi == true
                                        ? const Icon(Icons.arrow_drop_up)
                                        : const Icon(Icons.arrow_drop_down),
                                  )
                                ],
                              ),
                              provider.isDetailTransaksi == true
                                  ? buildDetailTransaksi(context)
                                  : Container(),
                              // ElevatedButton(
                              //     onPressed: () async {
                              //       await provider.getMidtrans(
                              //           paymentId: widget.paymentId);
                              //       print(
                              //           provider.getMidtransModel.data!.status);
                              //     },
                              //     child: Text('Refresh')),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          // body: Center(
          //   child: Text(
          //     'Countdown: ${getTimeRemaining()}',
          //     style: TextStyle(fontSize: 20),
          //   ),
          // ),
        );
      }
    });
  }
}
