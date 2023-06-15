import 'package:flutter/material.dart';
import 'package:flutter_capstone/style/text_style.dart';

class EmptySearch extends StatefulWidget {
  const EmptySearch({super.key});

  @override
  State<EmptySearch> createState() => _EmptySearchState();
}

class _EmptySearchState extends State<EmptySearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SourceColor().white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
