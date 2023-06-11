import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/booking/booking_screen.dart';
import 'package:flutter_capstone/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:flutter_capstone/screens/detail/detail_view_model.dart';
import 'package:flutter_capstone/screens/search/search_office_view_model.dart';
import 'package:flutter_capstone/screens/search/search_screen.dart';
import 'package:flutter_capstone/screens/edit_profile/edit_profile_screen.dart';
import 'package:flutter_capstone/screens/errors/connection_error.dart';
import 'package:flutter_capstone/screens/errors/location_not_found.dart';
import 'package:flutter_capstone/screens/errors/page_not_found.dart';
import 'package:flutter_capstone/screens/home/home_screen.dart';
import 'package:flutter_capstone/screens/home/home_view_model.dart';
import 'package:flutter_capstone/screens/login/login_screen.dart';
import 'package:flutter_capstone/screens/login/login_view_model.dart';
import 'package:flutter_capstone/screens/order/detail_schedule.dart';
import 'package:flutter_capstone/screens/order/order_screen.dart';
import 'package:flutter_capstone/screens/profile/profile_screen.dart';
import 'package:flutter_capstone/screens/rating/image_picker_rating_screen.dart';
import 'package:flutter_capstone/screens/review/review_screen.dart';
import 'package:flutter_capstone/screens/sign_up/sign_up_screen.dart';
import 'package:flutter_capstone/screens/sign_up/signup_view_model.dart';
import 'package:flutter_capstone/screens/splash/boarding_screen.dart';
import 'package:flutter_capstone/screens/splash/splash_screen.dart';
import 'package:flutter_capstone/screens/payment/payment-view-model.dart';
import 'package:flutter_capstone/view_model/order/booked_view_model.dart';
import 'package:flutter_capstone/view_model/order/history_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => LoginViewModel(),
        ),
        ListenableProvider(
          create: (context) => HomeViewModel(),
        ),
        ListenableProvider(
          create: (context) => SearchOfficeViewModel(),
        ),
        ListenableProvider(
          create: (context) => SignupViewModel(),
        ),
        ListenableProvider(
          create: (context) => PaymentViewModel(),
        ),
        ListenableProvider(
          create: (context) => DetailViewModel(),
        ),
        ListenableProvider(
          create: (context) => BookedViewModel(),
        ),
        ListenableProvider(
          create: (context) => HistoryViewModel(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // final bottomNavParamater = ModalRoute.of(context)?.settings.arguments ?? '';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Office Booking (Capstone Project Kel 13)',
      theme: ThemeData(
        primarySwatch: color,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/sign-up': (context) => const SignUpScreen(),
        '/boarding': (context) => const BoardingScreen(),
        '/bottom-nav': (context) => const BottomNavScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/order': (context) => const OrderScreen(),
        '/review': (context) => const ReviewScreen(),
        '/image-picker': (context) => const ImagePickerRatingScreen(),
        '/detail-schedule': (context) => const DetailScheduleScreen(),
        '/card-search-bar': (context) => const SearchScreen(),
        '/booking': (context) => const BookingScheduleScreen(),
        '/edit-profile': (context) => const EditProfileScreen(),
        '/search': (context) => const SearchScreen(),
        '/page-not-found-screen': (context) => const PageNotFoundScreen(),
        '/location-not-found-screen': (context) =>
            const LocationNotFoundScreen(),
        '/connection-error-screen': (context) => const ConnectionErrorScreen(),
      },
    );
  }
}

const MaterialColor color = MaterialColor(0xff005DB9, <int, Color>{
  50: Color(0xff005DB9),
  100: Color(0xff005DB9),
  200: Color(0xff005DB9),
  300: Color(0xff005DB9),
  400: Color(0xff005DB9),
  500: Color(0xff005DB9),
  600: Color(0xff005DB9),
  700: Color(0xff005DB9),
  800: Color(0xff005DB9),
  900: Color(0xff005DB9),
});
