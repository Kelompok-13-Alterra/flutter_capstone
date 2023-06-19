import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

class LocationNotFoundScreen extends StatefulWidget {
  const LocationNotFoundScreen({super.key});

  @override
  State<LocationNotFoundScreen> createState() => _LocationNotFoundScreenState();
}

class _LocationNotFoundScreenState extends State<LocationNotFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                  width: 166,
                  height: 141,
                  child: Image.asset(
                      'assets/icons/errors/location_not_found.png')),
              const SizedBox(
                height: 20,
              ),
Text(
                "Lokasi yang kamu cari tidak ada",
                style: setTextStyle(NeutralColor().neutral0)
                .copyWith(fontWeight: bold,fontSize: 16),
                ),

              const SizedBox(
                height: 10,
              ),
              Text(
                "Kami tidak menemukan lokasi yang kamu cari, coba cari dengan kata kunci lain",
                    textAlign: TextAlign.center,
                style: setTextStyle(NeutralColor().neutral50)
                  .copyWith(fontWeight:medium,fontSize: 14 ),
                ),


            ],
          ),
        ),
      ),
    );
  }
}
