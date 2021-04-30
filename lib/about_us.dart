import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Text(
                'Bu uygulamada Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301409 kodlu MOBİL PROGRAMLAMA'
                ' dersi kapsamında 173301027 numaralı Betül ŞIK tarafından 30 Nisan 2021 günü yapılmıştır. ',
                style: GoogleFonts.quicksand(
                    fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
