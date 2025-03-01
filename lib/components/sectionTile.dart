// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';

class SectionTile extends StatefulWidget {
  const SectionTile({super.key});

  @override
  State<SectionTile> createState() => _SectionTileState();
}

class _SectionTileState extends State<SectionTile> with AutomaticKeepAliveClientMixin {
  double defaultPadding = 15.0;
  int _currentPage = 0;
  late PageController _pageController;

  final List<String> recommended = [
    'images/recommended/rc1.png',
    'images/recommended/rc2.png',
    'images/recommended/rc3.png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < recommended.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AspectRatio(
      aspectRatio: 2,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: recommended.length,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemBuilder: (context, index) => Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(recommended[index]),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}