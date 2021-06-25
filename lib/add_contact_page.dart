import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stok/my_contact_page.dart';

import 'database/DbHelper.dart';
import 'kisiler.dart';

class AddContactPage extends StatelessWidget {
  final Contact contact;

  const AddContactPage({Key key, @required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        title: Text(
          contact.id == null ? "Yeni Kisi Olustur" : contact.fullName,
          style: GoogleFonts.lato(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
          child: ContactForm(contact: contact, child: AddContactForm())),
    );
  }
}

class ContactForm extends InheritedWidget {
  final Contact contact;

  ContactForm({Key key, @required Widget child, @required this.contact})
      : super(key: key, child: child);

  static ContactForm of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ContactForm>();
  }

  @override
  bool updateShouldNotify(ContactForm oldWidget) {
    return contact.id != oldWidget.contact.id;
  }
}

class AddContactForm extends StatefulWidget {
  @override
  _AddContactFormState createState() => _AddContactFormState();
}

class _AddContactFormState extends State<AddContactForm> {
  final _formKey = GlobalKey<FormState>();
  DbHelper _dbHelperTwo;

  @override
  void initState() {
    _dbHelperTwo = DbHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Contact contact = ContactForm.of(context).contact;

    return Column(
      children: <Widget>[
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
                    decoration: InputDecoration(hintText: "Ad Soyad"),
                    initialValue: contact.fullName,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Ad Soyad giriniz.";
                      }
                    },
                    onSaved: (value) {
                      contact.fullName = value;
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(hintText: "Telefon Numarası"),
                    initialValue: contact.phoneNumber,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Numara giriniz.";
                      }
                    },
                    onSaved: (value) {
                      contact.phoneNumber = value;
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
                          if (contact.id == null) {
                            await _dbHelperTwo.insertContact(contact);
                          } else {
                            await _dbHelperTwo.updateContact(contact);
                          }

                          var snackBar = Scaffold.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    "${contact.fullName} işlem başarılı.")),
                          );

                          snackBar.closed.then((onValue) {
                            Navigator.pop(context);
                          });

                          Timer(Duration(seconds: 1), () {
                            Route route = MaterialPageRoute(
                                builder: (context) => ContactPage());
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

  void getFile() async {
    Contact contact = ContactForm.of(context).contact;

    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);

    setState(() {
      contact.avatar = image.path;
    });
  }
}
