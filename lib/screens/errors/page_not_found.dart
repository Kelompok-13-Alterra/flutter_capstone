import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

class PageNotFoundScreen extends StatelessWidget {
  const PageNotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/icons/errors/page_not_found.png'),
              const SizedBox(
                height: 20,
              ),
                Text(
                "Halaman tidak ditemukan",
                style: setTextStyle(NeutralColor().neutral0)
                .copyWith(fontWeight: bold,fontSize: 16),
                ),

              const SizedBox(
                height: 10,
              ),
              Text(
                "Ada kesalahan di halaman yang kamu tuju, silahkan kembali ke beranda",
                textAlign: TextAlign.center,
                style: setTextStyle(NeutralColor().neutral50)
                  .copyWith(fontWeight:medium,fontSize: 14 ),
                ),


              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  side: BorderSide(
                    color: Colors.grey[500]!,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                ),
                child: const Text("Kembali ke home"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
