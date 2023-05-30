import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            child: Text(widget.textButton,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                )),
          ),
        ),
      ),
    );
  }
}
