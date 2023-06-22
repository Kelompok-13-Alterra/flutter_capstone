import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/home/home_view_model.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/widgets/filter_content_widget.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  String? currentAddress;
  HomeWidget({super.key, this.currentAddress});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    var homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    return Consumer<HomeViewModel>(builder: (context, office, child) {
      int index = 0;
      for (int i = 0; i < office.listOffice.length; i++) {
        index = i;
        print(index);
      }
      if (homeViewModel.getFilters[homeViewModel.getSelectedFilterindex] ==
          'Semua') {
        return FutureBuilder(
          future: homeViewModel.getOffice(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return FilterContentWidget(
                childCount: snapshot.data
                        ?.where((element) => element.price < 150000)
                        .toList()
                        .length ??
                    0,
                condition: office.listOffice[index].price < 150000,
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return const Center(child: Text("error"));
            }
          },
        );
      }
      //
      else if (homeViewModel.getFilters[homeViewModel.getSelectedFilterindex] ==
          'Terdekat') {
        if (office.listOffice
            .where((element) => element.location == widget.currentAddress)
            .toList()
            .isNotEmpty) {
          return FutureBuilder(
            future: homeViewModel.getOffice(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return FilterContentWidget(
                  childCount: snapshot.data
                          ?.where((element) => element.price < 150000)
                          .toList()
                          .length ??
                      0,
                  condition: office.listOffice[index].price < 150000,
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return const Center(child: Text("error"));
              }
            },
          );
        } else {
          return SliverToBoxAdapter(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'There\'s no office arround your place!',
                style: setTextStyle(SourceColor().black),
              ),
            ],
          ));
        }
      }
      //
      else if (homeViewModel.getFilters[homeViewModel.getSelectedFilterindex] ==
          'Rating Baik') {
        return FutureBuilder(
          future: homeViewModel.getOffice(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return FilterContentWidget(
                childCount: snapshot.data
                        ?.where((element) => element.price < 150000)
                        .toList()
                        .length ??
                    0,
                condition: office.listOffice[index].price < 150000,
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return const Center(child: Text("error"));
            }
          },
        );
      }
      //
      else if (homeViewModel.getFilters[homeViewModel.getSelectedFilterindex] ==
          'Termurah') {
        return FutureBuilder(
          future: homeViewModel.getOffice(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return FilterContentWidget(
                childCount: snapshot.data
                        ?.where((element) => element.price < 150000)
                        .toList()
                        .length ??
                    0,
                condition: office.listOffice[index].price < 150000,
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return const Center(child: Text("error"));
            }
          },
        );
        // return FutureBuilder(
        //     future: homeViewModel.getOffice(),
        //     builder: (context, builder) {
        //       return FilterContentWidget(
        //         childCount: office.listOffice
        //             .where((element) => element.price < 150000)
        //             .toList()
        //             .length,
        //         condition: office.listOffice[index].price < 150000,
        //       );
        //     });
      } else {
        return Container();
      }
    });
  }
  // if (data.price < 100000) {
  //   return OfficeCard(officeData: data);
  // } else{
  //   return Container();
  // }
  //   ] else ...[
  //     Container()
  //   ]
  // ]
}
