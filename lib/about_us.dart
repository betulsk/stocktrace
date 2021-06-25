import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main_menu.dart';

class Hakkinda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          'HAKKINDA',
          style: GoogleFonts.lato(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onPanUpdate: (details) {
                  if (details.delta.dx < 0) {
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => MainMenu()));
                  }
                },
                child: Container(
                  child: Text(
                    "Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301409 kodlu MOBİL PROGRAMLAMA"
                    " dersi kapsamında 173301027 numaralı Betül ŞIK tarafından 25 Haziran 2021 günü yapılmıştır.",
                    style: GoogleFonts.quicksand(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
