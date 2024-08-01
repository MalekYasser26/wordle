import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/constants/constants.dart';
import 'package:wordle/features/gameplay/views/widgets/guess_row.dart';

class GameplayView extends StatelessWidget {
  const GameplayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu,size: getResponsiveSize(context, size: 30),),
        title: Text("السلام عليكم",style: GoogleFonts.notoKufiArabic(),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const GuessRow();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 10);
                },
                itemCount: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
