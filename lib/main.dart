import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stok/bloc/veri_ekle_bloc.dart';

import 'my_Drawer.dart';

void main() {
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
      home: MyDrawer(),
    );
  }
}
