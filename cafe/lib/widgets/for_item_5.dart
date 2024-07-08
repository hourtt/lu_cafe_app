// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cafe/pages/order/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                    "Optional (+\$0.00)",
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
                    _buildIconButton(
                      icon: Icons.remove_circle_outline,
                      onPressed: decrementQuantity,
                      color: Color.fromARGB(255, 220, 87, 77),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 35,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(190, 124, 190, 236),
                        border: Border.all(
                          color: Color.fromARGB(255, 142, 160, 193),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          '$quantityCount',
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 49, 50, 51),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    _buildIconButton(
                      icon: Icons.add_box_outlined,
                      onPressed: incrementQuantity,
                      color: Color.fromARGB(255, 41, 118, 44),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 35),
          // Center(
          //   child: ElevatedButton(
          //     onPressed: () {
          //       addToCart();
          //     },
          //     style: ElevatedButton.styleFrom(
          //       padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          //       backgroundColor: Color.fromARGB(255, 74, 140, 215),
          //     ),
          //     child: Text(
          //       "Add to Cart",
          //       style: TextStyle(
          //         fontSize: 20,
          //         color: Colors.white,
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //   ),
          // ), Center(
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
              child: AnimatedButton(
                //* New alert dialog
                height: 57,
                text: 'Add to Cart',
                buttonTextStyle: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.w400,
                ),
                color: Color.fromARGB(255, 74, 140, 215),
                pressEvent: () {
                  addToCart(); //* add addtoCart Function here
                  AwesomeDialog(
                    padding: EdgeInsets.all(20),
                    context: context,
                    dialogType: DialogType.success,
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    width: 400,
                    buttonsBorderRadius: const BorderRadius.all(
                      Radius.circular(2),
                    ),
                    dismissOnTouchOutside: false,
                    dismissOnBackKeyPress: false,
                    headerAnimationLoop: false,
                    animType: AnimType.bottomSlide,
                    title: 'Success!!',
                    desc: 'Your item has been added to the cart',
                    btnOkOnPress: () {},
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
      'name': widget.itemName,
      'price': widget.price,
      'quantity': quantityCount,
      'quality': currentOption,
    };
    Provider.of<OrderProvider>(context, listen: false).addItem(item);
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.15),
      ),
      child: IconButton(
        icon: Icon(icon),
        color: color,
        iconSize: 24,
        onPressed: onPressed,
      ),
    );
  }
}
