import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/booking/booking_screen.dart';
import 'package:flutter_capstone/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:flutter_capstone/screens/card-search-bar/office_card_widget.dart';
import 'package:flutter_capstone/screens/edit_profile/edit_profile_screen.dart';
import 'package:flutter_capstone/screens/home/home_screen.dart';
import 'package:flutter_capstone/screens/login/login_screen.dart';
import 'package:flutter_capstone/screens/order/detail_schedule.dart';
import 'package:flutter_capstone/screens/order/order_screen.dart';
import 'package:flutter_capstone/screens/profile/profile_screen.dart';
import 'package:flutter_capstone/screens/rating/image_picker_rating_screen.dart';
import 'package:flutter_capstone/screens/review/review_screen.dart';
import 'package:flutter_capstone/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_capstone/screens/detail/detail_screen.dart';
import 'package:flutter_capstone/screens/splash/boarding_screen.dart';
import 'package:flutter_capstone/screens/splash/splash_screen.dart';
import 'package:flutter_capstone/screens/errors/connection_error.dart';
import 'package:flutter_capstone/screens/errors/location_not_found.dart';
import 'package:flutter_capstone/screens/errors/page_not_found.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final bottomNavParamater = ModalRoute.of(context)?.settings.arguments ?? '';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Office Booking (Capstone Project Kel 13)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen (),
        '/login': (context) => const LoginScreen(),
        '/sign-up': (context) => const SignUpScreen(),
        '/boarding': (context) => const BoardingScreen(),
        '/bottom-nav': (context) =>
            BottomNavScreen(token: bottomNavParamater.toString()),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/order': (context) => const OrderScreen(),
        '/review': (context) => const ReviewScreen(),
        '/image-picker': (context) => const ImagePickerRatingScreen(),
        '/detail': (context) => const DetailScreen(),
        '/detail-schedule': (context) => const DetailScheduleScreen(),
        '/card-search-bar': (context) => const OfficeCardWidget(),
        '/booking': (context) => const BookingScheduleScreen(),
        '/edit-profile': (context) => const EditProfileScreen(),
        '/page-not-found-screen': (context) => const PageNotFoundScreen(),
      '/location-not-found-screen': (context) => const LocationNotFoundScreen(),
      '/connection-error-screen': (context) => const ConnectionErrorScreen(),
      

      },
    );
  }
}
