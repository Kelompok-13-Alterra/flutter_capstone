import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class FasilitiesOffice extends StatelessWidget {
  const FasilitiesOffice({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Color(0xFFF5F5F5), // Warna garis
          thickness: 2.0, // Ketebalan garis
        ),
        Container(
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Facilities",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: const Color(0xFFD6E3FF),
                          ),
                          child: Center(
                            child: SvgPicture.asset("assets/detail/water.svg"),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Revil Water",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: const Color(0xFFD6E3FF),
                          ),
                          child: Center(
                            child: SvgPicture.asset("assets/detail/mic.svg"),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Speaker",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: const Color(0xFFD6E3FF),
                          ),
                          child: Center(
                            child: SvgPicture.asset("assets/detail/board.svg"),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "White Boarding",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          height: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: const Color(0xFFD6E3FF),
                          ),
                          child: Center(
                            child:
                                SvgPicture.asset("assets/detail/projector.svg"),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Projector",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w500,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0xFFF5F5F5), // Warna garis
          thickness: 2.0, // Ketebalan garis
        ),
      ],
    );
  }
}
