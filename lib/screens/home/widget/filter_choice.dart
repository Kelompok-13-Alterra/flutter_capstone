import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/home/home_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class FilterChoice extends StatefulWidget {
  const FilterChoice({super.key});

  @override
  State<FilterChoice> createState() => _FilterChoiceState();
}

class _FilterChoiceState extends State<FilterChoice> {
  @override
  Widget build(BuildContext context) {
    var homeViewModel = Provider.of<HomeViewModel>(context);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0,
      // expandedHeight: 60,
      // collapsedHeight: 70,
      floating: false,
      pinned: true,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(-40),
        child: SizedBox(),
      ),
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: homeViewModel.getFilters.length,
                itemBuilder: (context, index) {
                  return Wrap(
                    children: [
                      const SizedBox(
                        height: 23,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Container(
                        color: Colors.white,
                        child: ChoiceChip(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0),
                            side: const BorderSide(
                              color: Color(
                                  0xFF0074E5), // Warna border saat unselected
                              width: 1.0, // Lebar border saat unselected
                            ),
                          ),
                          label: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              homeViewModel.getFilters[index],
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                color: homeViewModel.getSelectedFilterindex ==
                                        index
                                    ? Colors.white
                                    : const Color(0xFF0074E5),
                              ),
                            ),
                          ),
                          selected:
                              homeViewModel.getSelectedFilterindex == index,
                          selectedColor: const Color(0xFF0074E5),
                          onSelected: (bool selected) {
                            homeViewModel.setSelectedFilterIndex =
                                selected ? index : 0;
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
