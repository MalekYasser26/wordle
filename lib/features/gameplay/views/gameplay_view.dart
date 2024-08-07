import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wordle/constants/constants.dart';
import 'package:wordle/features/gameplay/views/widgets/arabic_keyboard.dart';
import 'package:wordle/features/gameplay/views/widgets/cust_button.dart';
import 'package:wordle/features/gameplay/views/widgets/guess_row.dart';

class GameplayView extends StatefulWidget {
  const GameplayView({super.key});

  @override
  State<GameplayView> createState() => _GameplayViewState();
}

class _GameplayViewState extends State<GameplayView> {
  final String _correctAnswer = "صباح"; // Example correct answer
  List<List<String>> _guesses = List.generate(6, (_) => List.filled(5, ''));
  int _currentGuessIndex = 0;
  int _currentLetterIndex = 0;

  void _handleKeyPress(String key) {
    setState(() {
      if (key == "امسح") {
        if (_currentLetterIndex > 0) {
          _currentLetterIndex--;
          _guesses[_currentGuessIndex][_currentLetterIndex] = '';
        }
      } else if (key == "دخل") {
        if (_currentLetterIndex == 5) {
          // Validate the guess
          _validateGuess();
        }
      } else {
        if (_currentLetterIndex < 5) {
          _guesses[_currentGuessIndex][_currentLetterIndex] = key;
          _currentLetterIndex++;
        }
      }
    });
  }

  void _validateGuess() {
    String currentGuess = _guesses[_currentGuessIndex].join();
    if (currentGuess == _correctAnswer) {
      // The guess is correct
      // Handle the win condition
    } else {
      if (_currentGuessIndex < 5) {
        _currentGuessIndex++;
        _currentLetterIndex = 0;
      } else {
        // Handle the lose condition
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GuessRow(guess: _guesses[index]);
                },
                itemCount: 6,
              ),
            ),
            SizedBox(height: 50),
            ArabicKeyboard(onKeyPress: _handleKeyPress),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CustButton(
                      text: "دخل",
                      func: () {
                        _handleKeyPress("دخل");
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
            )
          ],
        ),
      ),
    );
  }
}
