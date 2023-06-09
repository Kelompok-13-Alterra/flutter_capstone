import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/payment/widget/showmodal_payment.dart';
import 'package:flutter_capstone/style/text_style.dart';

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
              backgroundColor: MaterialStateProperty.all(
                PrimaryColor().primary,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      widget.textButton == 'Pilih Metode Pembayaran'
                          ? 8
                          : 100), // Bentuk border
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
              }
              if (widget.textButton == 'Pilih Metode Pembayaran') {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return const ShowModalPayment();
                  },
                );
              }
            },
            child: Text(
              widget.textButton,
              style: setTextStyle(SourceColor().white)
                  .copyWith(fontWeight: medium, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
