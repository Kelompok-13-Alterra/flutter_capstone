// ignore_for_file: avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/detail/detail_screen.dart';
import 'package:flutter_capstone/screens/order/history_view_model.dart';
import 'package:flutter_capstone/screens/order/widget/order_widget.dart';
import 'package:flutter_capstone/screens/review/review_screen.dart';
import 'package:flutter_capstone/style/text_style.dart';

import 'package:provider/provider.dart';

class HistoryOrderScreen extends StatefulWidget {
  const HistoryOrderScreen({Key? key}) : super(key: key);

  @override
  State<HistoryOrderScreen> createState() => _HistoryOrderScreenState();
}

class _HistoryOrderScreenState extends State<HistoryOrderScreen> {
  Future<dynamic>? historyDataViewModel;
  @override
  void initState() {
    final historyViewModel =
        Provider.of<HistoryViewModel>(context, listen: false);
    historyDataViewModel = historyViewModel.getOffice();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HistoryViewModel>(
      builder: (context, office, child) => Container(
        child: FutureBuilder(
          future: historyDataViewModel,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: PrimaryColor().primary,
                  ),
                ),
              );
            } else if (!snapshot.hasData) {
              return ListView.builder(
                  itemCount: office.listHistory.length,
                  itemBuilder: (context, index) {
                    var data = office.listHistory[index];
                    return OrderWidget(
                      imageUrl: data.office.imageUrl,
                      title: data.office.name,
                      rating: data.office.rating,
                      type: data.office.type,
                      duration: '${data.office.open} - ${data.office.close}',
                      statusPayment: data.paymentStatus!.isEmpty ||
                              data.paymentStatus == ''
                          ? 'untrack'
                          : data.paymentStatus!,
                      buttonText1: 'Book Again',
                      routeButton1: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              textButton: 'Booking via Aplication',
                              officeId: data.officeId,
                              buttonRoute: '/booking',
                              selectedDateRange: null,
                              idTransaction: null,
                              rating: data.office.rating,
                            ),
                          ),
                        );
                      },
                      buttonText2: 'Give Review',
                      routeButton2: () {
                        Navigator.pushNamed(
                          context,
                          '/review',
                          arguments: ReviewArguments(
                              transactionId:
                                  office.listHistory[index].office.id),
                        );
                      },
                    );
                  });
            } else {
              return const Center(
                child: Text('Data Tidak Ada atau Error'),
              );
            }
          },
        ),
      ),
    );
  }
}
