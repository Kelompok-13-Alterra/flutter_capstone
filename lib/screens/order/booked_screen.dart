import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/order/booked_model.dart';
import 'package:flutter_capstone/screens/order/widget/order_widget.dart';
import 'package:flutter_capstone/services/order/booked_service.dart';

class BookedOrderScreen extends StatefulWidget {
  const BookedOrderScreen({super.key});

  @override
  State<BookedOrderScreen> createState() => _BookedOrderScreenState();
}

class _BookedOrderScreenState extends State<BookedOrderScreen> {
  Future<List<Booked>>? _bookedData;

  @override
  void initState() {
    super.initState();
    _fetchBookedData();
  }

  Future<void> _fetchBookedData() async {
    final bookedService = BookedService();
    setState(() {
      _bookedData = bookedService.fetchBookedData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Booked>>(
      future: _bookedData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Failed to fetch booked data.'),
          );
        } else {
          final bookedList = snapshot.data;
          if (bookedList == null || bookedList.isEmpty) {
            return const Center(
              child: Text('No booked data available.'),
            );
          }
          return ListView.builder(
            itemCount: bookedList.length,
            itemBuilder: (context, index) {
              Booked booking = bookedList[index];
              return OrderWidget(
                urlImg: 'assets/office1.png',
                title: 'Wellspace',
                rating: 4.6,
                type: 'Co-Working Space',
                duration: '${booking.start} - ${booking.end}',
                status: 'Booked',
                route: '/detail-schedule',
                buttonText1: 'Change Schedule',
                routeButton1: '/detail-schedule',
                buttonText2: 'Cancel Book',
                routeButton2: '',
              );
            },
          );
        }
      },
    );
  }
}
