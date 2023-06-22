// ignore_for_file: unrelated_type_equality_checks

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
      return SliverList(
          delegate:
              SliverChildBuilderDelegate(childCount: office.listOffice.length,
                  (BuildContext context, int index) {
        var data = office.listOffice[index];
        if (homeViewModel.getFilters[homeViewModel.getSelectedFilterindex] ==
            'Semua') {
          return FilterContentWidget(
            // childCount: office.listOffice,
            condition: office.listOffice[index] == office.listOffice[index],
            officeId: data.id,
            data: data,
          );
        }
        //
        else if (homeViewModel
                .getFilters[homeViewModel.getSelectedFilterindex] ==
            'Terdekat') {
          if (office.listOffice
              .where((element) => element.location == widget.currentAddress)
              .toList()
              .isNotEmpty) {
            return FilterContentWidget(
              // childCount: office.listOffice,
              condition: office.listOffice[index].price < 150000,
              officeId: data.id,
              data: data,
            );
          } else {
            return Center(
              child: Text(
                'There\'s no office arround your place!',
                style: setTextStyle(SourceColor().black),
              ),
            );
          }
        }
        //
        else if (homeViewModel
                .getFilters[homeViewModel.getSelectedFilterindex] ==
            'Rating Baik') {
          return FilterContentWidget(
            // childCount: office.listOffice,
            condition: office.listOffice[index].price < 150000,
            officeId: data.id,
            data: data,
          );
        }
        //
        else if (homeViewModel
                .getFilters[homeViewModel.getSelectedFilterindex] ==
            'Termurah') {
          return FilterContentWidget(
            // childCount: office.listOffice,
            condition: office.listOffice[index].price < 150000,
            officeId: data.id,
            data: data,
          );
        } else {
          return Container();
        }
      }));
    });
  }
}
