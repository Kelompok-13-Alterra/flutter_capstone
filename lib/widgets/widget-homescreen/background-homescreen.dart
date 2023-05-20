import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BackgroundHomeScreen extends StatefulWidget {
  const BackgroundHomeScreen({super.key});

  @override
  State<BackgroundHomeScreen> createState() => _BackgroundHomeScreenState();
}

class _BackgroundHomeScreenState extends State<BackgroundHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
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
                      "assets/homescreen/background-homescreen.svg",
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
              padding: EdgeInsets.fromLTRB(16, 45, 16, 0),
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
                                color: Color(0xFFFAF9FD)),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Di Office Buddy",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFFFAF9FD),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              //OnTab di Notifikasi
                            },
                            child: SvgPicture.asset(
                              "assets/homescreen/notification-home.svg",
                              height: 32,
                              width: 32,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              //OnTab di Akun
                            },
                            child: const CircleAvatar(
                              child: Icon(
                                Icons.account_circle,
                                size: 38,
                              ),
                            ),
                          )
                        ],
                      )
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
                          "Yuk, Mulai pesan kantor/co-woking space kamu di sini",
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
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              //OnTab di Map
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  'assets/homescreen/icon-location.svg',
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
                                  'assets/homescreen/icon-right.svg',
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
                                  'assets/homescreen/maps.png',
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
