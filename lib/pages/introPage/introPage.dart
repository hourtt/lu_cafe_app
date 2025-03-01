import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import '../../components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 74, 140, 215),
              Color.fromARGB(255, 217, 222, 222)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Builder(
          builder: (context) {
            final localizations = AppLocalizations.of(context)!;

            return Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(height: 20),

                  // WELCOME TO LU COFFEE TEXT
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          localizations.welcometoLUCoffee,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.assistant(
                            fontSize: 35,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(222, 20, 20, 20),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  // COFFEE IMAGE
                  Opacity(
                    opacity: 0.80,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 90, right: 90),
                      child: Image.asset(
                        "images/introPic/Coffee_Cup.png",
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    localizations.coffeeMakesEverythingBetter,
                    style: GoogleFonts.assistant(
                      fontSize: 22,
                      color: const Color.fromARGB(255, 2, 1, 1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 18),

                  // GET STARTED BUTTON
                  MyButton(
                    text: localizations.getStarted,
                    onTap: () {
                      // Tap to the Sign in and Sign up pages
                      Navigator.pushNamed(context, "/signIn");
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
