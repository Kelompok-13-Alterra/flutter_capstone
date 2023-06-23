import 'package:flutter/material.dart';

class ConnectionErrorScreen extends StatelessWidget {
  const ConnectionErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/icons/errors/connection_error.png'),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Sepertinya koneksimu terputus",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Coba periksa koneksi internet kamu atau coba beberapa saat lagi",
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
