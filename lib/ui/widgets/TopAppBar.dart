import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../colors/Colors.dart';

class TopAppBar extends StatefulWidget {
  final String appBarTitle;
  const TopAppBar({Key? key, required this.appBarTitle}) : super(key: key);

  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.appBarTitle,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: darkappbar,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      // Your other scaffold properties here
    );
  }
}