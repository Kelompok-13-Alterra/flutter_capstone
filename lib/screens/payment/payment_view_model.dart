import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_capstone/model/midtrans/midtrans_model.dart';
import 'dart:async';
import 'package:flutter_capstone/screens/payment/transaction_failed_screen.dart';
import 'package:flutter_capstone/services/midtrans/midtrans_service.dart';

class PaymentViewModel extends ChangeNotifier {
  //Detail Payment
  //===========================================================================
  bool isVirtualVisible = true;
  bool isBankVisible = false;
  bool isEWalletVisible = false;
  bool isTotalPembayaranVisible = false;
  String selectedValue = 'Virtual Account BNI';

  set setSelectedValue(String value) {
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
  // String rekening = '';
  final String jumlahTransfer = 'IDR 23.099';
  bool isDetailTransaksi = true;
  DateTime? _timerOffice;
  int? price;
  int? discount;
  int? tax;
  int? totalPrice;
  String paymentStatus = '';
  int transactionId = 0;
  MidtransPaymentModel? _midtransModel;

  // String get getRekening => rekening;
  int get getPrice => price!;
  int get getDiscount => discount!;
  int get getTax => tax!;
  int get getTotalPrice => totalPrice!;
  String get getPaymentStatus => paymentStatus;
  int get getTransactionId => transactionId;
  MidtransPaymentModel get getMidtransModel =>
      _midtransModel ?? MidtransPaymentModel();

  MidtransService midtransService = MidtransService();

  set setPrice(int val) {
    price = val;
    notifyListeners();
  }

  set setDiscount(int val) {
    discount = val;
    notifyListeners();
  }

  set setTax(int val) {
    tax = val;
    notifyListeners();
  }

  set setTotalPrice(int val) {
    totalPrice = val;
    notifyListeners();
  }

  set setTransactionId(int val) {
    transactionId = val;
    notifyListeners();
  }

  set setPaymentStatus(String value) {
    paymentStatus = value;
    notifyListeners();
  }

  // void copyRekening(BuildContext context) {
  //   Clipboard.setData(ClipboardData(text: rekening));
  //   const snackBar = SnackBar(content: Text('Rekening berhasil disalin'));
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  // void copyJumlahTransfer(BuildContext context) {
  //   Clipboard.setData(ClipboardData(text: rekening));
  //   const snackBar =
  //       SnackBar(content: Text('Jumlah transfer berhasil disalin'));
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

  void startCountdown(BuildContext context, int officeId) {
    _timerOffice = DateTime.now().add(const Duration(minutes: 3));
    // _timer?.cancel();

    // Inisialisasi _timerOffice saat countdown dimulai
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (DateTime.now().isBefore(_timerOffice!)) {
        notifyListeners();
      } else {
        stopCountdown();
        SchedulerBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => TransactionFailedScreen(officeId: officeId),
            ),
            /*used to ensure that when the back button is pressed the user is navigated to the "/bottom-nav" -> 
            "To remove routes until a route with a certain name, use the RoutePredicate returned from ModalRoute.withName"*/
            ModalRoute.withName('/bottom-nav'),
          );
        });
      }
    });
  }

  void stopCountdown() {
    // notifyListeners();
    return _timer?.cancel();
  }

  String? getTimeRemaining() {
    Duration remaining =
        _timerOffice?.difference(DateTime.now()) ?? const Duration();
    int hours = remaining.inHours;
    int minutes = remaining.inMinutes % 60;
    int seconds = remaining.inSeconds % 60;
    return '$hours : $minutes : $seconds ';
  }

  void toggleDetailTransaksi() {
    isDetailTransaksi = !isDetailTransaksi;
    notifyListeners();
  }

  Future getMidtrans({required paymentId}) async {
    try {
      _midtransModel =
          await midtransService.getPayment(transactionId: paymentId);
      notifyListeners();
      // print(_midtransModel?.data?.office);
      return _midtransModel;
    } catch (e) {
      rethrow;
    }
  }
}
