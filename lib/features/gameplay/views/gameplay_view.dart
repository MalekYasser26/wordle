import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/constants/constants.dart';
import 'package:wordle/features/gameplay/game_logic_cubit.dart';
import 'package:wordle/features/gameplay/views/widgets/arabic_keyboard.dart';
import 'package:wordle/features/gameplay/views/widgets/cust_button.dart';
import 'package:wordle/features/gameplay/views/widgets/guess_row.dart';

class GameplayView extends StatefulWidget {
  const GameplayView({super.key});

  @override
  State<GameplayView> createState() => _GameplayViewState();
}

class _GameplayViewState extends State<GameplayView> {
  final String _correctAnswer = "صباحو"; // Example correct answer
  int _currentLetterIndex = 0;

  void _handleKeyPress(String key) {
    final gCubit = context.read<GameLogicCubit>();
    setState(() {
      if (key == "امسح") {
        if (_currentLetterIndex > 0) {
          _currentLetterIndex--;
          gCubit.updateGuess(6 - gCubit.guessesRemaining, _currentLetterIndex, '');
        }
      } else if (key == "دخل") {
        if (_currentLetterIndex == 5) {
          _validateGuess();
          gCubit.submitGuess();
          gCubit.resetCurrentGuess(6 - gCubit.guessesRemaining); // Reset current guess after submission
          _currentLetterIndex = 0;
        }
      } else {
        if (_currentLetterIndex < 5) {
          gCubit.updateGuess(6 - gCubit.guessesRemaining, _currentLetterIndex, key);
          _currentLetterIndex++;
        }
      }
    });
  }

  void _validateGuess() {
    final gCubit = context.read<GameLogicCubit>();
    String currentGuess = gCubit.guesses[6 - gCubit.guessesRemaining].join();
    if (currentGuess == _correctAnswer) {
      print("Correct guess: $currentGuess");
    } else {
      print("Incorrect guess: $currentGuess");
    }
  }

  @override
  Widget build(BuildContext context) {
    final gCubit = context.read<GameLogicCubit>();

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, size: getResponsiveSize(context, size: 30)),
        title: Text(
          "خمنها",
          style: GoogleFonts.notoKufiArabic(
            fontWeight: FontWeight.bold,
            fontSize: getResponsiveSize(context, size: 30),
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<GameLogicCubit, GameLogicState>(
        builder: (context, state) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GuessRow(
                      containerColor: AssetImages.guessGreen,
                      guess: gCubit.guessesEvaluated[index],
                    );
                  },
                  itemCount: gCubit.guessesEvaluated.length,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GuessRow(
                      containerColor: AssetImages.guessGrey,
                      guess: gCubit.guesses[6 - gCubit.guessesRemaining + index],
                    );
                  },
                  itemCount: gCubit.guessesRemaining,
                ),
                Spacer(),
                ArabicKeyboard(onKeyPress: _handleKeyPress),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: CustButton(
                          text: "دخل",
                          func: () {
                            if (gCubit.guessesRemaining>0){
                            _handleKeyPress("دخل");
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 50),
                      Expanded(
                        child: CustButton(
                          text: "امسح",
                          func: () {
                            _handleKeyPress("امسح");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
