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
              //final homeViewModel = Provider.of<HomeViewModel>(context);
              return ListView.builder(
                  itemCount: office.listBooked.length,
                  itemBuilder: (context, index) {
                    var data = office.listBooked[index];
                    return OrderWidget(
                      urlImg: office.listBooked[index].office.imageUrl,
                      title: office.listBooked[index].office.name,
                      rating: 4.6,
                      type: office.listBooked[index].office.type,
                      duration:
                          '${office.listBooked[index].office.open.substring(0, 5)} - ${office.listBooked[index].office.close.substring(0, 5)}',
                      status: 'Booked',
                      // route: '/detail-schedule',
                      buttonText1: 'Change Schedule',
                      routeButton1: () {
                        final officeIDDetail =
                            office.listBooked[index].office.id;
                        Navigator.pushNamed(
                          context,
                          '/reschedule',
                          arguments: {
                            'ID': office.listBooked[index].idTransaction,
                            'officeId': office.listBooked[index].office.id,
                          },
                        );
                      },
                      buttonText2: 'Cancel Book',
                      routeButton2: () {},
                      // transactionId: ,
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
