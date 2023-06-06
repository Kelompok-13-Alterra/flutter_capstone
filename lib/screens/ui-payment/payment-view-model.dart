import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:flutter_capstone/screens/ui-payment/transaction_failed_screen.dart';

class PaymentViewModel extends ChangeNotifier {
  //Detail Payment
  //===========================================================================
  final BuildContext context;
  PaymentViewModel(this.context);
  Timer? _timer;
  final DateTime _targetTime = DateTime.now().add(const Duration(seconds: 1));
  final String rekening = '1234567890';
  final String jumlahTransfer = 'IDR 23.099';
  bool isDetailTransaksi = true;

  void copyRekening(BuildContext context) {
    Clipboard.setData(ClipboardData(text: rekening));
    const snackBar = SnackBar(content: Text('Rekening berhasil disalin'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void copyJumlahTransfer(BuildContext context) {
    Clipboard.setData(ClipboardData(text: rekening));
    const snackBar =
        SnackBar(content: Text('Jumlah transfer berhasil disalin'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void startCountdown(BuildContext context) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (DateTime.now().isBefore(_targetTime)) {
        notifyListeners();
      } else {
        stopCountdown();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const TransactionFailedScreen(),
          ),
        );
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

  void toggleDetailTransaksi() {
    isDetailTransaksi = !isDetailTransaksi;
    notifyListeners();
  }
}
