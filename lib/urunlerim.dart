import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stok/models/product.dart';

import 'database/DbHelper.dart';

class Urunler extends StatefulWidget {
  @override
  _UrunlerState createState() => _UrunlerState();
}

class _UrunlerState extends State<Urunler> {
  DbHelper _dbHelper;

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
            return Text("Listelenecek ürün bulunamadı.");
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Product contact = snapshot.data[index];
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         // AddContactPage(
                    //         //   contact: contact,
                    //         // ),
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
                        content: Text("${contact.name} has been deleted"),
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
                        backgroundImage: AssetImage(
                          contact.image == null
                              ? "assets/img/person.jpg"
                              : contact.image,
                        ),
                        child: Text(
                          contact.name[0].toUpperCase(),
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(contact.name),
                      subtitle: Text(contact.name),
                      trailing: IconButton(
                        icon: Icon(Icons.phone),
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

      // SafeArea(
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Expanded(
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Expanded(
      //               child: GestureDetector(
      //                 onTap: () {},
      //                 child: Container(
      //                   padding: EdgeInsets.all(10.0),
      //                   margin: EdgeInsets.all(8.0),
      //                   color: Colors.white,
      //                   child: Column(
      //                     children: [
      //                       Expanded(child: Image.asset('images/masa.jpg')),
      //                       Container(
      //                         margin: EdgeInsets.all(10.0),
      //                         child: Text('Masa'),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             Expanded(
      //               child: GestureDetector(
      //                 onTap: () {},
      //                 child: Container(
      //                   padding: EdgeInsets.all(8.0),
      //                   margin: EdgeInsets.all(8.0),
      //                   color: Colors.white,
      //                   child: Column(
      //                     children: [
      //                       Expanded(child: Image.asset('images/sandalye.jpg')),
      //                       Container(
      //                         margin: EdgeInsets.all(10.0),
      //                         child: Text('Sandalye'),
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Expanded(
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Expanded(
      //               child: Container(
      //                 padding: EdgeInsets.all(8.0),
      //                 margin: EdgeInsets.all(8.0),
      //                 color: Colors.white,
      //                 child: Column(
      //                   children: [
      //                     Expanded(child: Image.asset('images/koltuk.jpg')),
      //                     Container(
      //                       margin: EdgeInsets.all(10.0),
      //                       child: Text('Koltuk'),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             Expanded(
      //               child: Container(
      //                 padding: EdgeInsets.all(8.0),
      //                 margin: EdgeInsets.all(8.0),
      //                 color: Colors.white,
      //                 child: Column(
      //                   children: [
      //                     Expanded(child: Image.asset('images/saksi.jpg')),
      //                     Container(
      //                       margin: EdgeInsets.all(10.0),
      //                       child: Text('Saksı'),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Expanded(
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Expanded(
      //               child: Container(
      //                 padding: EdgeInsets.all(8.0),
      //                 margin: EdgeInsets.all(8.0),
      //                 color: Colors.white,
      //                 child: Column(
      //                   children: [
      //                     Expanded(child: Image.asset('images/lamba.jpg')),
      //                     Container(
      //                       margin: EdgeInsets.all(10.0),
      //                       child: Text('Lambader'),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             Expanded(
      //               child: Container(
      //                 padding: EdgeInsets.all(8.0),
      //                 margin: EdgeInsets.all(8.0),
      //                 color: Colors.white,
      //                 child: Column(
      //                   children: [
      //                     Expanded(child: Image.asset('images/saat.jpg')),
      //                     Container(
      //                       margin: EdgeInsets.all(10.0),
      //                       child: Text('Saat'),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
