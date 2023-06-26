import 'package:flutter/material.dart';
import 'package:flutter_capstone/services/profile/profile_service.dart';
import 'package:flutter_tawk/flutter_tawk.dart';
import 'package:provider/provider.dart';

class BookingViaChatScreen extends StatefulWidget {
  const BookingViaChatScreen({super.key});

  @override
  State<BookingViaChatScreen> createState() => _BookingViaChatScreenState();
}

class _BookingViaChatScreenState extends State<BookingViaChatScreen> {
  Future<dynamic>? provileViewModel;
  @override
  void initState() {
    final provileService = Provider.of<ProfileService>(context, listen: false);
    provileViewModel = provileService.getProfile();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: provileViewModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SafeArea(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Tawk(
                      directChatLink:
                          'https://tawk.to/chat/649914c0cc26a871b024a847/1h3qvi4lb',
                      visitor: TawkVisitor(
                        name: 'Ayoub AMINE',
                        email: 'ayoubamine2a@gmail.com',
                      ),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              Text(
                snapshot.error.toString(),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

// SafeArea(
//         child: Column(
//           children: [
//             IconButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               icon: Icon(Icons.arrow_back),
//             ),
//             Tawk(
//               directChatLink:
//                   'https://tawk.to/chat/649914c0cc26a871b024a847/1h3qvi4lb',
//               visitor: TawkVisitor(
//                 name: 'Ayoub AMINE',
//                 email: 'ayoubamine2a@gmail.com',
//               ),
//             )
//           ],
//         ),
//       ),