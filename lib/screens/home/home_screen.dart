import 'package:flutter/material.dart';
import 'package:flutter_capstone/screens/home/widget/background_widget.dart';
import 'package:flutter_capstone/screens/home/widget/home_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: const BackgroundWidget(),
            ),
          ];
        },
        body: const HomeWidget(),
      ),
    );
  }
}
