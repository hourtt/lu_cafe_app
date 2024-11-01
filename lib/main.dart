import 'package:cafe/l10n/l10n.dart';
import 'package:cafe/pages/account/languages.dart';
import 'package:cafe/pages/account/localeProvider.dart';
import 'package:cafe/pages/account/profile.dart';
import 'package:cafe/pages/changePw.dart';
import 'package:cafe/pages/homePage.dart';
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
import 'package:flutter_gen/gen_l10n/app_localization.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => OrderProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleProvider>(
      builder: (context, localeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: L10n.all,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: localeProvider.locale ?? _locale,
          initialRoute: '/', // Set the initial route to the IntroPage
          routes: {
            "/": (context) => IntroPage(), // Show IntroPage first
            '/home': (context) => HomePage(),
            '/menu': (context) => MenuPage(),
            '/cart': (context) => OrderPage(),
            '/notifications': (context) => NotificationsPage(), //"/order": (context) => PaymentPage(orderItems: [],),
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
      },
    );
  }
}
