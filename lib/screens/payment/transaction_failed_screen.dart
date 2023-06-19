// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_capstone/screens/detail/detail_screen.dart';

class TransactionFailedScreen extends StatefulWidget {
  int officeId;
  TransactionFailedScreen({super.key, required this.officeId});

  @override
  State<TransactionFailedScreen> createState() =>
      _TransactionFailedScreenState();
}

class _TransactionFailedScreenState extends State<TransactionFailedScreen> {
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    //   final args =
    //       ModalRoute.of(context)?.settings.arguments as BookingScheduleArgument;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => DetailScreen(
        //       buttonRoute: '/bottom-nav',
        //       textButton: 'Booking',
        //       officeId: widget.officeId,
        //       selectedDateRange: null,
        //       // officeId: null,
        //     ),
        //   ),
        //   // (route) => true,
        // );
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/payment/124.svg'),
              const SizedBox(
                height: 25,
              ),
              Text(
                'Transaksi Gagal',
                style: setTextStyle(const Color(0xFF101828))
                    .copyWith(fontWeight: semiBold, fontSize: 16),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Maaf, transaksinya gagal, tapi kamu nggak perlu \n khawatir. Silahkan dicoba lagi ya.',
                style: setTextStyle(const Color(0xFF475467))
                    .copyWith(fontWeight: medium, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 140,
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.transparent),
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                        side:
                            BorderSide(color: SourceColor().outline, width: 1),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const DetailScreen(
                    //       buttonRoute: null,
                    //       textButton: 'Pilih Metode Pembayaran',
                    //     ),
                    //   ),
                    // );
                    // if (mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          buttonRoute: '/booking',
                          textButton: 'Booking',
                          officeId: widget.officeId,
                          selectedDateRange: null,
                          reschedule: false,
                          // officeId: null,
                        ),
                      ),
                      // (route) => false,
                    );
                    // }
                  },
                  child: Text(
                    'Booking Office',
                    style: setTextStyle(PrimaryColor().primary)
                        .copyWith(fontWeight: semiBold, fontSize: 14),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
