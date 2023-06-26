import 'package:flutter/material.dart';
import 'package:flutter_capstone/core/init/utils/date_convert.dart';
import 'package:flutter_capstone/screens/payment/detail_payment_screen.dart';
import 'package:flutter_capstone/screens/reschedule/reschedule_view_model.dart';
import 'package:flutter_capstone/services/booking/booking_availability_service.dart';
import 'package:flutter_capstone/services/order/order_service.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/widgets/modal_bottom.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

import 'package:intl/intl.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

class FormBoooking extends StatefulWidget {
  final String nameOffice;
  final String imageUrl;

  final int officeId;
  const FormBoooking(
      {super.key,
      required this.nameOffice,
      required this.officeId,
      required this.imageUrl});

  @override
  State<FormBoooking> createState() => _FormBoookingState();
}

class _FormBoookingState extends State<FormBoooking> {
  final formKey = GlobalKey<FormState>();

  TextEditingController officeNameController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  String selectedPaymentMethod = '';

  List<String> paymentMethods = [];

  @override
  void initState() {
    super.initState();
    paymentMethods = [
      "BNI Virtual Account",
      "BCA Virtual Account",
      "BNI Transfer Bank",
      "BCA Transfer Bank",
    ];
    officeNameController.text = widget.nameOffice;
    selectedPaymentMethod = paymentMethods.isNotEmpty ? paymentMethods[0] : '';
  }

  DateTime? startDate;
  DateTime? endDate;

  @override
  void dispose() {
    officeNameController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];
  final currentDate = DateTime.now();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              controller: officeNameController,
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Nama Office',
                hintStyle: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
                hintText: widget.nameOffice,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: Container(
                    // padding: const EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Tanggal harus diisi';
                        } else {
                          return null;
                        }
                      },
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (BuildContext contet) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: CalendarDatePicker2(
                                  config: CalendarDatePicker2Config(
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(currentDate.year + 5),
                                    currentDate: DateTime.now(),
                                  ),
                                  value: _singleDatePickerValueWithDefaultValue,
                                  onValueChanged: (value) {
                                    DateTime? dateStart = value[0];
                                    if (dateStart != null) {
                                      setState(() {
                                        _singleDatePickerValueWithDefaultValue =
                                            value;
                                        startDateController.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(dateStart);
                                      });
                                    }
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                      readOnly: true,
                      autofocus: true,
                      controller: startDateController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.calendar_today_rounded),
                        labelText: 'Start',
                        hintStyle: setTextStyle(
                          const Color(0xFF44474E),
                        ).copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        hintText: "YYYY/MM/DD",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Container(
                    // padding: const EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return 'Tanggal harus diisi';
                        } else {
                          return null;
                        }
                      },
                      onTap: () async {
                        showDialog(
                          context: context,
                          builder: (BuildContext contet) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: CalendarDatePicker2(
                                  config: CalendarDatePicker2Config(
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(currentDate.year + 5),
                                    currentDate: DateTime.now(),
                                  ),
                                  value: _singleDatePickerValueWithDefaultValue,
                                  onValueChanged: (value) {
                                    DateTime? dateEnd = value[0];
                                    if (dateEnd != null) {
                                      setState(() {
                                        _singleDatePickerValueWithDefaultValue =
                                            value;
                                        endDateController.text =
                                            DateFormat('yyyy-MM-dd')
                                                .format(dateEnd);
                                      });
                                    }
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                      readOnly: true,
                      autofocus: true,
                      controller: endDateController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.calendar_today_rounded),
                        labelText: 'End',
                        hintStyle: setTextStyle(
                          const Color(0xFF44474E),
                        ).copyWith(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                        hintText: "YYYY/MM/DD",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField<String>(
              value: selectedPaymentMethod,
              onChanged: (value) {
                setState(() {
                  selectedPaymentMethod = value!;
                });
              },
              items: paymentMethods.map((String method) {
                return DropdownMenuItem<String>(
                  value: method,
                  child: Row(
                    children: [
                      const Icon(Icons.payment),
                      const SizedBox(width: 8.0),
                      Text(method),
                    ],
                  ),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Pilih Pembayaran',
                hintStyle: setTextStyle(
                  const Color(0xFF44474E),
                ).copyWith(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            FractionallySizedBox(
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
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      var provider = Provider.of<RescheduleViewModel>(context,
                          listen: false);
                      // ignore: unused_local_variable
                      final statusCode =
                          // ignore: use_build_context_synchronously
                          await provider.checkRescheduleOffice(
                        context,
                        widget.officeId,
                        startDateController.text,
                        endDateController.text,
                        null,
                        null,
                        false,
                        widget.imageUrl,
                      );
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  child: isLoading
                      ? const CircularProgressIndicator()
                      : Text(
                          'Booking via Form',
                          style: setTextStyle(SourceColor().white)
                              .copyWith(fontWeight: medium, fontSize: 14),
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
