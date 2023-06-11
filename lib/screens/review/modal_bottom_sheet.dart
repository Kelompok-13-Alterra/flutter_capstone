// import 'package:flutter/material.dart';

// Widget ShowModalBottomSheet (BuildContext context){
//   return showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         backgroundColor: SourceColor().white,
//         enableDrag: false,
//         isDismissible: false,
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.vertical(
//           top: Radius.circular(10),
//         )),
//         builder: (context) {
//           return FractionallySizedBox(
//             heightFactor: 309,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(
//                     top: 55.71,
//                     bottom: 41.91,
//                   ),
//                   child: Image.asset(
//                     "assets/image/success_to_rate.png",
//                     width: 59.38,
//                     height: 59.38,
//                   ),
//                 ),
//                 Text(
//                   "Yey, kamu berhasil menilai office!",
//                   style: setTextStyle(NeutralColor().neutral17).copyWith(
//                     fontSize: 16,
//                     fontWeight: medium,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 Text(
//                   "Selamat! kamu berhasil menilai office! Silahkan lanjutkan submit!",
//                   style: setTextStyle(NeutralColor().neutral17).copyWith(
//                     fontSize: 12,
//                     fontWeight: regular,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 16,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     fixedSize: const Size(365, 50),
//                     backgroundColor: PrimaryColor().primary,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(100),
//                     ),
//                   ),
//                   child: const Center(
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                         top: 15,
//                         bottom: 15,
//                       ),
//                       child: Text("Okay!"),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       );
// }