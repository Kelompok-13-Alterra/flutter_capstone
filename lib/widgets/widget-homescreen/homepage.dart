import 'package:flutter/material.dart';
import 'package:flutter_capstone/widgets/widget-homescreen/background-homescreen.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedFilterIndex = 0;
  final List<String> _filters = [
    'Terdekat',
    'Rating Baik',
    'Termurah',
    'Fasilitas Lengkap'
  ];
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const BackgroundHomeScreen(),
        SliverAppBar(
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 8),
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
                }),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      height: 130,
                      width: 117,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.black,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          "assets/homescreen/office-list.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Wellspace",
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF20E500),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text(
                                        "Open",
                                        style: GoogleFonts.roboto(
                                          color: Colors.white,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Color(0xFFF5EF5A),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "4.6",
                                  style: GoogleFonts.roboto(
                                    color: const Color(0xFF292A2D),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 15,
                                  color: Color(0xFF909094),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Mampang - 400",
                                  style: GoogleFonts.roboto(
                                    color: const Color(0xFF909094),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.av_timer,
                                  size: 15,
                                  color: Color(0xFF909094),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "06:00 AM - 10:00 PM",
                                  style: GoogleFonts.roboto(
                                    color: const Color(0xFF909094),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Text(
                                  "IDR 20.999",
                                  style: GoogleFonts.roboto(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
            childCount: 100,
          ),
        )
      ],
    );
  }
}
