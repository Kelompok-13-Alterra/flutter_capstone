import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/home/home_model.dart';
import 'package:flutter_capstone/screens/order/widget/order_widget.dart';
import 'package:flutter_capstone/view_model/home/home_view_model.dart';
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
    historyViewModel.getOffices();
  }

  @override
  Widget build(BuildContext context) {
    final historyViewModel = Provider.of<HistoryViewModel>(context);
    final historyList = historyViewModel.listHistory;
    final homeViewModel = Provider.of<HomeViewModel>(context);
    final officeList = homeViewModel.listOffice;

    return historyList.isEmpty
        ? const Center(
            child: Text('No history data available.'),
          )
        : ListView.builder(
            itemCount: historyList.length,
            itemBuilder: (context, index) {
              final history = historyList[index];
              final office = historyViewModel.listOffice.firstWhere(
                (office) => office.id == history.officeId,
                orElse: () => Office(
                  id: 0,
                  name: '',
                  description: '',
                  capacity: 0,
                  type: '',
                  open: '',
                  close: '',
                  price: 0,
                  location: '',
                  facilities: '',
                  status: false,
                ),
              );

              if (!history.status) {
                return const SizedBox
                    .shrink(); // Return an empty SizedBox if the status is "Cancelled"
              }

              return OrderWidget(
                urlImg: 'assets/office1.png',
                title: office.name,
                rating: 4.6,
                type: '',
                duration: '${history.start} - ${history.end}',
                status: 'Booked',
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
