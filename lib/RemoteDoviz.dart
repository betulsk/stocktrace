import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:stok/models/doviz.dart';

class RemoteDoviz extends StatefulWidget {
  @override
  _RemoteDovizState createState() => _RemoteDovizState();
}

class _RemoteDovizState extends State<RemoteDoviz> {
  Doviz doviz;
  Future<Doviz> veri;
  List<DovizListem> dovizListesi = List<DovizListem>();
  String url =
      "https://v6.exchangerate-api.com/v6/1ff6f7eb0870e49ee3c8461b/pair/USD/TRY";

  Future<Doviz> dovizleriGetir() async {
    var response = await http.get(Uri.parse(url));
    var decodeJson = json.decode(response.body);
    doviz = Doviz.fromJson(decodeJson);
    return doviz;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    veri = dovizleriGetir();
  }

  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "CANLI DÖVIZ KURU",
          style: GoogleFonts.lato(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: FutureBuilder(
          future: veri,
          // ignore: missing_return
          builder: (context, AsyncSnapshot<Doviz> gelenDoviz) {
            if (gelenDoviz.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (gelenDoviz.connectionState == ConnectionState.done) {
              return GridView.builder(
                  itemCount: 1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 6,
                      child: GestureDetector(
                        onDoubleTap: () {
                          print("iki kere tıklandı");
                          setState(() {
                            selected = !selected;
                          });
                        },
                        child: AnimatedContainer(
                          color: selected
                              ? Colors.orangeAccent
                              : Colors.lightGreenAccent,
                          duration: const Duration(seconds: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                "1 USD = " +
                                    gelenDoviz.data.conversionRate.toString() +
                                    " TRY",
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
