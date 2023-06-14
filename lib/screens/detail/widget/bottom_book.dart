import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/booking/booking_screen.dart';
import 'package:flutter_capstone/screens/payment/widget/showmodal_payment.dart';
import 'package:flutter_capstone/style/text_style.dart';

class BottomBook extends StatefulWidget {
  final String textButton;
  final String? buttonRoute;
  final VoidCallback? function;
  final int? officeId;
  DateTimeRange? selectedDateRange;
  BottomBook({
    super.key,
    required this.textButton,
    this.buttonRoute,
    this.function,
    this.officeId,
    this.selectedDateRange,
  });

  @override
  State<BottomBook> createState() => _BottomBookState();
}

class _BottomBookState extends State<BottomBook> {
  // DateTimeRange? selectedDateRange;
  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    // print('date range in bottom book ${widget.selectedDateRange}');
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
              // if (widget.buttonRoute != null) {
              //   print(widget.officeId);
              //   Navigator.pushNamed(context, '${widget.buttonRoute}',
              //           arguments:
              //               BookingScheduleArgument(officeId: widget.officeId!))
              //       .then((value) {
              //     setState(() {
              //       selectedDateRange = value.toString();
              //     });
              //   });
              // }
              if (widget.selectedDateRange != null) {
                showModalBottomSheet(
                  context: context,
                  enableDrag: false,
                  isScrollControlled: true,
                  isDismissible: false,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  builder: (BuildContext context) {
                    return ShowModalPayment(
                      officeId: widget.officeId!,
                      selectedDateRange: widget.selectedDateRange,
                      onPressed: () {
                        widget.selectedDateRange = null;
                        Navigator.pop(context);
                        setState(() {});
                      },
                    );
                  },
                );
              } else {
                // setState(() {
                //   widget.officeId != widget.officeId;
                //   widget.selectedDateRange != widget.selectedDateRange;
                // });
                Navigator.pushReplacementNamed(context, '${widget.buttonRoute}',
                        arguments: BookingScheduleArgument(
                            officeId: widget.officeId ?? 0,
                            selectedDateRange: widget.selectedDateRange))
                    .then(
                  (value) {
                    if (mounted) {
                      setState(
                        () {
                          widget.selectedDateRange = value as DateTimeRange?;
                        },
                      );
                    }
                  },
                );
              }
            },
            child: Text(
              // widget.textButton,
              widget.selectedDateRange != null
                  ? 'Pilih metode pembayaran'
                  : 'Booking',
              style: setTextStyle(SourceColor().white)
                  .copyWith(fontWeight: medium, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
