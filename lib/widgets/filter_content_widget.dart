import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/home/home_model.dart';
import 'package:flutter_capstone/screens/detail/detail_screen.dart';
import 'package:flutter_capstone/screens/home/home_view_model.dart';
import 'package:flutter_capstone/screens/home/widget/office_card.dart';
import 'package:provider/provider.dart';

//This widget for list content office in home
class FilterContentWidget extends StatefulWidget {
  final bool condition;
  final int officeId;
  final Office data;
  const FilterContentWidget({
    super.key,
    required this.condition,
    required this.officeId,
    required this.data,
  });

  @override
  State<FilterContentWidget> createState() => _FilterContentWidgetState();
}

class _FilterContentWidgetState extends State<FilterContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, office, child) {
      if (widget.condition) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(
                  rating: widget.data.rating,
                  officeId: widget.officeId,
                  buttonRoute: '/booking',
                  textButton: 'Booking via Aplication',
                ),
              ),
            );
          },
          child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 8,
              ),
              child: OfficeCard(officeData: widget.data)),
        );
      } else {
        return Container();
      }
    });
  }
}
