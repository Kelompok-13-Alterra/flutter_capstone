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
    return const Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          BackgroundWidget(),
          FilterChoice(),
          HomeWidget(),
        ],
      ),
    );
  }
}
