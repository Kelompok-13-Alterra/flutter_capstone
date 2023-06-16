import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/order/booked_screen.dart';
import 'package:flutter_capstone/screens/order/history_screen.dart';
import 'package:flutter_capstone/style/text_style.dart';
import 'package:flutter_capstone/view_model/order/history_view_model.dart';
import 'package:flutter_capstone/view_model/order/booked_view_model.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

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

    final historyViewModel =
        Provider.of<HistoryViewModel>(context, listen: false);
    historyViewModel.getOffice();

    final bookedViewModel =
        Provider.of<BookedViewModel>(context, listen: false);
    bookedViewModel.getOffice();
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
        // centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(
          'Orders',
          style: setTextStyle(SourceColor().black).copyWith(
            fontSize: 16,
            fontWeight: medium,
          ),
        ),
        leading: null,
      ),
      body: Container(
        color: SourceColor().white,
        child: Padding(
          padding: const EdgeInsets.all(5),
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
                    children: const <Widget>[
                      BookedOrderScreen(),
                      HistoryOrderScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
