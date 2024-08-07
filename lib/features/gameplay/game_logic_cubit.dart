import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'game_logic_state.dart';

class GameLogicCubit extends Cubit<GameLogicState> {
  GameLogicCubit() : super(GameLogicInitial());

  List<List<String>> guesses = List.generate(6, (_) => List.filled(5, ''));
  List<List<String>> guessesEvaluated = [];
  int guessesRemaining = 6;

  void updateGuess(int index, int letterIndex, String value) {
    guesses[index][letterIndex] = value;
    emit(GameLogicUpdated());
  }

  void submitGuess() {
    if (guessesRemaining > 0) {
      guessesEvaluated.add(List.from(guesses[6 - guessesRemaining]));
      guessesRemaining--;
      emit(GameLogicUpdated());
    }
  }

  void resetCurrentGuess(int index) {
    guesses[index] = List.filled(5, '');
    emit(GameLogicUpdated());
  }
}
