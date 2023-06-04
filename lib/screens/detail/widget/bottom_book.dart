import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomBook extends StatefulWidget {
  final String textButton;
  final String? buttonRoute;
  final VoidCallback? function;
  const BottomBook({
    super.key,
    required this.textButton,
    this.buttonRoute,
    this.function,
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
            // onPressed: widget.function,
            onPressed: () {
              if (widget.function != null) {
                widget.function!();
              }
              // widget.function!();
              if (widget.buttonRoute != null) {
                Navigator.pushNamed(context, '${widget.buttonRoute}');
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Yay! Successfully booked an office!')));
              }
              if (widget.textButton == 'Pilih Metode Pembayaran') {
                showBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      height: 500,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text('Hello from the bottom sheet!'),
                      ),
                    );
                  },
                );
              }
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
