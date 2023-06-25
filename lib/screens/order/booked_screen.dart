// ignore_for_file: avoid_unnecessary_containers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/order/booked_view_model.dart';
import 'package:flutter_capstone/screens/order/widget/order_widget.dart';
import 'package:flutter_capstone/style/text_style.dart';
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
    return Consumer<BookedViewModel>(
      builder: (context, office, child) => Container(
        child: FutureBuilder(
          future: bookedDataViewModel,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: PrimaryColor().primary,
                  ),
                ),
              );
            } else if (!snapshot.hasData) {
              return ListView.builder(
                  itemCount: office.listBooked.length,
                  itemBuilder: (context, index) {
                    var data = office.listBooked[index];
                    return OrderWidget(
                      imageUrl: data.office.imageUrl,
                      title: data.office.name,
                      rating: data.office.rating,
                      type: data.office.type,
                      duration:
                          '${data.office.open.substring(0, 5)} - ${data.office.close.substring(0, 5)}',
                      statusPayment: data.paymentStatus!.isEmpty ||
                              data.paymentStatus == ''
                          ? 'untrack'
                          : data.paymentStatus!,
                      buttonText1: 'Change Schedule',
                      routeButton1: () {
                        final officeIDDetail = data.office.id;
                        Navigator.pushNamed(
                          context,
                          '/reschedule',
                          arguments: {
                            'ID': data.idTransaction,
                            'officeId': data.office.id,
                          },
                        );
                      },
                      buttonText2: 'Cancel Book',
                      routeButton2: () {},
                    );
                  });
            } else {
              return const Center(
                child: Text('Data Tidak Ada atau Error'),
              );
            }
          },
        ),
      ),
    );
  }
}
