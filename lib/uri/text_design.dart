import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ModiFyText extends StatelessWidget {
  String text;
  double size;
 ModiFyText({super.key,required this.text,required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.breeSerif( fontSize: size),);
  }
}
