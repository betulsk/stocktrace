import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stok/myContainer.dart';

import 'my_contact_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool selected = false;
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => ContactPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyContainer(
              onPress: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: AnimatedAlign(
                alignment: selected ? Alignment.topRight : Alignment.bottomLeft,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: Image.asset(
                  'images/kisiler.png',
                  height: 50,
                  width: 50,
                ),
              ),
            ),
            Divider(
              height: 10,
              thickness: 3,
              indent: 50,
              endIndent: 50,
              color: Colors.grey,
            ),
            Text(
              "Kisilere yönlendiriliyorsunuz...",
              softWrap: false,
              style: GoogleFonts.lato(
                  color: Colors.redAccent,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
