import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:travel_app/utils/routes.dart';

class FistLogin extends StatefulWidget {
  const FistLogin({Key? key}) : super(key: key);

  @override
  State<FistLogin> createState() => _FistLoginState();
}

class _FistLoginState extends State<FistLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, AppRoutes.loginRoute);
      },
      child: Text("First open"),
    ));
  }
}
