import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stok/models/product.dart';

import 'database/DbHelper.dart';

class AddProduct extends StatelessWidget {
  final Product product;

  const AddProduct({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.id == null ? "Yeni Ürün Ekle" : product.name),
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

  @override
  void initState() {
    _dbHelper = DbHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Product product = UrunForm.of(context).product;
    return Column(
      children: <Widget>[
        Stack(children: [
          Image.asset(
            product.image == null ? "assets/img/person.jpg" : product.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 250,
          ),
          Positioned(
              bottom: 8,
              right: 8,
              child: IconButton(
                onPressed: getFile,
                icon: Icon(Icons.camera_alt),
                color: Colors.white,
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
                        return "Name required";
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
                    initialValue: product.stockQuantity ?? "",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Phone Number required";
                      }
                    },
                    onSaved: (value) {
                      product.stockQuantity = int.parse(value);
                    },
                  ),
                ),
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text("Submit"),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();

                      // if (product.id == null) {
                      //   //await _dbHelper.insertContact(product);
                      // } else {
                      //   // await _dbHelper.updateContact(product);
                      // }

                      var snackBar = Scaffold.of(context).showSnackBar(
                        SnackBar(
                            content: Text("${product.name} has been saved")),
                      );

                      snackBar.closed.then((onValue) {
                        Navigator.pop(context);
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void getFile() async {
    Product product = UrunForm.of(context).product;

    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);

    setState(() {
      product.image = image.path;
    });
  }
}
