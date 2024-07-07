import 'package:cafe/pages/account/languages.dart';
import 'package:cafe/pages/account/profile.dart';
import 'package:cafe/pages/introPage/introPage.dart';
import 'package:cafe/pages/introPage/signInPage.dart';
import 'package:cafe/pages/introPage/signUpPage.dart';
import 'package:cafe/pages/menu.dart';
import 'package:cafe/pages/notificationPage.dart';
import 'package:cafe/pages/order/order.dart';
import 'package:cafe/pages/order/order_provider.dart';
import 'package:cafe/pages/order/trackOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'pages/changePw.dart';
import 'pages/homePage.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>OrderProvider()),
    ],
      child:MyApp(),
    ),
  );

}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', //* Set the initial route to the IntroPage
      routes: {
        "/": (context) => IntroPage(), // *Show IntroPage first
        '/home': (context) => HomePage(),
        '/menu': (context) => MenuPage(),
        '/cart': (context) => OrderPage(),
        '/notification': (context) => Notificationpage(),
        //"/order": (context) => PaymentPage(orderItems: [],),
        "/order": (context) => OrderPage(),
        //"/payment": (context) => PaymentPage(orderItems: [],),
        "/trackOrder": (context) => TrackOrder(),
        "/account": (context) => ProfilePage(),
        "/signIn": (context) => SignInPage(),
        "/signUp": (context) => SignUpPage(),
        "/changePw": (context) => ChangePassword(),
        "/languages": (context) => Languages(),
      },
    );
  }
}
