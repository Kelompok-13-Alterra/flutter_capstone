import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/home/home_model.dart';
import 'package:flutter_capstone/model/order/booked_model.dart';
import 'package:flutter_capstone/screens/order/widget/order_widget.dart';
import 'package:flutter_capstone/view_model/home/home_view_model.dart';
import 'package:flutter_capstone/view_model/order/booked_view_model.dart';
import 'package:provider/provider.dart';

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
    final bookedViewModel =
        Provider.of<BookedViewModel>(context, listen: false);
    bookedViewModel.getBooked();
    bookedViewModel.getOffices();
  }

  @override
  Widget build(BuildContext context) {
    final bookedViewModel = Provider.of<BookedViewModel>(context);
    final bookedList = bookedViewModel.listBooked;
    final homeViewModel = Provider.of<HomeViewModel>(context);
    final officeList = homeViewModel.listOffice;
    return bookedList.isEmpty
        ? const Center(
            child: Text('No booked data available.'),
          )
        : ListView.builder(
            itemCount: bookedList.length,
            itemBuilder: (context, index) {
              final booked = bookedList[index];
              final office = bookedViewModel.listOffice.firstWhere(
                (office) => office.id == booked.officeId,
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

              if (!booked.status) {
                return const SizedBox
                    .shrink(); // Return an empty SizedBox if the status is "Cancelled"
              }
              return OrderWidget(
                urlImg: 'assets/office1.png',
                title: office.name,
                rating: 4.6,
                type: '',
                duration: '${booked.start} - ${booked.end}',
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
}
