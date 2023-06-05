import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'dart:async';

import 'package:flutter_svg/svg.dart';

class DetailPaymentScreen extends StatefulWidget {
  const DetailPaymentScreen({super.key});

  @override
  State<DetailPaymentScreen> createState() => _DetailPaymentScreenState();
}

class _DetailPaymentScreenState extends State<DetailPaymentScreen> {
  Timer? _timer;
  DateTime _targetTime = DateTime.now().add(Duration(days: 1));

  final String rekening = '1234567890';
  final String jumlahTransfer = 'IDR 23.099';

  bool isDetailTransaksi = true;

  void _copyRekening() {
    Clipboard.setData(ClipboardData(text: rekening));
    final snackBar = SnackBar(content: Text('Rekening berhasil disalin'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _copyJumlahTransfer() {
    Clipboard.setData(ClipboardData(text: rekening));
    final snackBar =
        SnackBar(content: Text('Jumlah transfer berhasil disalin'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  @override
  void dispose() {
    stopCountdown();
    super.dispose();
  }

  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (DateTime.now().isBefore(_targetTime)) {
        setState(() {});
      } else {
        stopCountdown();
        Navigator.pop(context);
      }
    });
  }

  void stopCountdown() {
    _timer?.cancel();
  }

  String getTimeRemaining() {
    Duration remaining = _targetTime.difference(DateTime.now());
    int hours = remaining.inHours;
    int minutes = remaining.inMinutes % 60;
    int seconds = remaining.inSeconds % 60;
    return '$hours : $minutes : $seconds ';
  }

  Widget buildDetailTransaksi(BuildContext) {
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
                Color(0xFF44474E),
              ).copyWith(fontWeight: medium, fontSize: 12),
            ),
            Text(
              'IDR 20.999',
              style: setTextStyle(
                Color(0xFF44474E),
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
                Color(0xFF44474E),
              ).copyWith(fontWeight: medium, fontSize: 12),
            ),
            Text(
              'IDR 0',
              style: setTextStyle(
                Color(0xFF44474E),
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
                Color(0xFF44474E),
              ).copyWith(fontWeight: medium, fontSize: 12),
            ),
            Text(
              'IDR 2.100',
              style: setTextStyle(
                Color(0xFF44474E),
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
              'IDR 23.099',
              style: setTextStyle(
                Color(0xFF44474E),
              ).copyWith(fontWeight: semiBold, fontSize: 14),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          'Detail Pembayaran',
          style: setTextStyle(NeutralColor().neutral12)
              .copyWith(fontWeight: semiBold, fontSize: 16),
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
                    'Menunggu pembayaran ${getTimeRemaining()}',
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 38),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              "assets/homescreen/office-list.jpg",
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
                              'Wellspace',
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
                                  "Co-Working Space",
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
                                  'Sunter Agung - 400 M',
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
                    //Text Silahkan melakukan pembayaran
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Silahkan melakukan pembayaran di bawah ini',
                        style: setTextStyle(SourceColor().black)
                            .copyWith(fontWeight: semiBold, fontSize: 14),
                      ),
                    ),
                    //Transfer Pembayaran
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
                              SvgPicture.asset('assets/payment/BNI.svg'),
                              const SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'BNI VA',
                                    style:
                                        setTextStyle(NeutralColor().neutral10)
                                            .copyWith(
                                                fontWeight: medium,
                                                fontSize: 16),
                                  ),
                                  Text(
                                    'PT OFFICE BUDDY',
                                    style:
                                        setTextStyle(NeutralColor().neutral50)
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  rekening,
                                  style: setTextStyle(NeutralColor().neutral10)
                                      .copyWith(
                                          fontWeight: semiBold, fontSize: 22),
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
                                        borderRadius: BorderRadius.circular(50),
                                        side: BorderSide(
                                            color: SourceColor().seed,
                                            width: 1),
                                      ),
                                    ),
                                  ),
                                  onPressed: _copyRekening,
                                  child: Text(
                                    'Salin',
                                    style: setTextStyle(SourceColor().seed)
                                        .copyWith(
                                            fontWeight: semiBold, fontSize: 11),
                                  ),
                                )
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
                                .copyWith(fontWeight: semiBold, fontSize: 14),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  jumlahTransfer,
                                  style: setTextStyle(NeutralColor().neutral10)
                                      .copyWith(
                                          fontWeight: semiBold, fontSize: 22),
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
                                        borderRadius: BorderRadius.circular(50),
                                        side: BorderSide(
                                            color: SourceColor().seed,
                                            width: 1),
                                      ),
                                    ),
                                  ),
                                  onPressed: _copyJumlahTransfer,
                                  child: Text(
                                    'Salin',
                                    style: setTextStyle(SourceColor().seed)
                                        .copyWith(
                                            fontWeight: semiBold, fontSize: 11),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Detail Transaksi',
                                style: setTextStyle(
                                        NeutralVariantColor().neutralVariant30)
                                    .copyWith(
                                        fontWeight: semiBold, fontSize: 14),
                              ),
                              IconButton(
                                constraints: const BoxConstraints(),
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  setState(() {
                                    isDetailTransaksi = !isDetailTransaksi;
                                  });
                                },
                                icon: isDetailTransaksi
                                    ? const Icon(Icons.arrow_drop_up)
                                    : const Icon(Icons.arrow_drop_down),
                              )
                            ],
                          ),
                          isDetailTransaksi
                              ? buildDetailTransaksi(context)
                              : Container(),
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
}