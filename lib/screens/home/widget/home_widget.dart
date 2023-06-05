import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/home/home_view_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_capstone/style/text_style.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, office, child) {
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: office.listOffice.length,
            (BuildContext context, int index) {
              final data = office.listOffice[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/detail');
                },
                child: Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data.name,
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: SuccessColor().green,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8),
                                        child: Text(
                                          "Open",
                                          style: GoogleFonts.roboto(
                                            color: SourceColor().white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ))
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 15,
                                    color: SourceColor().yellow,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "4.6",
                                    style: GoogleFonts.roboto(
                                      color: NeutralColor().neutral17,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 15,
                                    color: NeutralColor().neutral60,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    data.location,
                                    style: GoogleFonts.roboto(
                                      color: NeutralColor().neutral60,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.av_timer,
                                    size: 15,
                                    color: NeutralColor().neutral60,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${data.open} AM - ${data.close} PM",
                                    style: GoogleFonts.roboto(
                                      color: NeutralColor().neutral60,
                                      fontSize: 12,
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
                                    "IDR ${data.price}",
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
                ),
              );
            },
          ),
        );
      },
    );
  }
}
