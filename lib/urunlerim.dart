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
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        margin: EdgeInsets.all(8.0),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Expanded(child: Image.asset('images/masa.jpg')),
                            Container(
                              margin: EdgeInsets.all(10.0),
                              child: Text('Masa'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(8.0),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Expanded(child: Image.asset('images/sandalye.jpg')),
                            Container(
                              margin: EdgeInsets.all(10.0),
                              child: Text('Sandalye'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(8.0),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(child: Image.asset('images/koltuk.jpg')),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text('Koltuk'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(8.0),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(child: Image.asset('images/saksi.jpg')),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text('Saksı'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(8.0),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(child: Image.asset('images/lamba.jpg')),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text('Lambader'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.all(8.0),
                      color: Colors.white,
                      child: Column(
                        children: [
                          Expanded(child: Image.asset('images/saat.jpg')),
                          Container(
                            margin: EdgeInsets.all(10.0),
                            child: Text('Saat'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
