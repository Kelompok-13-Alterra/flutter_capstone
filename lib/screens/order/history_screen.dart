import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/order/history_model.dart';
import 'package:flutter_capstone/view_model/order/history_view_model.dart';
import 'package:flutter_capstone/screens/order/widget/order_widget.dart';
import 'package:provider/provider.dart';

class HistoryOrderScreen extends StatefulWidget {
  const HistoryOrderScreen({Key? key, required List<History> historyList})
      : super(key: key);

  @override
  State<HistoryOrderScreen> createState() => _HistoryOrderScreenState();
}

class _HistoryOrderScreenState extends State<HistoryOrderScreen> {
  @override
  Widget build(BuildContext context) {
    final historyViewModel = Provider.of<HistoryViewModel>(context);
    final historyList = historyViewModel.listHistory;
    final officeList = historyViewModel.listOffice;

    return historyList.isEmpty
        ? const Center(
            child: Text('No history data available.'),
          )
        : ListView.builder(
            itemCount: historyList.length,
            itemBuilder: (context, index) {
              final history = historyList[index];
              final office =
                  officeList.length > index ? officeList[index] : null;

              String status = 'Booked';
              if (!history.status) {
                status = 'Cancelled';
              }

              return OrderWidget(
                urlImg: 'assets/office1.png',
                title: office != null ? office.name : '',
                rating: 4.6,
                type: office != null ? office.type : '',
                duration:
                    office != null ? '${office.open} - ${office.close}' : '',
                status: status,
                route: '/detail-schedule',
                buttonText1: 'Book Again',
                routeButton1: '/detail',
                buttonText2: 'Give Review',
                routeButton2: '/review',
              );
            },
          );
  }
}
