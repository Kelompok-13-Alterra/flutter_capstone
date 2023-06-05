import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/order/widget/order_widget.dart';

class HistoryOrderScreen extends StatefulWidget {
  const HistoryOrderScreen({super.key});

  @override
  State<HistoryOrderScreen> createState() => _HistoryOrderScreenState();
}

class _HistoryOrderScreenState extends State<HistoryOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        OrderWidget(
            urlImg: 'assets/office1.png',
            title: 'Wellspace',
            rating: 4.6,
            type: 'Co-Working Space',
            duration: '10.00 AM - 06.00 PM',
            status: 'Booked',
            route: '/detail-schedule',
            buttonText1: 'Book Again',
            routeButton1: '/detail',
            buttonText2: 'Give Review',
            routeButton2: '/review')
      ],
    );
  }
}
