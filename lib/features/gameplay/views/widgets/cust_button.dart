import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/constants/constants.dart';

class CustButton extends StatelessWidget {
  final VoidCallback func;
  final String text;

  const CustButton({
    Key? key,
    required this.func,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFC2C3C7), width: 4),
          borderRadius: BorderRadius.circular(5),
          gradient: LinearGradient(
            colors: [
              const Color(0xFFC2C3C7).withOpacity(0.1),
              const Color(0xFFC2C3C7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: GoogleFonts.montserrat(
              fontSize: getResponsiveSize(context, size: 20),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
