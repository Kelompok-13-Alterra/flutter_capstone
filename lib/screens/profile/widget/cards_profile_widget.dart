import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

class CardsProfileWidget extends StatelessWidget {
  final Color? cardColor;
  final String title;
  final String desc;
  final int count;
  final AssetImage icon;

  const CardsProfileWidget({
    super.key,
    this.cardColor,
    required this.title,
    required this.desc,
    required this.count,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 156,
      child: Card(
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 16,
            bottom: 12,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: icon,
                height: 24,
                width: 24,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                title,
                style: setTextStyle(NeutralVariantColor().neutralVariant30)
                    .copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                desc,
                style: setTextStyle(NeutralVariantColor().neutralVariant60)
                    .copyWith(
                  fontSize: 12,
                  fontWeight: regular,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                count.toString(),
                style: setTextStyle(SourceColor().black).copyWith(
                  fontSize: 24,
                  fontWeight: regular,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
