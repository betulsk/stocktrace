import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stok/bloc/veri_ekle_bloc.dart';
import 'package:stok/flutter_auth.dart';

import 'my_Drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(BlocProvider(
    create: (context) {
      return VeriEkleBloc();
    },
    child: MyApp(),
  ));

  //  MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.lightBlueAccent,
        backgroundColor: Colors.pink[200],
      ),
      home: MyHomePage(title: 'GİRİŞ YAP'), //MyDrawer(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        backgroundColor: Colors.redAccent,
        title: new Text(
          widget.title,
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
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("images/unknown.jpg"),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Email:', icon: Icon(Icons.account_circle)),
                  validator: (input) =>
                      !input.contains('@') ? 'Not a valid Email' : null,
                  onSaved: (input) => _email = input,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Password:', icon: Icon(Icons.vpn_key)),
                  validator: (input) => input.length < 8
                      ? 'You need at least 8 characters'
                      : null,
                  onSaved: (input) => _password = input,
                  obscureText: true,
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
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 8.0, left: 8.0),
                      child: RaisedButton(
                        color: Colors.redAccent,
                        onPressed: _controll,
                        child: Text(
                          'Giriş',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, right: 8.0, left: 8.0),
                      child: RaisedButton(
                        color: Colors.redAccent,
                        onPressed: _git,
                        child: Text(
                          'Giriş',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
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

  Future<void> _controll() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      // _email = "barry.allen@example.com";
      // _password = "SuperSecretPassword!";

      await signIn(_email, _password);

      User user = FirebaseAuth.instance.currentUser;
      if (user == null) return;

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyDrawer()));
    }
  }

  void _git() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MyDrawer()));
  }
}
