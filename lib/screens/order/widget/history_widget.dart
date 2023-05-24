import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/widgets/rating/history_reviewed_widget.dart';

class HistoryOrderedWidget extends StatelessWidget {
  const HistoryOrderedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
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
                        const Text(
                          'Wellspace',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.star, color: SourceColor().yellow),
                            const SizedBox(width: 4),
                            const Text(
                              '4.6',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.access_time,
                                size: 16, color: NeutralColor().neutral60),
                            const SizedBox(width: 4),
                            Text(
                              '10:00 AM - 06:00 PM',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: regular,
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
                  top: 8,
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
                          fontWeight: FontWeight.bold,
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
                        child: ChoiceChip(
                          label: Text(
                            'Book Again',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: medium,
                            ),
                          ),
                          selected: false,
                          onSelected: (_) {
                            // Aksi ketika choice chip "Change Schedule" dipilih
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          backgroundColor: PrimaryColor().primary,
                          labelStyle: TextStyle(color: SourceColor().white),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        height: 40,
                        child: ChoiceChip(
                          label: Text(
                            'Give Review',
                            style: TextStyle(fontSize: 14, fontWeight: medium),
                          ),
                          selected: false,
                          onSelected: (_) {
                            // Aksi ketika choice chip "Cancel Booked" dipilih
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(color: PrimaryColor().primary),
                          ),
                          backgroundColor: SourceColor().white,
                          labelStyle: TextStyle(color: PrimaryColor().primary),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
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
