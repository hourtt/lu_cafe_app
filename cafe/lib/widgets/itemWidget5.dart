// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, override_on_non_overriding_member

// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:western/widgets/navBar.dart';

class ItemsWidget5 extends StatefulWidget {
  @override
  State<ItemsWidget5> createState() => _ItemsWidget5State();
}

final List<String> options = [
  "Normal Sugar",
  "Less Sugar",
  "More Sugar",
  "No Sugar",
];

class _ItemsWidget5State extends State<ItemsWidget5> {
  String currentOption = options[0];

  PersistentBottomSheetController customShowBottomSheet(
      BuildContext context, int i) {
    return showBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheetContent(
          itemName: itemNames[i],
          price: price[i],
          currentOption: currentOption,
          onOptionChanged: (value) {
            setState(() {
              currentOption = value;
            });
          },
        );
      },
    );
  }

  // List of item names
 final List<String> itemNames = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8",
    "Item 9",
    "Item 10",
    "Item 11",
    "Item 12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "Olatte",
    "Sprite",
    "Pepsi",
    "Coke",
    "22",
  ];

  final List<String> description = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8",
    "Item 9",
    "Item 10",
    "Item 11",
    "Item 12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "Special Olatte",
    "Sprite, boost your mood",
    "With Pepsi, everything is yummy",
    "Coke, Make your food more delicious",
    "22",
  ];

  final List<String> price = [
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
    "Item 6",
    "Item 7",
    "Item 8",
    "Item 9",
    "Item 10",
    "Item 11",
    "Item 12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "\$0.65",
    "\$0.65",
    "\$0.65",
    "\$1.00",
    "22",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: 0.70,
      children: [
        for (int i = 17; i < 21; i++)
          Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black12,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 8,
                ),
              ],
            ),
            child: Column(
              children: [
                Flexible(
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'singleItemPage');
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Image.asset(
                        "images/drink/${i + 1}.png",
                        width: 130,
                        height: 130,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 2),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      itemNames[i],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    description[i],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        margin: EdgeInsets.symmetric(vertical: 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(255, 106, 132, 173),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        height: 37,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 2),
                          child: Text(
                            price[i],
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        onPressed: () {
                          customShowBottomSheet(context, i);
                        },
                        icon: const Icon(Icons.add),
                        style: IconButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 195, 244, 228),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class BottomSheetContent extends StatefulWidget {
  final String itemName;
  final String price;
  final String currentOption;
  final ValueChanged<String> onOptionChanged;

  BottomSheetContent({
    required this.itemName,
    required this.price,
    required this.currentOption,
    required this.onOptionChanged,
  });

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  int quantityCount = 1;

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
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black54.withOpacity(0.6),
        insetPadding: EdgeInsets.only(top: 20),
        title: Text(
          "Successfully added to cart",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(
              "OK",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 550,
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
                    "Sugar Level",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Optional (+\$0.00)",
                    style: TextStyle(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 114, 112, 112),
                    ),
                  ),
                ],
              ),
              ListTile(
                title: Text(
                  'Normal Sugar',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                leading: Radio<String>(
                    value: options[0],
                    groupValue: widget.currentOption,
                    onChanged: (value) {
                      widget.onOptionChanged(value.toString());
                    }
                    ),
              ),
              ListTile(
                title: Text(
                  'Less Sweet',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                leading: Radio<String>(
                  value: options[1],
                  groupValue: widget.currentOption,
                  onChanged: (value) {
                      widget.onOptionChanged(value.toString());
                    }
                ),
              ),
              ListTile(
                title: Text(
                  'More Sweet',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                leading: Radio<String>(
                  value: options[2],
                  groupValue: widget.currentOption,
                  onChanged: (value) {
                      widget.onOptionChanged(value.toString());
                    }
                ),
              ),
              ListTile(
                title: Text(
                  'No Sweet',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                leading: Radio<String>(
                  value: options[3],
                  groupValue: widget.currentOption,
                  onChanged: (value) {
                      widget.onOptionChanged(value.toString());
                    }
                ),
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
            child: ElevatedButton(
              onPressed: addToCart,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 20),
                backgroundColor: const Color.fromARGB(255, 120, 125, 121),
              ),
              child: Text(
                "Add to Cart",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}