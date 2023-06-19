import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

class ConnectionErrorScreen extends StatelessWidget {
  const ConnectionErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/icons/errors/connection_error.png'),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Sepertinya koneksimu terputus",
                style: setTextStyle(NeutralColor().neutral0)
                .copyWith(fontWeight: bold,fontSize: 16),
                ),

              const SizedBox(
                height: 10,
              ),
              Text(
                "Coba periksa koneksi internet kamu atau coba beberapa saat lagi",
                  textAlign: TextAlign.center,
                style: setTextStyle(NeutralColor().neutral50)
                  .copyWith(fontWeight:medium,fontSize: 14 ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
