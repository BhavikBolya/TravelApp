import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/utils/routes.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/utils/validator.dart';

import '../utils/fire_auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email = "";
  String password = "";
  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();

 final _nameTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/login.jpg"),
                fit: BoxFit.cover,
              )),
              child:
                  Container(decoration: BoxDecoration(color: Colors.black38)),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 550,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/Safar-logo-white.png"),
                  scale: 2,
                )),
              ),
            ),
            Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 120,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.zero,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 12.5, sigmaY: 12.5),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Container(
                          height: MediaQuery.of(context).size.height / 1.75,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(196, 196, 196, 0.45),
                            borderRadius: BorderRadius.circular(15),
                            /* boxShadow: [
                              BoxShadow(color: Colors.black.withOpacity(0.5)),
                            ], */
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                25.0, 20.0, 25.0, 0.0),
                            child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 40, 0, 0),
                                      child: Container(
                                        height: 40,
                                        child: TextFormField(
                                          autocorrect: false,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          style: TextStyle(color: Colors.white),
                                          decoration: InputDecoration(
                                            isDense: true,
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusColor: Colors.white,
                                            labelText: "name",
                                            labelStyle: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                            errorStyle:
                                                TextStyle(color: Colors.red),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white,
                                                        width: 2),
                                                    borderRadius: BorderRadius
                                                        .circular(10)),
                                          ),
                                          validator: (value) {
                                            if (name.isEmpty) {
                                              return "Name cannot be empty";
                                            } else {
                                              return null;
                                            }
                                          },
                                          onChanged: (value) {
                                            name = value;
                                            setState(() {});
                                            //print(email);
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 30, 0, 0),
                                      child: Container(
                                        height: 40,
                                        child: TextFormField(
                                          controller: _emailTextController,
                                          autocorrect: false,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          style: TextStyle(color: Colors.white),
                                          decoration: InputDecoration(
                                            isDense: true,
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusColor: Colors.white,
                                            labelText: "email",
                                            labelStyle: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                            errorStyle:
                                                TextStyle(color: Colors.red),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white,
                                                        width: 2),
                                                    borderRadius: BorderRadius
                                                        .circular(10)),
                                          ),
                                          validator: (value) {
                                            Validator.validateEmail(email: value.toString());
                                          },
                                          onChanged: (value) {
                                            email = value;
                                            setState(() {});
                                            //print(email);
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 30, 0, 0),
                                      child: Container(
                                        height: 40,
                                        child: TextFormField(
                                          controller: _passwordTextController,
                                          autocorrect: false,
                                          style: TextStyle(color: Colors.white),
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                          decoration: InputDecoration(
                                            isDense: true,
                                            labelText: "password",
                                            labelStyle: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600),
                                            focusColor: Colors.white,
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            errorStyle:
                                                TextStyle(color: Colors.red),
                                            errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 2),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white,
                                                        width: 2),
                                                    borderRadius: BorderRadius
                                                        .circular(10)),
                                          ),
                                          obscureText: true,
                                          validator: (value) {
                                            Validator.validatePassword(password: value.toString());
                                          },
                                          onChanged: (value) {
                                            password = value;
                                            setState(() {});
                                            //print(password);
                                          },
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 15),
                                      child: Divider(
                                        thickness: 2,
                                        indent: 70,
                                        endIndent: 70,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 15, 0, 0),
                                      child: Text(
                                        "Register with",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 20, 0, 0),
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
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, AppRoutes.loginRoute);
                                        },
                                        child: Text(
                                          "Already have an account? Sign in",
                                          style: TextStyle(
                                              color: Colors.white,
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
            Positioned(
              top: 0,
              left: 0,
              bottom: 95,
              right: 40,
              child: Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          changeButton = true;
                        });
                        User? user = await FireAuth.registerUsingEmailPassword(
                          name: _nameTextController.text,
                          email: _emailTextController.text,
                          password: _passwordTextController.text,
                        );
                      if (user != null) {
                        Navigator.pushNamed(context, AppRoutes.homeRoute);
                      }
                        
                      }
                    },
                    child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  offset: Offset(0, 2),
                                  blurRadius: 20.0)
                            ]),
                        child: Icon(Icons.navigate_next))),
              ),
            ),
            Positioned(
                top: 0,
                right: 0,
                left: 40,
                bottom: 350,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: 45,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              offset: Offset(0, 2),
                              blurRadius: 20.0)
                        ]),
                    child: Center(
                        child: Text(
                      "Register",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )),
                  ),
                )),
          ],
        ));
  }
}