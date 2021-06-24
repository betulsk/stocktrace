import 'package:flutter/material.dart';
import 'package:stok/flutter_auth.dart';

import 'flutter_auth.dart';

class KayitEkrani extends StatefulWidget {
  @override
  _KayitEkraniState createState() => _KayitEkraniState();
}

class _KayitEkraniState extends State<KayitEkrani> {
  final formKey = GlobalKey<FormState>();
  String _email, _password, isim, soyisim;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: new Text(
          'KAYIT OL',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Card(
        child: Padding(
          padding: EdgeInsets.all(25.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'İsim-Soyisim:',
                      icon: Icon(Icons.account_circle)),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'E-mail adresinizi giriniz:',
                    icon: Icon(Icons.email),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'En az 8 karakterli parolanızı yazın:',
                    icon: Icon(Icons.vpn_key),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 8.0, left: 8.0),
                      child: RaisedButton(
                        color: Colors.redAccent,
                        onPressed: _submit,
                        child: Text(
                          'Kayıt Ol',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _submit() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      await register(_email, _password);
    }
  }
}
