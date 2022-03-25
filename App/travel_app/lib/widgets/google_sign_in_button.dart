import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../main.dart';
import '../utils/authentication.dart';
import '../utils/routes.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
              onPressed: () async {
                // setState(() {
                //   _isSigningIn = true;
                // });

                // User? user = await Authentication.signInWithGoogle(
                //     context:
                //         context); // TODO: Add a method call to the Google Sign-In authentication
                // print("Y");
                // setState(() {
                //   _isSigningIn = false;
                // });

                // if (user != null) {
                //   Navigator.pushNamed(context, AppRoutes.homeRoute);
                // }
              },
              child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 0, 0),
                                      child: Container(
                                        height: 40,
                                        width: 256,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: InkWell(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          30, 0, 30, 0),
                                                  child: Row(
                                                    children: [
                                                      Image.asset(
                                                        "assets/images/google-logo.png",
                                                        scale: 2,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10, 0, 0, 0),
                                                        child: Text(
                                                            "Continue in with Google",
                                                            style: TextStyle(
                                                                fontFamily: GoogleFonts
                                                                        .roboto()
                                                                    .fontFamily,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.54))),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            onTap: () {
                                              //GoogleSignIn().signIn();
                                            }),
                                      ),
                                    ),
            ),
    );
  }
}
