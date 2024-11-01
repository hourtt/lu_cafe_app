// ignore_for_file: avoid_print

import 'package:cafe/pages/account/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _formKey = GlobalKey<FormState>();

  final controller = TextEditingController();
  final confirmController = TextEditingController();
  final newController = TextEditingController();

  bool _isSecurePassword = true;
  bool _isSecurePassword2 = true;
  bool _isSecurePassword3 = true;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double appBarIconSize = screenSize.width * 0.075;
    final double appBarTitleSize = screenSize.width * 0.06;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: const [
            Color.fromARGB(255, 74, 140, 215),
            Color.fromARGB(255, 217, 222, 222)
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              iconSize: appBarIconSize,
            ),
            title: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 45.0),
                child: Text(
                  AppLocalizations.of(context)!.changePassword,
                  style: GoogleFonts.assistant(
                    color: Colors.white,
                    fontSize: appBarTitleSize,
                    fontWeight: FontWeight.w700,
                  ),
                  // textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controller,
                      obscureText: _isSecurePassword,
                      validator: (String? value) {
                        return value!.length < 8
                            ? AppLocalizations.of(context)!
                                .mustBeAtLeastEightCharacters
                            : null;
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 73, 45, 83),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 73, 83, 142)),
                        ),
                        fillColor: Color.fromARGB(207, 247, 255, 247),
                        labelText:
                            AppLocalizations.of(context)!.currentPassword,
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 75, 71, 71),
                        ),
                        hintText: AppLocalizations.of(context)!
                            .mustBeAtLeastEightCharacters,
                        suffixIcon: IconButton(
                          icon: Icon(_isSecurePassword
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isSecurePassword =
                                  !_isSecurePassword; // toggle state
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: newController,
                      obscureText: _isSecurePassword2,
                      validator: (String? value) {
                        if (newController.text != confirmController.text) {
                          return AppLocalizations.of(context)!
                              .yourPasswordIsNotConfirm;
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 73, 45, 83),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 73, 83, 142)),
                        ),
                        fillColor: const Color.fromARGB(207, 238, 249, 244),
                        labelText: AppLocalizations.of(context)!.newPassword,
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 75, 71, 71),
                        ),
                        hintText: AppLocalizations.of(context)!
                            .mustBeAtLeastEightCharacters,
                        suffixIcon: IconButton(
                          icon: Icon(_isSecurePassword2
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isSecurePassword2 =
                                  !_isSecurePassword2; // toggle state
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: confirmController,
                      obscureText: _isSecurePassword3,
                      validator: (String? value) {
                        if (newController.text != confirmController.text) {
                          return AppLocalizations.of(context)!
                              .verifyPasswordIsIncorrect;
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 73, 45, 83),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13.0),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 73, 83, 142)),
                        ),
                        fillColor: const Color.fromARGB(207, 238, 249, 244),
                        labelText:
                            AppLocalizations.of(context)!.confirmPassword,
                        labelStyle: TextStyle(
                          color: Color.fromARGB(255, 69, 67, 67),
                        ),
                        hintText: AppLocalizations.of(context)!.verifyPassword,
                        suffixIcon: IconButton(
                          icon: Icon(_isSecurePassword3
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            setState(() {
                              _isSecurePassword3 =
                                  !_isSecurePassword3; // toggle state
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(
                          
                          top: 8,right:120), //* change padding (top) from 10 to 8
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 140),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProfilePage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 23),
                                textStyle: GoogleFonts.assistant(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.submit,
                                style: GoogleFonts.assistant(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 51, 102, 190),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
