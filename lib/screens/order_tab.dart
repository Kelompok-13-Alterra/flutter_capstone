import 'package:flutter/material.dart';
import 'package:flutter_capstone_order_tab_bar/widgets/booked_widget.dart';
import 'package:flutter_capstone_order_tab_bar/widgets/history_ordered_widget.dart';
import '../theme.dart';

class OrderTabScreen extends StatefulWidget {
  const OrderTabScreen({super.key});

  @override
  State<OrderTabScreen> createState() => _OrderTabScreenState();
}

class _OrderTabScreenState extends State<OrderTabScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      _currentTabIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: kWhiteColor,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: kBlackColor,
            onPressed: () {
              // Aksi ketika tombol panah kembali ditekan
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Orders',
                style:
                    blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
              ),
              IconButton(
                icon: Icon(Icons.more_vert, color: kBlackColor),
                onPressed: () {
                  // Aksi ketika tombol tanda titik tiga ditekan
                },
              ),
            ],
          ),
        ),
        body: Container(
          color: kWhiteColor,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Expanded(
              child: DefaultTabController(
                length: 2, // Jumlah tab yang ingin ditampilkan
                initialIndex: _currentTabIndex,
                child: Column(
                  children: [
                    Container(
                      color: kWhiteColor,
                      child: TabBar(
                        controller: _tabController,
                        indicatorColor: kPrimaryColor,
                        unselectedLabelColor: kGreyColor,
                        labelColor: kBlackColor,
                        tabs: const [
                          Tab(
                            text: "Booked",
                          ),
                          Tab(
                            text: "History",
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: const [
                          // Widget yang ingin ditampilkan di tab "Booked"
                          BookedWidget(),
                          // Widget yang ingin ditampilkan di tab "History"
                          HistoryOrdered(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
