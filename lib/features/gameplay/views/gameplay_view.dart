import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/constants/constants.dart';
import 'package:wordle/features/gameplay/views/widgets/arabic_keyboard.dart';
import 'package:wordle/features/gameplay/views/widgets/cust_button.dart';
import 'package:wordle/features/gameplay/views/widgets/guess_row.dart';

class GameplayView extends StatelessWidget {
  const GameplayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu,size: getResponsiveSize(context, size: 30),),
        title: Text("خمنها",style: GoogleFonts.notoKufiArabic(
          fontWeight: FontWeight.bold,
          fontSize: getResponsiveSize(context, size: 30)
        ),),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const GuessRow();
                },
                itemCount: 6,
              ),
            ),
            SizedBox(height: 50,),

            ArabicKeyboard(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustButton(
                      text: "دخل",
                      func: (){
                        print("دخل");
                      },
                    ),
                  ),
                  SizedBox(width: 50,),
                  Expanded(
                    child: CustButton(
                      text: "امسح",
                      func: (){
                        print("امسح");
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

