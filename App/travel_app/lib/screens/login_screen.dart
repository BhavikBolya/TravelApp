import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/utils/routes.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = "";
  String password = "";

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
                right: 0,
                left: 0,
                bottom: 120,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 1.75,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(196, 196, 196, 0.45),
                        borderRadius: BorderRadius.circular(15),
                        /* boxShadow: [
                      BoxShadow(color: Colors.black),
                    ], */
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 0.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Form(
                              child: Column(
                            children: [
                              TextFormField(
                                decoration: InputDecoration(
                                    focusColor: Colors.white,
                                    alignLabelWithHint: true,
                                    labelText: "email",
                                    hintText: "Enter Email",),
                                onChanged: (value) {
                                  email = value;
                                  setState(() {});
                                  //print(email);
                                },
                              ),
                              TextFormField(
                                decoration: InputDecoration(
                                    alignLabelWithHint: true,
                                    labelText: "password",
                                    hintText: "Enter Password"),
                                onChanged: (value) {
                                  password = value;
                                  setState(() {});
                                  //print(password);
                                },
                              ),
                              /* Padding(
                              padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Divider(
                                  thickness: 2,
                                  indent: 70,
                                  endIndent: 70,
                                  color: Colors.white,
                                ),
                              ),
                            ), */
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Text(
                                  "Sign - in",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Align(
                                  alignment: Alignment.topCenter,
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
                                                  Icon(Icons.g_mobiledata),
                                                  Text(
                                                      "Continue in with Google",
                                                      style: TextStyle(
                                                          fontFamily:
                                                              GoogleFonts
                                                                      .roboto()
                                                                  .fontFamily,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Color.fromRGBO(
                                                              0, 0, 0, 0.54))),
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
                              )
                            ],
                          )),
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
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.homeRoute);
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
                      "Welcome",
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
