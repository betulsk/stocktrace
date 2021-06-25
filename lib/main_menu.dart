import 'package:flutter/material.dart';
import 'package:stok/yeni_urun.dart';

import 'Depolar.dart';
import 'models/product.dart';
import 'myContainer.dart';
import 'my_contact_page.dart';

class MainMenu extends StatefulWidget {
  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  String butonClick;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      onPress: () {
                        butonClick = 'Depolar';
                        setState(() {
                          print('depolara basıldı');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AddProduct(product: Product())));
                        });
                      },
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
                      onPress: () {
                        butonClick = 'Depolar';
                        setState(() {
                          print('depolara basıldı');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ContactPage()));
                        });
                      },
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
    );
  }
}
