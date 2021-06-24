import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stok/bloc/veri_ekle_bloc.dart';

import 'myContainer.dart';

class Depolar extends StatefulWidget {
  @override
  _DepolarState createState() => _DepolarState();
}

class _DepolarState extends State<Depolar> {
  var myTextController = TextEditingController();
  int gridChildIndex;
  List<Widget> gridChild = [];
  List myProviderList = [];
  String depo_adi = '';
  final myController = TextEditingController();

  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var myProvider = BlocProvider.of<VeriEkleBloc>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'DEPOLAR',
          style: GoogleFonts.lato(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<VeriEkleBloc, VeriEkleState>(
                  bloc: myProvider,
                  builder: (context, state) {
                    myProviderList
                        .add((state as VeriGeldiState).veri.toString());
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 500,
                          width: double.infinity,
                          child: ListView.builder(
                            itemCount: myProviderList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  padding: EdgeInsets.all(15),
                                  margin: EdgeInsets.all(4),
                                  color: Colors.red[100],
                                  child:
                                      Text(myProviderList[index].toString()));
                            },
                          ),
                        )
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red[100],
        shape: const CircularNotchedRectangle(),
        child: Container(height: 40.0),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: new Text('Depo Adını Giriniz'),
                content: new Row(
                  children: [
                    new Expanded(
                      child: new TextField(
                        controller: myTextController,
                        autofocus: true,
                        //controller: myController, //TextField bilgilerini aldık
                        obscureText: false,
                        decoration: new InputDecoration(
                          labelText: 'Depo Adı Giriniz',
                        ),

                        onTap: () {},
                        onSubmitted: (value) {
                          debugPrint("ama bu sürekli çalışmaz");

                          depo_adi = myTextController.text;
                        },
                      ),
                    ),
                  ],
                ),
                actions: [
                  new FlatButton(
                      onPressed: () {
                        myProvider.add(VeriGeldiEvent(depo_adi));

                        Navigator.of(context).pop();
                      },
                      child: new Text("Kapat"))
                ],
              );
            },
          );
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
