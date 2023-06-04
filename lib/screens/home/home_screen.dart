import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/home/widget/background_widget.dart';
import 'package:flutter_capstone/screens/home/widget/filterchoice.dart';
import 'package:flutter_capstone/screens/home/widget/home_widget.dart';
import 'package:flutter_capstone/view_model/home/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.microtask(
        () => Provider.of<HomeViewModel>(context, listen: false).getOffice());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BackgroundWidget(),
            const FilterChoice(),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Consumer<HomeViewModel>(
                builder: (context, offices, child) {
                  return ListView.builder(
                    itemCount: offices.listOffice.length,
                    itemBuilder: (context, index) {
                      final data = offices.listOffice[index];
                      return HomeWidget(
                        office: data,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
