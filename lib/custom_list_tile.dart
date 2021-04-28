import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListTile extends StatelessWidget {
  final String names;
  final IconData icon;
  final Function onTap;
  CustomListTile({this.icon, this.names, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: Colors.grey,
        )),
      ),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 0, 9.0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.red[200],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Text(
                      names,
                      style: GoogleFonts.lato(fontSize: 18),
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_right,
                color: Colors.red[200],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
