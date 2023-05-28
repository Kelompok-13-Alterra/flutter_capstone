import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

class SourceColor {
  Color black = const Color(0xff000000);
  Color white = const Color(0xffFFFFFF);
  Color seed = const Color(0xff0074E5);
  Color yellow = const Color(0xffF5EF5A);
  Color purple = const Color(0xff8567BD);
  Color outline = const Color(0xff74777F);
  Color darkOutline = const Color(0xff8E9099);
}

class KeyColor {
  Color primary = const Color(0xff0074E5);
  Color secondary = const Color(0xff17212B);
  Color tertiary = const Color(0xff28124E);
}

class PrimaryColor {
  Color primary = const Color(0xff005DB9);
  Color onPrimary = const Color(0xffFFFFFF);
  Color primaryContainer = const Color(0xffD6E3FF);
  Color onPrimaryContainer = const Color(0xff001B3E);
  Color primaryFixed = const Color(0xffD6E3FF);
  Color onPrimaryFixed = const Color(0xff001B3E);
  Color primaryFixedDim = const Color(0xffAAC7FF);
  Color onPrimaryFixedVariant = const Color(0xff00458D);
}

class SecondaryColor {
  Color secondary = const Color(0xff00639B);
  Color onSecondary = const Color(0xffFFFFFF);
  Color secondaryContainer = const Color(0xffCEE5FF);
  Color onSecondaryContainer = const Color(0xFF001D33);
  Color secondaryFixed = const Color(0xffCEE5FF);
  Color onSecondaryFixed = const Color(0xff001D33);
  Color secondaryFixedDim = const Color(0xff97CBFF);
  Color onSecondaryFixedVariant = const Color(0xff004A76);
}

class TertiaryColor {
  Color tertiary = const Color(0xff6B4EA2);
  Color onTertiary = const Color(0xffFFFFFF);
  Color tertiaryContainer = const Color(0xffCEE5FF);
  Color onTertiaryContainer = const Color(0xFF260059);
  Color tertiaryFixed = const Color(0xffEBDDFF);
  Color onTertiaryFixed = const Color(0xff260059);
  Color tertiaryFixedDim = const Color(0xffD3BBFF);
  Color onTertiaryFixedVariant = const Color(0xff533688);
}

class ErrorColor {
  Color error0 = const Color(0xff000000);
  Color error4 = const Color(0xff410002);
  Color error5 = const Color(0xff2D0001);
  Color error6 = const Color(0xff310001);
  Color error10 = const Color(0xff410002);
  Color error12 = const Color(0xff490002);
  Color error17 = const Color(0xff5C0004);
  Color error20 = const Color(0xff690005);
  Color error22 = const Color(0xff710005);
  Color error24 = const Color(0xff790006);
  Color error25 = const Color(0xff7E0007);
  Color error30 = const Color(0xff93000A);
  Color error35 = const Color(0xffA80710);
  Color error40 = const Color(0xffBA1A1A);
  Color error50 = const Color(0xffDE3730);
  Color error60 = const Color(0xffFF5449);
  Color error70 = const Color(0xffFF897D);
  Color error80 = const Color(0xffFFB4AB);
  Color error90 = const Color(0xffFFDAD6);
  Color error92 = const Color(0xffFFE2DE);
  Color error94 = const Color(0xffFFE9E6);
  Color error96 = const Color(0xffFFF0EE);
  Color error98 = const Color(0xffFFF8F7);
}

class NeutralColor {
  Color neutral0 = const Color(0xff000000);
  Color neutral4 = const Color(0xff0D0E11);
  Color neutral5 = const Color(0xff101114);
  Color neutral6 = const Color(0xff121316);
  Color neutral00 = const Color(0xff666666);
  Color neutral10 = const Color(0xff1A1B1E);
  Color neutral12 = const Color(0xff1E1F23);
  Color neutral17 = const Color(0xff292A2D);
  Color neutral20 = const Color(0xff2F3033);
  Color neutral22 = const Color(0xff343538);
  Color neutral24 = const Color(0xff38393C);
  Color neutral25 = const Color(0xff3A3B3F);
  Color neutral30 = const Color(0xff46474A);
  Color neutral35 = const Color(0xff525256);
  Color neutral40 = const Color(0xff5E5E62);
  Color neutral50 = const Color(0xff77777A);
  Color neutral60 = const Color(0xff909094);
  Color neutral70 = const Color(0xffABABAF);
  Color neutral80 = const Color(0xffC7C6CA);
  Color neutral87 = const Color(0xffDBD9DD);
  Color neutral90 = const Color(0xffE3E2E6);
  Color neutral92 = const Color(0xffE9E7EC);
  Color neutral94 = const Color(0xffEFEDF1);
  Color neutral95 = const Color(0xffF1F0F4);
  Color neutral96 = const Color(0xffF4F3F7);
  Color neutral98 = const Color(0xffFAF9FD);
  Color neutral99 = const Color(0xffFDFBFF);
  Color neutral100 = const Color(0xffFFFFFF);
}

class NeutralVariantColor {
  Color neutralVariant0 = const Color(0xff000000);
  Color neutralVariant4 = const Color(0xff0B0E15);
  Color neutralVariant5 = const Color(0xff0E1118);
  Color neutralVariant6 = const Color(0xff10131A);
  Color neutralVariant10 = const Color(0xff181C22);
  Color neutralVariant12 = const Color(0xff1C2027);
  Color neutralVariant17 = const Color(0xff272A31);
  Color neutralVariant20 = const Color(0xff2d3038);
  Color neutralVariant22 = const Color(0xff32353C);
  Color neutralVariant24 = const Color(0xff363941);
  Color neutralVariant25 = const Color(0xff383B43);
  Color neutralVariant30 = const Color(0xff44474E);
  Color neutralVariant35 = const Color(0xff4F525A);
  Color neutralVariant40 = const Color(0xff5B5E66);
  Color neutralVariant50 = const Color(0xff74777F);
  Color neutralVariant60 = const Color(0xff8E9099);
  Color neutralVariant70 = const Color(0xffA9ABB4);
  Color neutralVariant80 = const Color(0xffC4C6D0);
  Color neutralVariant87 = const Color(0xffD8DAE3);
  Color neutralVariant90 = const Color(0xffE0E2EC);
  Color neutralVariant92 = const Color(0xffE6E8F1);
  Color neutralVariant94 = const Color(0xffECEDF7);
  Color neutralVariant95 = const Color(0xffEFF0FA);
  Color neutralVariant96 = const Color(0xffF1F3FD);
  Color neutralVariant98 = const Color(0xffF9F9FF);
  Color neutralVariant99 = const Color(0xffFDFBFF);
  Color neutralVariant100 = const Color(0xffFFFFFF);
}

class SuccessColor {
  Color green = const Color(0xff20E500);
}

class WarningColor {
  Color red = const Color(0xffE5001B);
}

class BlackColor {
  Color black = const Color(0xFF1A1A1A);
}

TextStyle setTextStyle(Color color) => GoogleFonts.roboto(color: color);
