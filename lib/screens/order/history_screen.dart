// ignore_for_file: avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/order/widget/order_widget.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/view_model/order/history_view_model.dart';
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
              //final homeViewModel = Provider.of<HomeViewModel>(context);
              return ListView.builder(
                  itemCount: office.listHistory.length,
                  itemBuilder: (context, index) {
                    var data = office.listHistory[index];

                    //office.listHistory[index].id
                    return OrderWidget(
                      urlImg: 'assets/office1.png',
                      title: office.listHistory[index].office.name,
                      rating: 4.6,
                      type: office.listHistory[index].office.type,
                      duration:
                          '${office.listHistory[index].office.open} - ${office.listHistory[index].office.close}',
                      status: 'Booked',
                      route: '/detail-schedule',
                      buttonText1: 'Book Again',
                      routeButton1: '/detail',
                      buttonText2: 'Give Review',
                      routeButton2: '/review',
                      // transactionId: data.id,
                      transactionId: office.listHistory[index].id,

                      // office.listHistory[index].id,
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
