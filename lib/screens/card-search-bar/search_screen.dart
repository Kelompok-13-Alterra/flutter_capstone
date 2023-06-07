// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/card-search-bar/empty_search.dart';
import 'package:flutter_capstone/screens/card-search-bar/office_recommendation_widget.dart';
import 'package:flutter_capstone/screens/card-search-bar/search_office_view_model.dart';
import 'package:flutter_capstone/screens/errors/location_not_found.dart';
import 'package:flutter_capstone/services/search_office/search_service.dart';

import 'package:flutter_capstone/style/text_style.dart';
import 'package:provider/provider.dart';

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

  List<String> statusKantor = [
    'Close',
    'Close',
    'Close',
    'Close',
  ];

  List rating = [
    4.6,
    4.8,
    4.6,
    4.8,
  ];

  @override
  Widget build(BuildContext context) {
    SearchOfficeViewModel searchOfficeProvider =
        Provider.of<SearchOfficeViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              onChanged: (value) {
                searchOfficeProvider.onChange(value);
              },
              controller: searchOfficeProvider.searchBarController,
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
                prefixIcon: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 22,
                    horizontal: 19,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back),
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
          FutureBuilder(
            future: SearchService().getSearch(searchOfficeProvider.searchQuery),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var search = snapshot.data;
                print('ini eror ${snapshot.error}');
                return Expanded(
                  child: searchOfficeProvider.searchQuery == '' &&
                          searchOfficeProvider.isSearch == false
                      ? const EmptySearch()
                      : snapshot.data!.data.isEmpty &&
                              searchOfficeProvider.isSearch == true
                          ? const LocationNotFoundScreen()
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16, bottom: 13.63, left: 16),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kantor yang cocok untuk kamu",
                                        style: setTextStyle(BlackColor().black)
                                            .copyWith(
                                          fontSize: 16,
                                          fontWeight: regular,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: search?.data.length,
                                    itemBuilder: (context, index) {
                                      var data = snapshot.data?.data[index];
                                      return OfficeRecommendationWidget(
                                        img: imageKantor[index],
                                        statusKantor: statusKantor[index],
                                        namaKantor: data?.name ?? "",
                                        imgRating: iconImage[0],
                                        rating: rating[index],
                                        imgCoWorkingOffice: iconImage[1],
                                        office: data?.type ?? "",
                                        imgLocation: iconImage[2],
                                        location: data?.location ?? "",
                                        imgTime: iconImage[3],
                                        time: '${data?.open} - ${data?.close}',
                                        price: data?.price ?? 0,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        CircularProgressIndicator(),
                      ],
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
