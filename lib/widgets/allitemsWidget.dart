import 'package:cafe/widgets/itemWidget.dart';
import 'package:cafe/widgets/itemWidget2.dart';
import 'package:cafe/widgets/itemWidget3.dart';
import 'package:cafe/widgets/itemWidget4.dart';
import 'package:cafe/widgets/itemWidget5.dart';
import 'package:flutter/material.dart';

class AllItemsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Items"),
        backgroundColor: Color.fromARGB(255, 94, 134, 143),
      ),
      body: ListView(
        children: [
          ItemsWidget(),
          ItemsWidget2(),
          ItemsWidget3(),
          ItemsWidget4(),
          ItemsWidget5(),
        ],
      ),
    );
  }
}