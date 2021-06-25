import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'add_contact_page.dart';
import 'database/DbHelper.dart';
import 'kisiler.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
          'KISILER',
          style: GoogleFonts.lato(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddContactPage(
                contact: Contact(),
              ),
            ),
          );
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: _dbHelper.getContacts(),
        builder: (BuildContext context, AsyncSnapshot<List<Contact>> snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          if (snapshot.data.isEmpty)
            return Center(
                child: Text(
              "Görüntülecek veri bulunamadı.",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ));
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Contact contact = snapshot.data[index];
                return GestureDetector(
                  onTap: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => AddContactPage(
                              contact: contact,
                            ));
                    Navigator.pushReplacement(context, route);
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
                      await _dbHelper.removeContact(contact.id);

                      setState(() {});

                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("${contact.fullName} has been deleted"),
                        action: SnackBarAction(
                          label: "UNDO",
                          onPressed: () async {
                            await _dbHelper.insertContact(contact);

                            setState(() {});
                          },
                        ),
                      ));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                          contact.avatar == null
                              ? "assets/img/person.jpg"
                              : contact.avatar,
                        ),
                        child: Text(
                          contact.fullName[0].toUpperCase(),
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      title: Text(contact.fullName),
                      subtitle: Text(contact.phoneNumber),
                      trailing: IconButton(
                        icon: Icon(Icons.phone),
                        // onPressed: () async =>
                        //     _callContact(contact.phoneNumber),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }

  // _callContact(String phoneNumber) async {
  //   String tel = "tel:$phoneNumber";
  //   if (await canLaunch(tel)) {
  //     await launch(tel);
  //   }
  // }
}
