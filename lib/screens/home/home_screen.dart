import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/errors/connection_error.dart';
import 'package:flutter_capstone/screens/home/home_view_model.dart';
import 'package:flutter_capstone/screens/home/widget/background_widget.dart';
import 'package:flutter_capstone/screens/home/widget/filterchoice.dart';
import 'package:flutter_capstone/screens/home/widget/home_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<dynamic> getOffice;
  @override
  void initState() {
    //   Future.microtask(
    //       () => Provider.of<HomeViewModel>(context, listen: false).getOffice());
    getOffice = Provider.of<HomeViewModel>(context, listen: false).getOffice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: getOffice,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CustomScrollView(
              slivers: [
                BackgroundWidget(),
                FilterChoice(),
                HomeWidget(),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return const Center(child: Text("error"));
          }
        },
      ),
    );
  }
}
