part of 'game_logic_cubit.dart';

@immutable
sealed class GameLogicState {}

final class GameLogicInitial extends GameLogicState {}
final class GameLogicUpdated extends GameLogicState {}
