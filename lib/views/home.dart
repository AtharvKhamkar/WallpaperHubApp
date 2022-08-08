import 'package:flutter/material.dart';
import 'package:wallpaperapp/widget/widget.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Brandname(),
        elevation: 1.0,
      ),
    );
  }
}
