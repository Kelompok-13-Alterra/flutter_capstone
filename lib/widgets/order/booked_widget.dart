import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

class BookedWidget extends StatelessWidget {
  const BookedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 172,
        width: 360,
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 89,
                  height: 76,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                      image: AssetImage('assets/office1.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wellspace',
                      style: TextStyle(
                        fontWeight: semiBold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.star, color: kYellowColor),
                        const SizedBox(width: 4),
                        Text(
                          '4.6',
                          style: TextStyle(
                            fontWeight: medium,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 16, color: kGreyColor),
                        const SizedBox(width: 4),
                        Text(
                          '10:00 AM - 06:00 PM',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: medium,
                            color: kGreyColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                height: 28,
                width: 81,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: kGreenColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Booked',
                    style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: medium,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: 16,
              child: Wrap(
                spacing: 5,
                children: [
                  SizedBox(
                    width: 160,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        // Aksi ketika tombol "Change Schedule" ditekan
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                      ),
                      child: Text(
                        'Change Schedule',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: medium,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        // Aksi ketika tombol "Cancel Book" ditekan
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kWhiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: BorderSide(color: kRedColor),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                      ),
                      child: Text(
                        'Cancel Book',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: medium,
                          color: kRedColor,
                        ),
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
