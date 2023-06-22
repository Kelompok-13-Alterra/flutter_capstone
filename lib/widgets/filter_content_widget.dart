import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/detail/detail_screen.dart';
import 'package:flutter_capstone/screens/home/home_view_model.dart';
import 'package:flutter_capstone/screens/home/widget/office_card.dart';
import 'package:provider/provider.dart';

//This widget for list content office in home
class FilterContentWidget extends StatefulWidget {
  int childCount;
  bool condition;
  FilterContentWidget({
    super.key,
    required this.childCount,
    required this.condition,
  });

  @override
  State<FilterContentWidget> createState() => _FilterContentWidgetState();
}

class _FilterContentWidgetState extends State<FilterContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(builder: (context, office, child) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          childCount: office.listOffice.length,
          (BuildContext context, int index) {
            final data = office.listOffice[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      officeId: data.id,
                      buttonRoute: '/booking',
                      textButton: 'Book',
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
                  child: widget.condition
                      ? OfficeCard(officeData: data)
                      : Container()),
            );
          },
        ),
      );
    });
  }
}
