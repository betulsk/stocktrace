import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stok/main.dart';

import 'about_us.dart';
import 'main_menu.dart';
import 'urunlerim.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  void initialize() {
    User user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      Navigator.of(context).popUntil(ModalRoute.withName('/'));
    }
  }

  int currentIndex;
  String butonClick;

  @override
  Widget build(BuildContext context) {
    initialize();
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text(
          'DEPOM',
          style: GoogleFonts.lato(color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Colors.red[600],
                    Colors.red[100],
                  ],
                ),
              ),
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage("images/unknown.jpg"),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Kullanıcı',
                        style:
                            GoogleFonts.lato(fontSize: 18, color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Depo Menu',
                        style: GoogleFonts.lato(
                            fontSize: 15, color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: Colors.redAccent,
              ),
              title: Text(
                'Kullanıcı',
                style: GoogleFonts.lato(fontSize: 18.0),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.dns,
                color: Colors.redAccent,
              ),
              title: Text(
                'Ürünlerim',
                style: GoogleFonts.lato(fontSize: 18.0),
              ),

              // icon: Icons.dns,
              // names: 'Ürünlerim',
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Urunler()));
                //Navigator.of(context).pushNamed('Urunler');
              },
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.local_grocery_store,
                color: Colors.redAccent,
              ),
              title: Text(
                'Satıs Bilgileri',
                style: GoogleFonts.lato(fontSize: 18.0),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.settings,
                color: Colors.redAccent,
              ),
              title: Text(
                'Ayarlar',
                style: GoogleFonts.lato(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
      body: MainMenu(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Hakkımızda',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.input),
            label: 'Çıkış',
            backgroundColor: Colors.pink,
          ),
        ],
        onTap: (index) async {
          switch (index) {
            case 0:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyDrawer()));
              break;
            case 1:
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Hakkinda()));
              break;
            case 2:
              await FirebaseAuth.instance.signOut();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MyApp()));
              break;
          }
        },
      ),
    );
  }
}
