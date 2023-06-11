import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/order/widget/order_widget.dart';

class BookedOrderScreen extends StatefulWidget {
  const BookedOrderScreen({super.key});

  @override
  State<BookedOrderScreen> createState() => _BookedOrderScreenState();
}

class _BookedOrderScreenState extends State<BookedOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        OrderWidget(
            urlImg: 'assets/office1.png',
            title: 'Wellspace',
            rating: 4.6,
            type: 'Co-Working Space',
            duration: '10.00 AM - 06.00 PM',
            status: 'Booked',
            route: '/detail-schedule',
            buttonText1: 'Change Schedule',
            routeButton1: '/detail-schedule',
            buttonText2: 'Cancel Book',
            routeButton2: '')
      ],
    );
  }
}
