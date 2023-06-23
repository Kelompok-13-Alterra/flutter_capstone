import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_capstone/style/text_style.dart';

class OfficeDescription extends StatefulWidget {
  final String description;
  const OfficeDescription({super.key, required this.description});

  @override
  State<OfficeDescription> createState() => _OfficeDescriptionState();
}

class _OfficeDescriptionState extends State<OfficeDescription> {
  bool isDescriptionVisible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Details Office",
                style: setTextStyle(BlackColor().black)
                    .copyWith(fontWeight: semiBold, fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isDescriptionVisible = !isDescriptionVisible;
                  });
                },
                child: isDescriptionVisible
                    ? SvgPicture.asset("assets/icons/detail/up.svg")
                    : SvgPicture.asset("assets/icons/detail/down.svg"),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          textDeskripsi(context),
        ],
      ),
    );
  }

  Widget textDeskripsi(BuildContext context) {
    if (isDescriptionVisible) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: widget.description,
              style: setTextStyle(BlackColor().black)
                  .copyWith(fontWeight: regular, fontSize: 12),
            ),
          ],
        ),
      );
    } else {
      return const Text("");
    }
  }
}
