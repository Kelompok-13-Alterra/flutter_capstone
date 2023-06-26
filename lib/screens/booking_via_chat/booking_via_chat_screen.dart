import 'package:flutter/material.dart';

import 'package:flutter_capstone/services/profile/profile_service.dart';
import 'package:flutter_tawk/flutter_tawk.dart';


class BookingViaChatScreen extends StatefulWidget {
  const BookingViaChatScreen({super.key});

  @override
  State<BookingViaChatScreen> createState() => _BookingViaChatScreenState();
}

class _BookingViaChatScreenState extends State<BookingViaChatScreen> {
  // Future<dynamic>? profileViewModel;
  // @override
  // void initState() {
  //   final profileService = Provider.of<ProfileService>(context, listen: false);
  //   profileViewModel = profileService.profile();

  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //         icon: Icon(
      //           Icons.arrow_back,
      //           color: Colors.black,
      //         )),
      //   ],
      // ),
      body:
          // Tawk(
          //   directChatLink:
          //       'https://tawk.to/chat/649914c0cc26a871b024a847/1h3qvi4lb',
          //   visitor: TawkVisitor(
          //     name: 'Ulfa',
          //     email: 'ulfa@gmail.com',
          //   ),
          // )

          FutureBuilder(
              future: ProfileService().profile(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data;
                  return SafeArea(
                    child: SizedBox(
                      child: Tawk(
                        directChatLink:
                            'https://tawk.to/chat/649914c0cc26a871b024a847/1h3qvi4lb',
                        visitor: TawkVisitor(
                          name: data?.data.name,
                          email: data?.data.email,
                        ),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  Text(
                    snapshot.error.toString(),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const SafeArea(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
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