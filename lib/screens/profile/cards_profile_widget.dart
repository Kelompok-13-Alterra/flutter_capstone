import 'package:flutter/material.dart';

class CardsProfileWidget extends StatelessWidget {
  final Color? cardColor1;
  final Color? cardColor2;
  final AssetImage img1;
  final AssetImage img2;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final String text6;
  final RoundedRectangleBorder border;
  final double height1;
  final double width1;
  final double height2;
  final double width2;
  final double height3;
  final double height4;
  final double height5;
  final double height6;
  final double width6;
  final double height7;
  final double width7;
  final double height8;
  final double height9;
  final double height10;
  final TextStyle style1;
  final TextStyle style2;
  final TextStyle style3;
  final TextStyle style4;
  final TextStyle style5;
  final TextStyle style6;
  final EdgeInsets padding1;
  final EdgeInsets padding2;
  final EdgeInsets padding3;

  const CardsProfileWidget({
    super.key,
    this.cardColor1,
    this.img1 = const AssetImage('assets/image/Image_total_kantor.png'),
    required this.text1,
    required this.border,
    required this.style1,
    required this.padding1,
    required this.height1,
    required this.width1,
    required this.height2,
    required this.width2,
    required this.height3,
    required this.height4,
    required this.height5,
    required this.padding2,
    required this.text2,
    required this.text3,
    required this.style2,
    required this.style3,
    this.cardColor2,
    this.img2 = const AssetImage('assets/image/Image_total_co-working.png'),
    required this.text4,
    required this.text5,
    required this.text6,
    required this.height6,
    required this.width6,
    required this.height7,
    required this.width7,
    required this.height8,
    required this.height9,
    required this.height10,
    required this.style4,
    required this.style5,
    required this.style6,
    required this.padding3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              height: height1,
              width: width1,
              child: Card(
                color: cardColor1,
                shape: border,
                child: Padding(
                  padding: padding2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: img1,
                        height: height2,
                        width: width2,
                      ),
                      SizedBox(
                        height: height3,
                      ),
                      Text(
                        text1,
                        style: style1,
                      ),
                      SizedBox(
                        height: height4,
                      ),
                      Text(
                        text2,
                        style: style2,
                      ),
                      SizedBox(
                        height: height5,
                      ),
                      Text(
                        text3,
                        style: style3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              height: height6,
              width: width6,
              child: Card(
                color: cardColor2,
                shape: border,
                child: Padding(
                  padding: padding3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: img2,
                        height: height7,
                        width: width7,
                      ),
                      SizedBox(
                        height: height8,
                      ),
                      Text(
                        text4,
                        style: style4,
                      ),
                      SizedBox(
                        height: height9,
                      ),
                      Text(
                        text5,
                        style: style5,
                      ),
                      SizedBox(
                        height: height10,
                      ),
                      Text(
                        text6,
                        style: style6,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
