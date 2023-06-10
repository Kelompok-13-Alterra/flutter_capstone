import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter_capstone/screens/payment/transaction_failed_screen.dart';

class PaymentViewModel extends ChangeNotifier {
  //Detail Payment
  //===========================================================================
  bool isVirtualVisible = true;
  bool isBankVisible = false;
  bool isEWalletVisible = false;
  bool isTotalPembayaranVisible = false;
  String selectedValue = 'Virtual Account BNI';

  void setSelectedValue(String value) {
    selectedValue = value;
    notifyListeners();
  }

  void toggleVirtualVisible() {
    isVirtualVisible = !isVirtualVisible;
    isBankVisible = false;
    isEWalletVisible = false;
    isTotalPembayaranVisible = false;
    notifyListeners();
  }

  void toggleBankVisible() {
    isVirtualVisible = false;
    isBankVisible = !isBankVisible;
    isEWalletVisible = false;
    isTotalPembayaranVisible = false;
    notifyListeners();
  }

  void toggleEWalletVisible() {
    isVirtualVisible = false;
    isBankVisible = false;
    isEWalletVisible = !isEWalletVisible;
    isTotalPembayaranVisible = false;
    notifyListeners();
  }

  void toggleTotalPembayaranVisible() {
    isVirtualVisible = false;
    isBankVisible = false;
    isEWalletVisible = false;
    isTotalPembayaranVisible = !isTotalPembayaranVisible;
    notifyListeners();
  }

  //Detail Payment
  //===========================================================================
  Timer? _timer;
  int rekening = 0;
  final String jumlahTransfer = 'IDR 23.099';
  bool isDetailTransaksi = true;
  late DateTime _timerOffice;

  int get getRekening => rekening;

  setRekeningValue(int val) {
    rekening = val;
    notifyListeners();
  }

  void copyRekening(BuildContext context) {
    Clipboard.setData(ClipboardData(text: rekening.toString()));
    const snackBar = SnackBar(content: Text('Rekening berhasil disalin'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void copyJumlahTransfer(BuildContext context) {
    Clipboard.setData(ClipboardData(text: rekening.toString()));
    const snackBar =
        SnackBar(content: Text('Jumlah transfer berhasil disalin'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void startCountdown(BuildContext context) {
    _timerOffice = DateTime.now().add(const Duration(
        days: 1)); // Inisialisasi _timerOffice saat countdown dimulai
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (DateTime.now().isBefore(_timerOffice)) {
        notifyListeners();
      } else {
        stopCountdown();
        Navigator.pushReplacement(
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
    Duration remaining = _timerOffice.difference(DateTime.now());
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
