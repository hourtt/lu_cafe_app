// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field

import 'package:cafe/pages/menu.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

class CurvedBottomBar extends StatefulWidget {
  const CurvedBottomBar({super.key});

  @override
  State<CurvedBottomBar> createState() => _CurvedBottomBarState();
}

class _CurvedBottomBarState extends State<CurvedBottomBar> {
  int _pages = 0;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      //* (CurvedNavigationBar) before replace: put in the bottomNavigationBar
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: Color.fromARGB(255, 34, 131, 107),
      color: Color.fromARGB(255, 70, 93, 87),
      animationDuration: Duration(milliseconds: 300),
      items: <CurvedNavigationBarItem>[
        CurvedNavigationBarItem(
          child: Icon(
            Icons.home,
            color: Colors.white,
            size: 35,
          ),
        ),
        CurvedNavigationBarItem(
          child: Icon(
            Icons.menu_book_rounded,
            color: Colors.white,
            size: 35,
          ),
        ),
        CurvedNavigationBarItem(
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 35,
          ),
        ),
        CurvedNavigationBarItem(
          child: Icon(
            Icons.list_alt_rounded,
            color: Colors.white,
            size: 35,
          ),
        ),
        CurvedNavigationBarItem(
          child: Icon(
            Icons.account_circle,
            color: Colors.white,
            size: 35,
          ),
        ),
      ],
      onTap: (index) {
        if (index == 1) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MenuPage()),
          );
        } else {
          setState(() {
            _pages = index;
          });
        }
      },
    );
  }
}
