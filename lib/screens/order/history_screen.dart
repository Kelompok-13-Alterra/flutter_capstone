import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/order/widget/order_widget.dart';
import 'package:flutter_capstone/view_model/order/history_view_model.dart';

import 'package:provider/provider.dart';

class HistoryOrderScreen extends StatefulWidget {
  const HistoryOrderScreen({Key? key});

  @override
  State<HistoryOrderScreen> createState() => _HistoryOrderScreenState();
}

class _HistoryOrderScreenState extends State<HistoryOrderScreen> {
  @override
  void initState() {
    super.initState();
    final historyViewModel =
        Provider.of<HistoryViewModel>(context, listen: false);
    historyViewModel.getBooked();
  }

  @override
  Widget build(BuildContext context) {
    final historyViewModel = Provider.of<HistoryViewModel>(context);
    final historyList = historyViewModel.listHistory;

    return historyList.isEmpty
        ? const Center(
            child: Text('No history data available.'),
          )
        : ListView.builder(
            itemCount: historyList.length,
            itemBuilder: (context, index) {
              final history = historyList[index];
              return OrderWidget(
                urlImg: 'assets/office1.png',
                title: "Wellspace",
                rating: 4.6,
                type: "",
                duration: '${history.start} - ${history.end}',
                status: history.status ? 'Booked' : 'Cancelled',
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
