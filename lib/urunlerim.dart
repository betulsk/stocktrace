import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Urunler extends StatefulWidget {
  @override
  _UrunlerState createState() => _UrunlerState();
}

class _UrunlerState extends State<Urunler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ÜRÜNLER',
          style: GoogleFonts.lato(fontSize: 18),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  color: Colors.redAccent,

                  /*decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),*/
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
