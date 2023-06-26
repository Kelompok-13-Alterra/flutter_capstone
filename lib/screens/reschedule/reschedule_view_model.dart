// ignore_for_file: deprecated_member_use, avoid_print, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:flutter_capstone/screens/payment/detail_payment_screen.dart';
import 'package:flutter_capstone/services/order/order_service.dart';
import 'package:flutter_capstone/services/reschedule/reschedule_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_capstone/core/init/const/api.dart';
import 'package:flutter_capstone/core/init/utils/shared_preferences.dart';
import 'package:flutter_capstone/style/text_style.dart';

import 'package:flutter_capstone/widgets/modal_bottom.dart';

class RescheduleViewModel extends ChangeNotifier {
  // ignore: body_might_complete_normally_nullable

  bool isLoading = false;
  Future<int?> checkRescheduleOffice(
    BuildContext context,
    int officeId,
    String start,
    String end,
    int? idTransaction,
    DateTimeRange? selectedDateRange,
    bool reschedule,
    String imgUrl,
  ) async {
    final url =
        '$baseUrl/api/v1/transaction/office/$officeId/availability-check';
    String token = await getToken();

    final headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final dio = Dio();
    try {
      final response = await dio.post(
        url,
        data: {
          'start': start,
          'end': end,
        },
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 201) {
        if (idTransaction != null) {
          updateRecheduleOffice(idTransaction, start, end);
        }

        return showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: FractionallySizedBox(
                heightFactor: 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 127.5,
                      height: 130,
                      child: Image.asset(
                          'assets/images/modal_bottom/retro_mac.png'),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    Text(
                      'All Set!!!',
                      style: setTextStyle(NeutralColor().neutral17)
                          .copyWith(fontSize: 16, fontWeight: semiBold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6, bottom: 16),
                      child: Text(
                        reschedule
                            ? 'Jadwal office berhasil diganti!!!'
                            : 'Lanjutkan Pemesanan',
                        textAlign: TextAlign.center,
                        style: setTextStyle(NeutralColor().neutral17).copyWith(
                          fontSize: 12,
                          fontWeight: regular,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (reschedule) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const BottomNavScreen(selectedIndex: 1)),
                              (route) => false,
                            );
                          } else if (reschedule == false) {
                            isLoading = true;
                            notifyListeners();
                            var res = await OrderService().createOrder(
                              context,
                              officeId: officeId,
                              startDate: start,
                              endDate: end,
                              paymentId: 'va-bni',
                            );

                            var transactionId = res.data.idTransaction;

                            isLoading = false;
                            notifyListeners();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPaymentScreen(
                                  paymentId: transactionId,
                                  officeId: officeId,
                                  image: imgUrl,
                                  selectedDateRange: start,
                                ),
                              ),
                            );
                          }
                        },
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor:
                              MaterialStateProperty.all(PrimaryColor().primary),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(100), // Bentuk border
                            ),
                          ),
                        ),
                        child: Text(
                          reschedule
                              ? 'Kembali'
                              : isLoading
                                  ? 'Memuat...'
                                  : 'Lanjutkan Pembayaran',
                          style:
                              setTextStyle(PrimaryColor().onPrimary).copyWith(
                            fontSize: 14,
                            fontWeight: semiBold,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }
      return response.data['status_code'] as int?;
    } on DioError catch (e) {
      if (e.response!.statusCode == 500) {
        return modalBottomSheet(context,
            img: 'assets/images/modal_bottom/retro_mac_error.png',
            title: 'Waduh?!',
            desc:
                'Tanggal yang kamu pilih tidak tersedia. Coba pilih\ntanggal yang lain.',
            path: () {
          Navigator.pop(context);
        }, buttonText: 'Pilih tanggal lain');
      }
      return null;
    }
  }

  Future<void> updateRecheduleOffice(int id, String start, String end) async {
    final response =
        await RescheduleService().updateTransactionSchedule(id, start, end);
    if (response.statusCode == 201) {
      print('Schedule Office successfully updated.');
    } else {
      print(
          'Failed to update Schedule Office. Error: ${response.statusMessage}');
    }
  }
}
