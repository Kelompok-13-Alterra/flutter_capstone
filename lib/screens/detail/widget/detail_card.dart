import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

class DetailCard extends StatefulWidget {
  const DetailCard({super.key});

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
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
                style: setTextStyle(NeutralColor().neutral20)
                    .copyWith(fontWeight: semiBold, fontSize: 20),
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
                    style: setTextStyle(SourceColor().white)
                        .copyWith(fontWeight: semiBold, fontSize: 13),
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
                style: setTextStyle(NeutralColor().neutral17)
                    .copyWith(fontWeight: semiBold, fontSize: 13),
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
                style: setTextStyle(NeutralColor().neutral30)
                    .copyWith(fontWeight: semiBold, fontSize: 12),
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
                style: setTextStyle(NeutralColor().neutral30)
                    .copyWith(fontWeight: semiBold, fontSize: 12),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "IDR 20.999",
            style: setTextStyle(NeutralColor().neutral20)
                .copyWith(fontWeight: regular, fontSize: 22),
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
                    style: setTextStyle(NeutralColor().neutral30)
                        .copyWith(fontWeight: semiBold, fontSize: 12),
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
                    style: setTextStyle(NeutralColor().neutral30)
                        .copyWith(fontWeight: semiBold, fontSize: 12),
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
