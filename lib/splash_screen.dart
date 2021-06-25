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
// import 'dart:math' as math;
//
// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key key}) : super(key: key);
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// /// This is the private State class that goes with MyStatefulWidget.
// /// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   final AnimationController _controller = AnimationController(
//     duration: const Duration(seconds: 10),
//     vsync: this._SplashScreenState, //this,
//   )..repeat();
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _controller,
//       child: Container(
//         width: 200.0,
//         height: 200.0,
//         color: Colors.green,
//         child: const Center(
//           child: Text('Whee!'),
//         ),
//       ),
//       builder: (BuildContext context, Widget child) {
//         return Transform.rotate(
//           angle: _controller.value * 2.0 * math.pi,
//           child: child,
//         );
//       },
//     );
//   }
// }
//
