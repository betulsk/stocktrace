import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stok/models/product.dart';
import 'package:stok/yeni_urun.dart';

import 'database/DbHelper.dart';

class Urunler extends StatefulWidget {
  @override
  _UrunlerState createState() => _UrunlerState();
}

class _UrunlerState extends State<Urunler> {
  DbHelper _dbHelper;
  File image;

  @override
  void initState() {
    _dbHelper = DbHelper();
    super.initState();
  }

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
      body: FutureBuilder(
        future: _dbHelper.getProducts(),
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          if (snapshot.data.isEmpty)
            return Center(child: Text("Listelenecek ürün bulunamadı."));
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Product product = snapshot.data[index];
                return GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => AddProduct(
                              product: product,
                            ));
                    Navigator.pushReplacement(context, route);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => AddProduct(
                    //       product: product,
                    //     ),
                    //   ),
                    // );
                  },
                  child: Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onDismissed: (direction) async {
                      // await _dbHelper.removeContact(contact.id);

                      setState(() {});

                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("${product.name} silindi"),
                        action: SnackBarAction(
                          label: "UNDO",
                          onPressed: () async {
                            // await _dbHelper.insertContact(contact);

                            setState(() {});
                          },
                        ),
                      ));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.file(
                            File(product.image ?? "images/imageselect.png")),
                        //     Text(
                        //   product.name[0].toUpperCase(),
                        //   style: TextStyle(
                        //       fontSize: 24, fontWeight: FontWeight.bold),
                        // ),
                      ),
                      title: Text(product.name),
                      subtitle: Text(product.price == null
                          ? "-"
                          : product.price.toString()),
                      trailing: IconButton(
                        icon: Icon(Icons.info),
                        //   onPressed: () async =>
                        //     //  _callContact(contact.phoneNumber),
                        // ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
