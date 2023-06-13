import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_capstone/style/text_style.dart';

class OfficeDescription extends StatefulWidget {
  const OfficeDescription({super.key});

  @override
  State<OfficeDescription> createState() => _OfficeDescriptionState();
}

class _OfficeDescriptionState extends State<OfficeDescription> {
  bool isDescriptionVisible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Details Office",
                style: setTextStyle(BlackColor().black)
                    .copyWith(fontWeight: semiBold, fontSize: 14),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isDescriptionVisible = !isDescriptionVisible;
                  });
                },
                child: isDescriptionVisible
                    ? SvgPicture.asset("assets/detail/up.svg")
                    : SvgPicture.asset("assets/detail/down.svg"),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          textDeskripsi(context),
        ],
      ),
    );
  }

  Widget textDeskripsi(BuildContext context) {
    if (isDescriptionVisible) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text:
                  'Ruang rapat sendiri dapat dipesan melalui aplikasi atau situs office buddy. Kami selalu menyarankan pemesanan ruang rapat dilakukan 2 x 24 jam sebelum jadwal pemesanan.',
              style: setTextStyle(BlackColor().black)
                  .copyWith(fontWeight: regular, fontSize: 12),
            ),
            TextSpan(
              text:
                  '\n\nSetelah pemesanan dibuat mohon tunggu hingga pesanan dikonfirmasi. Ketika sampai di lokasi mohon tunjukkan bukti pemesanan kepada admin setempat.',
              style: setTextStyle(BlackColor().black)
                  .copyWith(fontWeight: regular, fontSize: 12),
            ),
          ],
        ),
      );
    } else {
      return const Text("");
    }
  }
}
