import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

Widget cardProfile(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 16,
      right: 16,
      bottom: 20,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 136,
          width: 156,
          child: Card(
            color: const Color(0xFFF2F6FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                bottom: 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/image/Image_total_kantor.png",
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Total Kantor",
                    style: TextTotalKantor().text21,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "yang kamu kunjungi",
                    style: TextAbuabu().text22,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "36",
                    style: TextTotal().text23,
                  ),
                ],
              ),
            ),
          ),
        ),
        // const SizedBox(
        //   width: 16,
        // ),
        SizedBox(
          height: 136,
          width: 156,
          child: Card(
            color: const Color(0xFFFFFCF5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                bottom: 12,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/image/Image_total_co-working.png",
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Total Kantor",
                    style: TextTotalKantor().text21,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "yang kamu kunjungi",
                    style: TextAbuabu().text22,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "36",
                    style: TextTotal().text23,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
