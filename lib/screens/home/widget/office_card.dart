import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_capstone/core/init/utils/open_close.dart';
import 'package:flutter_capstone/core/init/utils/price_convert.dart';
import 'package:flutter_capstone/model/home/home_model.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class OfficeCard extends StatefulWidget {
  final Office officeData;
  const OfficeCard({super.key, required this.officeData});

  @override
  State<OfficeCard> createState() => _OfficeCardState();
}

class _OfficeCardState extends State<OfficeCard> {
  var result = Random().nextDouble() * (5 - 1) + 1;

  @override
  void initState() {
    super.initState();
    result;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 130,
          width: 117,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              widget.officeData.imageUrl.isEmpty
                  ? "https://img.freepik.com/premium-photo/modern-corporate-architecture-can-be-seen-cityscape-office-buildings_410516-276.jpg"
                  : widget.officeData.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Wrap with flexible to know that the Row that's okay to be narrower than its intrinsic width
                    Flexible(
                      child: Text(
                        widget.officeData.name,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: checkOpeningStatus(
                                  widget.officeData.open,
                                  widget.officeData.close)
                              ? SuccessColor().green
                              : WarningColor().red,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Text(
                            checkOpeningStatus(widget.officeData.open,
                                    widget.officeData.close)
                                ? "Open"
                                : "Close",
                            style: GoogleFonts.roboto(
                              color: SourceColor().white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ))
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: 15,
                      color: SourceColor().yellow,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      result.toStringAsFixed(1),
                      // '${randomRating(Random(), 1, 5).toStringAsFixed(1)}',
                      style: GoogleFonts.roboto(
                        color: NeutralColor().neutral17,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 15,
                      color: NeutralColor().neutral60,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      widget.officeData.location,
                      style: GoogleFonts.roboto(
                        color: NeutralColor().neutral60,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.av_timer,
                      size: 15,
                      color: NeutralColor().neutral60,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "${widget.officeData.open.substring(0, 5)} AM - ${widget.officeData.close.substring(0, 5)} PM",
                      style: GoogleFonts.roboto(
                        color: NeutralColor().neutral60,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Text(
                      "IDR ${priceConvert(widget.officeData.price)}",
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
