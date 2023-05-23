//AUTHOR : ULFA LADAYYA
//KELAS C FLUTTER
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 24.0;
double defaultRadius = 17.0;

Color kPrimaryColor = const Color(0xff005DB9);
Color kBlackColor = const Color(0xff1E1F23);
Color kWhiteColor = const Color(0xffFFFFFF);
Color kGreyColor = const Color(0xff5E5E62);
Color kRedColor = const Color(0xffDE3730);
Color kGreenColor = const Color(0xff20E500);
Color kYellowColor = const Color(0xffF5EF5A);
Color kPurpleColor = const Color(0xff8567BD);
Color kSourceBlackColor = const Color(0xff000000);
Color kLightSecondaryColor = const Color(0xFF97CBFF);
Color kNeutral50 = const Color(0xFF77777A);
Color kNeutralVariant30 = const Color(0xFF44474E);
Color kNeutralVariant60 = const Color(0xFF8E9099);
Color kNeutral30 = const Color(0xFF46474A);

TextStyle primaryTextStyle = GoogleFonts.roboto(
  color: kPrimaryColor,
);

TextStyle blackTextStyle = GoogleFonts.roboto(
  color: kBlackColor,
);

TextStyle whiteTextStyle = GoogleFonts.roboto(
  color: kWhiteColor,
);

TextStyle greyTextStyle = GoogleFonts.roboto(
  color: kGreyColor,
);

TextStyle sourceBlackTextStyle = GoogleFonts.roboto(
  color: kSourceBlackColor,
);

TextStyle neutral50TextStyle = GoogleFonts.roboto(
  color: kNeutral50,
);

TextStyle neutralVariant30TextStyle = GoogleFonts.roboto(
  color: kNeutralVariant30,
);

TextStyle neutralVariant60TextStyle = GoogleFonts.roboto(
  color: kNeutralVariant60,
);

TextStyle neutral30TextStyle = GoogleFonts.roboto(
  color: kNeutral30,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

class TitleLarge {
  TextStyle text1 = GoogleFonts.roboto(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF000000),
  );
}

class BodySmall {
  TextStyle text2 = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF98A2B3),
  );
}

class M3BodySmall {
  TextStyle text3 = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF77777A),
  );
}

class TextKirimUlang {
  TextStyle text4 = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF0074E5),
  );
}

class M3LabelLarge {
  TextStyle text5 = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: const Color(0xFFFFFFFF),
  );
}

class DisplayOTPSmall {
  TextStyle text6 = GoogleFonts.roboto(
    fontSize: 36,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF000000),
  );
}

class TextSelamatDatang {
  TextStyle text7 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFFAF9FD),
  );
}

class TextOfficeBuddy {
  TextStyle text8 = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: const Color(0xFFFAF9FD),
  );
}

class NotificationTitle {
  TextStyle text9 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF1E1F23),
  );
}

class MarkAllAsRead {
  TextStyle text10 = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF0074E5),
  );
}

class TabLabelStyle {
  TextStyle text11 = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF5E5E62),
  );
}

class UnselectTabLabelStyle {
  TextStyle text12 = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF666666),
  );
}

class DescBooking {
  TextStyle text13 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF1E1F23),
  );
}

class IdBooking {
  TextStyle text14 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF1E1F23),
  );
}

class EmptyDesc {
  TextStyle text15 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF1E1F23),
  );
}

class SubEmptyDesc {
  TextStyle text16 = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF5E5E62),
  );
}

class TextButtonBooking {
  TextStyle text17 = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: const Color(0xFFFFFFFF),
  );
}

class TextNameOfUser {
  TextStyle text18 = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF000000),
  );
}

class TextGmail {
  TextStyle text19 = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF5E5E62),
  );
}

class TextNoCompany {
  TextStyle text20 = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF77777A),
  );
}

class TextTotalKantor {
  TextStyle text21 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF44474E),
  );
}

class TextAbuabu {
  TextStyle text22 = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF8E9099),
  );
}

class TextTotal {
  TextStyle text23 = GoogleFonts.roboto(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF000000),
  );
}

class TextTitleProfile {
  TextStyle text24 = GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF1E1F23),
  );
}

class TextTitleAccountInfo {
  TextStyle text25 = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: const Color(0xFF44474E),
  );
}

class SubAccountInfo {
  TextStyle text26 = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF46474A),
  );
}
