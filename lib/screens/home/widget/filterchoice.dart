import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterChoice extends StatefulWidget {
  const FilterChoice({super.key});

  @override
  State<FilterChoice> createState() => _FilterChoiceState();
}

class _FilterChoiceState extends State<FilterChoice> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = [
    'Terdekat',
    'Rating Baik',
    'Termurah',
    'Fasilitas Lengkap'
  ];
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      // expandedHeight: 60,
      collapsedHeight: 70,
      floating: false,
      pinned: true,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(-10),
        child: SizedBox(),
      ),
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _filters.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(
                  height: 23,
                ),
                Row(
                  children: [
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
                            _filters[index],
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: _selectedFilterIndex == index
                                  ? Colors.white
                                  : const Color(0xFF0074E5),
                            ),
                          ),
                        ),
                        selected: _selectedFilterIndex == index,
                        selectedColor: const Color(0xFF0074E5),
                        onSelected: (bool selected) {
                          setState(
                            () {
                              _selectedFilterIndex = selected ? index : 0;
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
