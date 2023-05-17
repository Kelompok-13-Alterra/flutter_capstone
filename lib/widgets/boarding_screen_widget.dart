import 'package:flutter/material.dart';

class BoardingScreenWidget extends StatelessWidget {
  late double currentPage;
  final PageController pageController;

  BoardingScreenWidget({
    super.key,
    required this.currentPage,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      child: PageView.builder(
        controller: pageController,
        itemCount: 3,
        onPageChanged: (int page) {
          // Using callback to change currentPage state
          currentPage = page.toDouble();
        },
        itemBuilder: (BuildContext context, int index) {
          String assetName = index == 0
              ? "illustration1.png"
              : index == 1
                  ? "illustration2.png"
                  : "illustration3.png";
          return AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
            transform: Matrix4.translationValues(
                (currentPage - index) * MediaQuery.of(context).size.width,
                0,
                0),
            child: Image.asset(
              "assets/$assetName",
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
