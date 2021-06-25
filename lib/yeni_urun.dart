import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stok/models/product.dart';
import 'package:stok/urunlerim.dart';

import 'database/DbHelper.dart';

class AddProduct extends StatelessWidget {
  final Product product;

  const AddProduct({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.id == null ? "Yeni Ürün Ekle" : product.name,
          style: GoogleFonts.lato(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
          child: UrunForm(product: product, child: YeniUrun())),
    );
  }
}

class UrunForm extends InheritedWidget {
  final Product product;

  UrunForm({Key key, @required Widget child, @required this.product})
      : super(key: key, child: child);

  static UrunForm of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UrunForm>();
  }

  @override
  bool updateShouldNotify(UrunForm oldWidget) {
    return product.id != oldWidget.product.id;
  }
}

class YeniUrun extends StatefulWidget {
  @override
  _YeniUrunState createState() => _YeniUrunState();
}

class _YeniUrunState extends State<YeniUrun> {
  final _formKey = GlobalKey<FormState>();
  DbHelper _dbHelper;
  File myimage;

  @override
  void initState() {
    _dbHelper = DbHelper();
    super.initState();
  }

  void getFile() async {
    Product product = UrunForm.of(context).product;

    File imageFile = File(await ImagePicker()
        .getImage(source: ImageSource.gallery)
        .then((pickedFile) => pickedFile.path));

    myimage = imageFile;

    product.image = imageFile.path;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Product product = UrunForm.of(context).product;
    return Column(
      children: <Widget>[
        Stack(children: [
          myimage == null
              ? Image.asset('images/imageselect.png',
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  fit: BoxFit.cover)
              : Image.file(
                  myimage,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 250,
                ),
          Positioned(
              bottom: 8,
              right: 8,
              child: IconButton(
                onPressed: getFile,
                icon: Icon(Icons.camera_alt),
                color: Colors.black,
              ))
        ]),
        Padding(
          padding: EdgeInsets.all(8),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Ürün Adı"),
                    initialValue: product.name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Ürün adı giriniz.";
                      }
                    },
                    onSaved: (value) {
                      product.name = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: "Stok adedi"),
                    initialValue: (product.stockQuantity == 0 ||
                            product.stockQuantity == null)
                        ? ""
                        : product.stockQuantity.toString(),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Stok adedi giriniz.";
                      }
                    },
                    onSaved: (value) {
                      product.stockQuantity = int.parse(value);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: "Fiyat"),
                    initialValue: (product.price == 0 || product.price == null)
                        ? ""
                        : product.price.toString(),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Fiyat giriniz.";
                      }
                    },
                    onSaved: (value) {
                      product.price = int.parse(value);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      color: Colors.redAccent,
                      textColor: Colors.white,
                      child: Text("Kaydet"),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                          String message = "";
                          if (product.id == null) {
                            await _dbHelper.insertProduct(product);
                            message = "kayıt edildi.";
                          } else {
                            await _dbHelper.updateProduct(product);
                            message = "güncellendi.";
                          }
                          var snackBar = Scaffold.of(context).showSnackBar(
                            SnackBar(
                                content: Text("${product.name} ${message}")),
                          );

                          snackBar.closed.then((onValue) {
                            Navigator.pop(context);
                          });

                          Timer(Duration(seconds: 1), () {
                            Route route = MaterialPageRoute(
                                builder: (context) => Urunler());
                            Navigator.pushReplacement(context, route);
                          });
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
