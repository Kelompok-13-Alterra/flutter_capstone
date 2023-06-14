import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_capstone/screens/detail/detail_screen.dart';

class TransactionFailedScreen extends StatelessWidget {
  const TransactionFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DetailScreen(
              buttonRoute: null,
              textButton: 'Pilih Metode Pembayaran',
            ),
          ),
        );
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
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailScreen(
                          buttonRoute: null,
                          textButton: 'Pilih Metode Pembayaran',
                        ),
                      ),
                    );
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
