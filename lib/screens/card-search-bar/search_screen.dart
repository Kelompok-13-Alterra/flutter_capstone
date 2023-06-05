// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_capstone/model/search_office/search_model.dart';
import 'package:flutter_capstone/screens/card-search-bar/office_recommendation_widget.dart';
import 'package:flutter_capstone/service/search_office/search_service.dart';
import 'package:flutter_capstone/style/text_style.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List iconImage = [
    'assets/image/star_purple500.png',
    'assets/image/co_working_space.png',
    'assets/image/location.png',
    'assets/image/time.png',
  ];

  List imageKantor = [
    'assets/image/wellspace.png',
    'assets/image/seo_office.png',
    'assets/image/pase_office.png',
    'assets/image/agung_space.png',
  ];

  List<String> office = [
    'Co-Working Space',
    'Co-Working Space',
    'Office',
    'Co-Working Space',
  ];

  List rating = [
    4.6,
    4.8,
    4.6,
    4.8,
  ];

  final _searchBarController = TextEditingController();
  SearchModel? searchModel;

  List data = [];

  // @override
  // void initState() {
  //   _findOffice = searchModel.data;
  //   super.initState();
  // }

  // void _filter(String inputKeywords) {
  //   List results = [];
  //   if (inputKeywords.isEmpty) {
  //     results = searchModel.data;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SourceColor().white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: TextFormField(
              onChanged: (text) {
                text = text.toLowerCase();
                print(text);
                setState(() {
                  data = searchModel!.data.where((element) {
                    var finalLocation =
                        element.location.toString().toLowerCase();
                    return finalLocation.contains(text);
                  }).toList();
                });
              },
              controller: _searchBarController,
              decoration: InputDecoration(
                filled: true,
                fillColor: NeutralColor().neutral96,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Ketik Nama Daerah',
                hintStyle: setTextStyle(NeutralVariantColor().neutralVariant30)
                    .copyWith(
                  fontSize: 16,
                  fontWeight: regular,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 22,
                    horizontal: 19,
                  ),
                  child: Image.asset(
                    "assets/image/icon.png",
                    width: 18,
                    height: 12,
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(
                    right: 13,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.search,
                        color: NeutralVariantColor().neutralVariant30,
                      ),
                      const SizedBox(
                        width: 19.51,
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                        child: CircleAvatar(
                          backgroundColor: PrimaryColor().primary,
                          child: Text(
                            "A",
                            style: setTextStyle(PrimaryColor().onPrimary)
                                .copyWith(fontSize: 16, fontWeight: medium),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 13.63, left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Kantor yang cocok untuk kamu",
                  style: setTextStyle(BlackColor().black).copyWith(
                    fontSize: 16,
                    fontWeight: regular,
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder(
            future: SearchService().getSearch(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var search = snapshot.data;
                print(snapshot.error);
                return ListView.builder(
                  itemCount: search?.data.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data?.data[index];
                    print("ini ${data}");
                    return Column(
                      children: [
                        // Text(search!.data[index].name),
                        Text(data?.deletedAt.toString() ?? 'Unavailable date'),
                        Text('Ofice Name : ${data!.name}'),
                      ],
                    );
                    // OfficeRecommendationWidget(
                    //   img: imageKantor[index],
                    //   statusKantor: data!.status,
                    //   // statusKantor: search!.data[index].status,
                    //   namaKantor: data.name,
                    //   imgRating: iconImage[0],
                    //   rating: rating[index],
                    //   imgCoWorkingOffice: iconImage[1],
                    //   office: office[index],
                    //   imgLocation: iconImage[2],
                    //   location: data.location,
                    //   imgTime: iconImage[3],
                    //   time: '${data.open} - ${data.close}',
                    //   // price: search.data[index].price,
                    //   price: data.price,
                    // );
                  },
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}

// ListView.builder(
//                   itemCount: search?.data.length,
//                   itemBuilder: (context, index) {
//                     return OfficeRecommendationWidget(
//                       img: imageKantor[index],
//                       statusKantor: search!.data[index].status,
//                       namaKantor: search.data[index].name,
//                       imgRating: iconImage[0],
//                       rating: rating[index],
//                       imgCoWorkingOffice: iconImage[1],
//                       office: office[index],
//                       imgLocation: iconImage[2],
//                       location: search.data[index].location,
//                       imgTime: iconImage[3],
//                       time:
//                           '${search.data[index].open} - ${search.data[index].close}',
//                       price: search.data[index].price,
//                     );
//                   },
//                 );

          // ListView.builder(
          //   shrinkWrap: true,
          //   scrollDirection: Axis.vertical,
          //   itemCount: listNamaKantor.length,
          //   itemBuilder: (context, index) {
          //     return OfficeRecommendationWidget(
          //       img: imageKantor[index],
          //       statusKantor: statusKantor[index],
          //       namaKantor: listNamaKantor[index],
          //       imgRating: iconImage[0],
          //       rating: rating[index],
          //       imgCoWorkingOffice: iconImage[1],
          //       office: office[index],
          //       imgLocation: iconImage[2],
          //       location: location[index],
          //       imgTime: iconImage[3],
          //       time: time[index],
          //       price: price[index],
          //     );
          //   },
          // ),
                    // OfficeRecommendationWidget(
                    //   img: imageKantor[index],
                    //   statusKantor: search!.data[index].status,
                    //   // statusKantor: search!.data[index].status,
                    //   namaKantor: search.data[index].name,
                    //   imgRating: iconImage[0],
                    //   rating: rating[index],
                    //   imgCoWorkingOffice: iconImage[1],
                    //   office: office[index],
                    //   imgLocation: iconImage[2],
                    //   location: search.data[index].location,
                    //   imgTime: iconImage[3],
                    //   time:
                    //       '${search.data[index].open} - ${search.data[index].close}',
                    //   // price: search.data[index].price,
                    //   price: 200000,
                    // );
                    
              // return CircularProgressIndicator();
              // if (snapshot.hasData) {
              //   var search = snapshot.data;
              //   return ListView.builder(
              //     itemCount: search?.data.length,
              //     itemBuilder: (context, index) {
              //       return OfficeRecommendationWidget(
              //         img: imageKantor[index],
              //         statusKantor: search!.data[index].status,
              //         // statusKantor: search!.data[index].status,
              //         namaKantor: search.data[index].name,
              //         imgRating: iconImage[0],
              //         rating: rating[index],
              //         imgCoWorkingOffice: iconImage[1],
              //         office: office[index],
              //         imgLocation: iconImage[2],
              //         location: search.data[index].location,
              //         imgTime: iconImage[3],
              //         time:
              //             '${search.data[index].open} - ${search.data[index].close}',
              //         price: search.data[index].price,
              //       );
              //     },
              //   );
              // }

                            // if (snapshot.error != null) {
              //   print('ini eror : ${snapshot.error}');
              //   return Text("${snapshot.error}");
              // }
              // if (snapshot.connectionState == ConnectionState.waiting) {
              //   return const CircularProgressIndicator();
              // }