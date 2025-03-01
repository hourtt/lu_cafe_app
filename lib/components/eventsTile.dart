// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'dart:async';
class EventsTile extends StatefulWidget {
  const EventsTile({super.key});

  @override
  State<EventsTile> createState() => _EventsTileState();
}

class _EventsTileState extends State<EventsTile> with AutomaticKeepAliveClientMixin {
  double defaultPadding = 15.0;
  int _currentPage = 0;
  late PageController _pageController;

  final List<String> events = [
    "images/schoolEvent/se1.jpeg",
    "images/schoolEvent/se2.png",
    "images/schoolEvent/se3.jpg",
    "images/schoolEvent/se4.jpg",
    "images/schoolEvent/se5.jpg",
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_currentPage < events.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 5000),
        curve: Curves.easeOut,
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
            itemCount: events.length,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            itemBuilder: (context, index) => Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 1.2,
                //height: MediaQuery.of(context).size.height * 1.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: AssetImage(events[index]),
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