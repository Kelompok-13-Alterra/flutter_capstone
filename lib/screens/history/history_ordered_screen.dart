import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'history_reviewed_screen.dart';

class HistoryOrdered extends StatelessWidget {
  const HistoryOrdered({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
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
                                color: NeutralColor().neutral17,
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: TertiaryColor().tertiary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Ordered',
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
                            Navigator.pushNamed(context, '/home');
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: SourceColor().white,
                            backgroundColor: PrimaryColor().primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            visualDensity: VisualDensity.compact,
                          ),
                          child: Text(
                            'Book Again',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/review');
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: PrimaryColor().primary,
                            backgroundColor: SourceColor().white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              side: BorderSide(color: PrimaryColor().primary),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            visualDensity: VisualDensity.compact,
                          ),
                          child: Text(
                            'Give Review',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: medium,
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
        ),
        const HistoryReviewed(),
      ],
    );
  }
}
