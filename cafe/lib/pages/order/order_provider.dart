import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _orderItems = [];

  List<Map<String, dynamic>> get orderItems => _orderItems;

  void addItem(Map<String, dynamic> item) {
    //* add an item to the list
    _orderItems.add(item);
    notifyListeners();
  } // *method

  void removeItem(int index) {
    _orderItems.removeAt(index);
    notifyListeners();
  } // *method

  void updateQuantity(int index, int quantity) {
    _orderItems[index]['quantity'] = quantity;
    notifyListeners();
  } //* method

  double calculateTotal() {
    double total = 0;
    for (var item in _orderItems) {
      double price = double.parse(item['price'].substring(1));
      total += price * item['quantity'];
    }
    return total;
  }
}
//* different between function and method:
//* function can be independence and doesn't necessarily belong to a class or an object. Function also can take parameter and return a value
//* method is a function that associate with other class or object. method are define with the class and are called on objects(the instance of the class).sometime method may have parameter