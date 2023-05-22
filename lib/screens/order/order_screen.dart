import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/widgets/order/booked_widget.dart';
import 'package:flutter_capstone/widgets/history/history_ordered_widget.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
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
              Navigator.pushNamed(context, '/home');
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
