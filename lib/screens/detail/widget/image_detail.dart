import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageDetail extends StatefulWidget {
  const ImageDetail({super.key});

  @override
  State<ImageDetail> createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  final _pageController = PageController();
  final List<String> imageUrls = [
    'https://img.freepik.com/free-photo/empty-room-with-chairs-desks_23-2149008873.jpg?w=2000',
    'https://guardian.ng/wp-content/uploads/2021/09/office-space.jpg',
    'https://www.ceosuite.com/wp-content/uploads/2013/04/CEO_SSC_Room_Office_IMG_1611-1024x683.jpg',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: 305,
              width: double.infinity,
              child: PageView(
                controller: _pageController,
                children: imageUrls.map((imageUrl) {
                  return Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  );
                }).toList(),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    height: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              color: Colors.white30,
                              border: Border.all(
                                color: Colors.white, // Warna border
                                width: 2.0, // Ketebalan border
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            color: Colors.white30,
                            border: Border.all(
                              color: Colors.white, // Warna border
                              width: 2.0, // Ketebalan border
                            ),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        SmoothPageIndicator(
          controller: _pageController,
          count: imageUrls.length,
          effect: const SwapEffect(
            activeDotColor: Color(0xFF0074E5),
            dotColor: Color(0xFFF4F3F7),
            dotHeight: 8,
            dotWidth: 8,
          ),
        ),
      ],
    );
  }
}
