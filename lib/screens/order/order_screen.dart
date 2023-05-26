import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/history/history_ordered_screen.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/screens/history/booked_screen.dart';

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
          backgroundColor: SourceColor().white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: SourceColor().black,
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Orders',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: medium,
                  color: SourceColor().black,
                ),
              ),
              IconButton(
                icon: Icon(Icons.more_vert, color: SourceColor().black),
                onPressed: () {
                  // Aksi ketika tombol tanda titik tiga ditekan
                },
              ),
            ],
          ),
        ),
        body: Container(
          color: SourceColor().white,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Expanded(
              child: DefaultTabController(
                length: 2, // Jumlah tab yang ingin ditampilkan
                initialIndex: _currentTabIndex,
                child: Column(
                  children: [
                    Container(
                      color: SourceColor().white,
                      child: TabBar(
                        controller: _tabController,
                        indicatorColor: PrimaryColor().primary,
                        unselectedLabelColor: NeutralColor().neutral00,
                        labelColor: NeutralColor().neutral0,
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