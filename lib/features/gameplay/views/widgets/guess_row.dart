import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wordle/constants/constants.dart';

class GuessRow extends StatelessWidget {
  const GuessRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Center(
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Center(
              child: SvgPicture.asset(
                AssetImages.guessGrey,
                height: getResponsiveSize(context, size: 50),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 10);
          },
          itemCount: 5,
        ),
      ),
    );
  }
}
