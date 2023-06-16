import 'package:flutter/material.dart';
import 'package:flutter_capstone/core/init/utils/price_convert.dart';
import 'package:flutter_capstone/screens/detail/detail_view_model.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:provider/provider.dart';

class DetailCard extends StatefulWidget {
  final String name; //
  final int price; //
  final String open;
  final String close;
  final int capacity; //
  final String location;
  const DetailCard({
    super.key,
    required this.name,
    required this.price,
    required this.open,
    required this.close,
    required this.capacity,
    required this.location,
  });

  @override
  State<DetailCard> createState() => _DetailCardState();
}

class _DetailCardState extends State<DetailCard> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DetailViewModel>(builder: (context, provider, _) {
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: setTextStyle(NeutralColor().neutral20)
                      .copyWith(fontWeight: semiBold, fontSize: 20),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: provider.isOpen
                        ? const Color(0xFF20E500)
                        : const Color(0xFFE5001B),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      provider.isOpen ? "Open" : "Close",
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
                  "Maximum: ${widget.capacity} People",
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
                  "${widget.open.substring(0, 5)} AM - ${widget.close.substring(0, 5)} PM",
                  style: setTextStyle(NeutralColor().neutral30)
                      .copyWith(fontWeight: semiBold, fontSize: 12),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "IDR ${priceConvert(widget.price)}",
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
                  'assets/images/home/maps.png',
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
                      widget.location,
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
    });
  }
}
