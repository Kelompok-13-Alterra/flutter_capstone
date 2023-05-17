import 'package:flutter/material.dart';
import 'package:flutter_capstone/theme.dart';
import 'package:flutter_capstone/widgets/boarding_screen_widget.dart';

class BoardingScreenThird extends StatefulWidget {
  const BoardingScreenThird({super.key});

  @override
  State<BoardingScreenThird> createState() => _BoardingScreenThirdState();
}

class _BoardingScreenThirdState extends State<BoardingScreenThird> {
  final double _currentPage = 2;
  final PageController _pageController = PageController(
    initialPage: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF85B6FF),
              Color(0xFF1E90FF),
              Color(0xFF0031CC),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Using BoardingScreenWidget instead of PageView.builder directly
            BoardingScreenWidget(
              currentPage: _currentPage,
              pageController: _pageController,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQuery.of(context).size.height * 0.35,
              // width: 224,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 48,
                            height: 8,
                            child: Image.asset(
                                'assets/progress_indicator/indicator3.png'),
                          ),
                          TextButton(
                            child: Text(
                              'Skip',
                              style: greyTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                              ),
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      Text(
                        'Daftar Secara Individu atau Wakilkan Perusahaan',
                        style: blackTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                        child: Text(
                          'Kamu bisa booking atau daftar secara individu atau perusahana yang kamu wakilkan untuk pesan office atau co-wroking space',
                          style: greyTextStyle.copyWith(
                              fontWeight: regular, fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                backgroundColor: kPrimaryColor),
                            onPressed: () {},
                            child: const Text('Next')),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
