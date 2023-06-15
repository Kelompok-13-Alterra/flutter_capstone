// ignore_for_file: avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/order/widget/order_widget.dart';
import 'package:flutter_capstone/view_model/order/booked_view_model.dart';
import 'package:provider/provider.dart';

class BookedOrderScreen extends StatefulWidget {
  const BookedOrderScreen({Key? key}) : super(key: key);

  @override
  State<BookedOrderScreen> createState() => _BookedOrderScreenState();
}

class _BookedOrderScreenState extends State<BookedOrderScreen> {
  late Future<dynamic> bookedDataViewModel;
  @override
  void initState() {
    final bookedViewModel =
        Provider.of<BookedViewModel>(context, listen: false);
    bookedDataViewModel = bookedViewModel.getOffice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
