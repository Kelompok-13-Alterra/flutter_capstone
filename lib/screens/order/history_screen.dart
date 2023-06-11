import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/order/history_model.dart';
import 'package:flutter_capstone/screens/order/widget/order_widget.dart';
import 'package:provider/provider.dart';

import '../../view_model/home/home_view_model.dart';

class HistoryOrderScreen extends StatefulWidget {
  final List<History> historyList;
  const HistoryOrderScreen({Key? key, required this.historyList})
      : super(key: key);

  @override
  State<HistoryOrderScreen> createState() => _HistoryOrderScreenState();
}

class _HistoryOrderScreenState extends State<HistoryOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, office, child) => Container(
        margin: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: widget.historyList.length,
          itemBuilder: (context, index) {
            var data = widget.historyList[index];

            return OrderWidget(
              urlImg: 'assets/office1.png',
              title: office.listOffice
                  .map((e) => e.name)
                  .where((element) =>
                      element.toString().contains(data.officeId.toString()))
                  .toString(),
              rating: 4.6,
              type: data.price.toString(),
              duration: '${data.start} - ${data.end}',
              status: 'Booked',
              route: '/detail-schedule',
              buttonText1: 'Book Again',
              routeButton1: '/detail',
              buttonText2: 'Give Review',
              routeButton2: '/review',
            );
          },
        ),
      ),
    );
  }
}
