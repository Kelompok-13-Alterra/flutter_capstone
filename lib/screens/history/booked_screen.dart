import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

class BookedWidget extends StatelessWidget {
  const BookedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 184,
        width: double.infinity,
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
                const SizedBox(
                  width: 16,
                  height: 6,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Wellspace',
                      style: TextStyle(
                        fontWeight: semiBold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star, color: SourceColor().yellow),
                        const SizedBox(width: 4),
                        Text(
                          '4.6',
                          style: TextStyle(
                            fontWeight: medium,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.business,
                            size: 14, color: NeutralColor().neutral60),
                        const SizedBox(width: 4),
                        Text(
                          'Co-Working Space',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: medium,
                            color: NeutralColor().neutral60,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.access_time,
                            size: 14, color: NeutralColor().neutral60),
                        const SizedBox(width: 4),
                        Text(
                          '10:00 AM - 06:00 PM',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: medium,
                            color: NeutralColor().neutral60,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              right: 8,
              child: Container(
                height: 28,
                width: 81,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: SuccessColor().green,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    'Booked',
                    style: TextStyle(
                      color: SourceColor().white,
                      fontWeight: medium,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 98,
              left: 8,
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
                        backgroundColor: PrimaryColor().primary,
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
                          color: SourceColor().white,
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
                        backgroundColor: SourceColor().white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side: BorderSide(color: WarningColor().red),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                      ),
                      child: Text(
                        'Cancel Book',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: medium,
                          color: WarningColor().red,
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
