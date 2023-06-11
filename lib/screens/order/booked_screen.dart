import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/order/booked_model.dart';
import 'package:flutter_capstone/screens/order/widget/order_widget.dart';
import 'package:flutter_capstone/view_model/order/booked_view_model.dart';
import 'package:provider/provider.dart';

class BookedOrderScreen extends StatefulWidget {
  const BookedOrderScreen({Key? key, required List<Booked> bookedList})
      : super(key: key);

  @override
  State<BookedOrderScreen> createState() => _BookedOrderScreenState();
}

class _BookedOrderScreenState extends State<BookedOrderScreen> {
  @override
  Widget build(BuildContext context) {
    final bookedViewModel = Provider.of<BookedViewModel>(context);
    final bookedList = bookedViewModel.listBooked;
    final officeList = bookedViewModel.listOffice;

    return bookedList.isEmpty
        ? const Center(
            child: Text('No booked data available.'),
          )
        : ListView.builder(
            itemCount: bookedList.length,
            itemBuilder: (context, index) {
              final booked = bookedList[index];
              final office =
                  officeList.length > index ? officeList[index] : null;

              String status = 'Booked';
              if (!booked.status) {
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
                buttonText1: 'Change Schedule',
                routeButton1: '/detail-schedule',
                buttonText2: 'Cancel Book',
                routeButton2: '',
              );
            },
          );
  }
}
