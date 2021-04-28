import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Depo_Button.dart';
import 'custom_list_tile.dart';
import 'myContainer.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String butonClick;
  @override
  Widget build(BuildContext context) {
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
            CustomListTile(icon: Icons.account_circle, names: 'Kullanıcı'),
            CustomListTile(
              icon: Icons.dns,
              names: 'Ürünlerim',
            ),
            CustomListTile(
                icon: Icons.local_grocery_store, names: 'Satıs Bilgileri'),
            CustomListTile(icon: Icons.settings, names: 'Ayarlar'),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: MyContainer(
                        onPress: () {
                          butonClick = 'Depolar';
                          setState(() {
                            print('depolara basıldı');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Depolar()));
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                'images/depo1.png',
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Depolar',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: MyContainer(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                'images/yeni_urun.png',
                              ),
                            ),
                            Text(
                              'Yeni Ürün',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: MyContainer(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                'images/satis_gecmisi.gif',
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Satış Geçmişi',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: MyContainer(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                'images/stok_gecmisi.png',
                              ),
                            ),
                            Text(
                              'Stok Geçmişi',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: MyContainer(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                'images/kisiler.png',
                                //height: 160,
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Text(
                              'Kişiler',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: MyContainer(
                        onPress: () {
                          setState(() {});
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Image.asset(
                                'images/gelir_gider.png',
                              ),
                            ),
                            Text(
                              'Gelirler & Giderler',
                              style: TextStyle(
                                  fontSize: 17.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: MyContainer(
                  myColor: Colors.white,
                  onPress: () {
                    setState(() {
                      print('butona basıldı');
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Image.asset('images/settings.jpg'),
                      )),
                      SizedBox(height: 5.0),
                      Text(
                        'Ayarlar',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: '',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Hakkımızda',
            backgroundColor: Colors.pink,
          ),
        ],
      ),
    );
  }
}
