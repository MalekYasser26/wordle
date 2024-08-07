import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/constants/constants.dart';

class GuessRow extends StatelessWidget {
  final List<String> guess;
  final String containerColor;
  const GuessRow({super.key, required this.guess, required this.containerColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Center(
        child: ListView.separated(
          reverse: true,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(
                    containerColor,
                    height: getResponsiveSize(context, size: 50),
                  ),
                  Text(
                    guess[index],
                    style: GoogleFonts.montserrat(
                      fontSize: getResponsiveSize(context, size: 20),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10);
          },
          itemCount: guess.length,
        ),
      ),
    );
  }
}
