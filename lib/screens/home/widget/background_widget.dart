// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({super.key});

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 465,
      centerTitle: false,
      elevation: 0,
      backgroundColor: Colors.transparent,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.zoomBackground,
        ],
        background: Stack(
          children: [
            Column(
              children: [
                //Background Homepage
                //==========================================================
                Container(
                  height: 230,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0074E5),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SvgPicture.asset(
                      "assets/images/home/background-homescreen.svg",
                      fit: BoxFit.none,
                    ),
                  ),
                ),
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF0031CC),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                  ),
                ),
              ],
            ),
            //Item di dalam
            //==========================================================
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 16, 0),
              child: Column(
                children: [
                  //Akun selamat datang
                  //==========================================================
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Selamat Datang",
                            style: GoogleFonts.roboto(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: const Color(0xFFFAF9FD)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Di Office Buddy",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: const Color(0xFFFAF9FD),
                            ),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          //OnTab di Notifikasi
                          Navigator.pushNamed(context, '/notification');
                        },
                        child: SvgPicture.asset(
                          "assets/images/home/notification-home.svg",
                          height: 32,
                          width: 32,
                        ),
                      ),
                    ],
                  ),
                  //Card Location
                  //==========================================================
                  const SizedBox(
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      decoration: const BoxDecoration(
                        boxShadow: [],
                        color: Color(0xFFF4F3F7),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        child: Text(
                          "Yuk, Mulai pesan kantor/co-working space kamu di sini",
                          style: GoogleFonts.roboto(
                              color: const Color(0xFF0074E5),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFF7F9FF),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              //OnTab di Map
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/images/home/icon-location.svg',
                                  height: 24,
                                  width: 24,
                                ),
                                Text(
                                  'Jakarta, Indonesia',
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/images/home/icon-right.svg',
                                  height: 24,
                                  width: 24,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              //OnTab di Map
                            },
                            child: Container(
                              height: 108,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  'assets/images/home/maps.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/search');
                              //OnTab di Search
                            },
                            child: Container(
                              height: 45,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                    12), // Radius border text field
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8,
                                  right: 14,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Ketik lokasi saat ini',
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                          color: const Color(0xFFC4C6D0)),
                                    ),
                                    const Icon(
                                      Icons.search,
                                      color: Color(0xFF44474E),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
