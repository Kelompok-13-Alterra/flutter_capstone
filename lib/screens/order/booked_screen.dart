import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/order/booked_model.dart';
import 'package:flutter_capstone/screens/order/widget/order_widget.dart';
import 'package:provider/provider.dart';

import '../../view_model/home/home_view_model.dart';

class BookedOrderScreen extends StatefulWidget {
  final List<Booked> bookedList;
  const BookedOrderScreen({Key? key, required this.bookedList})
      : super(key: key);

  @override
  State<BookedOrderScreen> createState() => _BookedOrderScreenState();
}

class _BookedOrderScreenState extends State<BookedOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, office, child) => Container(
        margin: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: widget.bookedList.length,
          itemBuilder: (context, index) {
            var data = widget.bookedList[index];
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
              buttonText1: 'Change Schedule',
              routeButton1: '/detail-schedule',
              buttonText2: 'Cancel Book',
              routeButton2: '',
            );
          },
        ),
      ),
    );
  }
}
