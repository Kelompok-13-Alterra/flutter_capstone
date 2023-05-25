import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionOffice extends StatefulWidget {
  const DescriptionOffice({super.key});

  @override
  State<DescriptionOffice> createState() => _DescriptionOfficeState();
}

class _DescriptionOfficeState extends State<DescriptionOffice> {
  bool isDescriptionVisible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Details Office",
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
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
              style: GoogleFonts.roboto(
                color: const Color(0xFF1A1A1A),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text:
                  '\n\nSetelah pemesanan dibuat mohon tunggu hingga pesanan dikonfirmasi. Ketika sampai di lokasi mohon tunjukkan bukti pemesanan kepada admin setempat.',
              style: GoogleFonts.roboto(
                color: const Color(0xFF1A1A1A),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      );
    } else {
      return Text("");
    }
  }
}
