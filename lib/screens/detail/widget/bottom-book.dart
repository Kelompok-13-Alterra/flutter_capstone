import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

class BottomBook extends StatefulWidget {
  final String textButton;
  final String buttonRoute;
  const BottomBook({
    super.key,
    required this.textButton,
    required this.buttonRoute,
  });

  @override
  State<BottomBook> createState() => _BottomBookState();
}

class _BottomBookState extends State<BottomBook> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FractionallySizedBox(
        widthFactor: 1.0,
        child: SizedBox(
          height: 50,
          child: ElevatedButton(
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFF005DB9)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100), // Bentuk border
                ),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, widget.buttonRoute);
            },
            child: Text(
              widget.textButton,
              style: setTextStyle(NeutralColor().neutral100)
                  .copyWith(fontWeight: semiBold, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
