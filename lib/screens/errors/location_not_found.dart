import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationNotFoundScreen extends StatefulWidget {
  const LocationNotFoundScreen({super.key});

  @override
  State<LocationNotFoundScreen> createState() => _LocationNotFoundScreenState();
}

class _LocationNotFoundScreenState extends State<LocationNotFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cari Lokasi"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
        elevation: 0,
        bottom: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          title: TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill),
              contentPadding: const EdgeInsets.all(0),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          elevation: 0,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/location_not_found.jpg'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Lokasi yang kamu cari tidak ada",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Kami tidak menemukan lokasi yang kamu cari, coba cari dengan kata kunci lain",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
