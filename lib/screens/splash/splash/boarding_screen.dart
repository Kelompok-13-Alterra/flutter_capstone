// ignore_for_file: unused_field, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/login/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingSreen extends StatefulWidget {
  const OnBoardingSreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingSreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingSreen> {
  final PageController _pageControllerImg = PageController();
  final PageController _pageControllerDescription = PageController();
  bool isLastPage = false;
  double _currentPage1 = 0;
  double _currentPage2 = 0;

  @override
  void initState() {
    super.initState();
    _pageControllerImg.addListener(
      () {
        setState(
          () {
            _currentPage2 = _pageControllerDescription.page!;
            isLastPage = _pageControllerImg.page!.round() ==
                boardingData['boarding'].length - 1;
          },
        );
      },
    );
    _pageControllerDescription.addListener(
      () {
        setState(
          () {
            _currentPage2 = _pageControllerDescription.page!;
          },
        );
      },
    );
  }

  void _nextPage() {
    if (_pageControllerImg.page!.round() <
        boardingData['boarding'].length - 1) {
      _pageControllerImg.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void onPageChanged(int page) {
    _currentPage1 = page.toDouble();
    if (_pageControllerImg.page != page) {
      _pageControllerImg.jumpToPage(page);
    }
    if (_pageControllerDescription.page != page) {
      _pageControllerDescription.jumpToPage(page);
    }
  }

  @override
  void dispose() {
    _pageControllerImg.dispose();
    super.dispose();
  }

  Map<String, dynamic> boardingData = {
    'boarding': [
      {
        'img': 'assets/on_boarding/illustration1.png',
        'judul': 'Pesan Kantor atau Co-Working Space menjadi Mudah',
        'deskripsi':
            'Kamu ga perlu repot ke tempatnya untuk daftarnya! Daftar di sini dan semuanya beres'
      },
      {
        'img': 'assets/on_boarding/illustration2.png',
        'judul': 'Ga Harus Pake Credit Card',
        'deskripsi':
            'Booking ga perlu cartu credit, kamu bisa menggunakan metode pembayaran seperti e-wallet dan virtual account'
      },
      {
        'img': 'assets/on_boarding/illustration3.png',
        'judul': 'Daftar Secara Individu atau Wakilkan Perusahaan',
        'deskripsi':
            'Kamu bisa booking atau daftar secara individu atau perusahana yang kamu wakilkan untuk pesan office atau co-wroking space'
      }
    ]
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF85B6FF),
              Color(0xFF1E90FF),
              Color(0xFF0031CC),
            ],
          ),
        ),
        child: Stack(
          children: [
            PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: _pageControllerImg,
              onPageChanged: (int page) {
                onPageChanged(page);
              },
              itemCount: boardingData['boarding'].length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: const EdgeInsets.only(top: 85),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(boardingData['boarding'][index]['img']),
                  ),
                );
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 255,
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmoothPageIndicator(
                              controller: _pageControllerDescription,
                              count: boardingData['boarding'].length,
                              effect: const ExpandingDotsEffect(
                                activeDotColor: Color(0xFF0074E5),
                                dotColor: Color(0xFFF4F3F7),
                                dotHeight: 8,
                                dotWidth: 8,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                );
                              },
                              child: Text(
                                'Skip',
                                style: GoogleFonts.roboto(
                                  color: const Color(0xFF8E9099),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: PageView.builder(
                          physics: const BouncingScrollPhysics(),
                          onPageChanged: (int page) {
                            onPageChanged(page);
                          },
                          controller: _pageControllerDescription,
                          itemCount: boardingData['boarding'].length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    boardingData['boarding'][index]['judul'],
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: const Color(0xFF1E1F23),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    boardingData['boarding'][index]
                                        ['deskripsi'],
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: const Color(0xFF5E5E62),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      FractionallySizedBox(
                        widthFactor: 1.0,
                        child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (isLastPage) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LoginScreen()),
                                );
                              } else {
                                _nextPage();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF005DB9),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: Text(
                              isLastPage ? 'Skip' : 'Next',
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
