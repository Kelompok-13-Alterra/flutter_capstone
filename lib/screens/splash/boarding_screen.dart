import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/widgets/boarding_widget.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final double _currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      extendBodyBehindAppBar: true,
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
            BoardingWidget(
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
                                'assets/progress_indicator/indicator1.png'),
                          ),
                          TextButton(
                            child: Text(
                              'Skip',
                              style: setTextStyle(SourceColor().darkOutline)
                                  .copyWith(
                                fontSize: 14,
                                fontWeight: medium,
                              ),
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 26)),
                      Text(
                        'Pesan Kantor atau Co-Working Space menjadi Mudah',
                        style: setTextStyle(NeutralColor().neutral12)
                            .copyWith(fontWeight: semiBold, fontSize: 16),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                        child: Text(
                          'Kamu ga perlu repot ke tempatnya untuk daftarnya! Daftar di sini dan semuanya beres',
                          style: setTextStyle(NeutralColor().neutral40)
                              .copyWith(fontWeight: regular, fontSize: 12),
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
                                backgroundColor: SourceColor().seed),
                            onPressed: () {
                              Navigator.pushNamed(context, '/boarding-second');
                            },
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
