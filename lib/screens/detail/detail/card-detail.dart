import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardDetail extends StatefulWidget {
  const CardDetail({super.key});

  @override
  State<CardDetail> createState() => _CardDetailState();
}

class _CardDetailState extends State<CardDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Wellspace",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF20E500),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    "Open",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                size: 15,
                color: Color(0xFFF5EF5A),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "4.6",
                style: GoogleFonts.roboto(
                  color: const Color(0xFF292A2D),
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.people,
                size: 15,
                color: Color(0xFF46474A),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "Maximum: 10 People",
                style: GoogleFonts.roboto(
                  color: const Color(0xFF46474A),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.av_timer,
                size: 15,
                color: Color(0xFF46474A),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "06:00 AM - 10:00 PM",
                style: GoogleFonts.roboto(
                  color: const Color(0xFF46474A),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "IDR 20.999",
            style: GoogleFonts.roboto(
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 112,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/homescreen/maps.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 15,
                    color: Color(0xFF46474A),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Mampang - 400",
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF46474A),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.map,
                    size: 15,
                    color: Color(0xFF46474A),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "See On Google Maps",
                    style: GoogleFonts.roboto(
                      color: const Color(0xFF46474A),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
