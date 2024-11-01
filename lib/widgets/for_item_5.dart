// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cafe/pages/order/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

// import 'itemsWidget5.dart';

class BottomSheetContent2 extends StatefulWidget {
  final String itemName;
  final String price;
  final String currentOption;
  final ValueChanged<String> onOptionChanged;

  BottomSheetContent2({
    required this.itemName,
    required this.price,
    required this.currentOption,
    required this.onOptionChanged,
  });

  @override
  State<BottomSheetContent2> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent2> {
  late String currentOption;
  int quantityCount = 1;

  @override
  void initState() {
    super.initState();
    currentOption = widget.currentOption;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.itemName,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              ),
            ],
          ),
          SizedBox(height: 30),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context)!.optional,
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 114, 112, 112),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.price,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: decrementQuantity,
                      icon: Icon(
                        Icons.remove_circle,
                        size: 30,
                      ),
                    ),
                    SizedBox(
                      width: 40,
                      child: Center(
                        child: Text(
                          quantityCount.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: incrementQuantity,
                      icon: Icon(
                        Icons.add_circle,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 19),
              child: AnimatedButton(
                //* New alert dialog
                height: 60,
                text: AppLocalizations.of(context)!.addToCart,
                color: Color.fromRGBO(74, 140, 215, 1),
                pressEvent: () {
                  addToCart(); //* add addtoCart Function here
                  AwesomeDialog(
                    padding: EdgeInsets.all(16),
                    context: context,
                    // barrierColor: Color.fromRGBO(74, 140, 215, 1),
                    dialogType: DialogType.success,
                    dialogBorderRadius: BorderRadius.circular(25),
                    // dialogBackgroundColor: Color.fromRGBO(181, 209, 226, 1),
                    dialogBackgroundColor: Colors.white,
                    // borderSide: const BorderSide(
                    //   color: Color.fromRGBO(181, 209, 226, 1.5),
                    // ),
                    width: 400,
                    buttonsBorderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                    dismissOnTouchOutside: false,
                    dismissOnBackKeyPress: false,
                    headerAnimationLoop: false,
                    animType: AnimType.bottomSlide,
                    title: 'Success',
                    desc: 'Your item has been added to the cart',
                    btnOkOnPress: () {},
                    btnOkColor: Color.fromRGBO(74, 140, 215, 1),
                  ).show();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void decrementQuantity() {
    setState(() {
      if (quantityCount > 1) {
        quantityCount--;
      }
    });
  }

  void incrementQuantity() {
    setState(() {
      quantityCount++;
    });
  }

  void addToCart() {
    Map<String, dynamic> item = {
      //* Store an item name, price, quantity, quality
      'name': widget.itemName,
      'price': widget.price,
      'quantity': quantityCount,
      'quality': currentOption,
    };
    Provider.of<OrderProvider>(context, listen: false)
        .addItem(item); //* Using provider to add an item to the order page
    // showDialog(
  }
}
