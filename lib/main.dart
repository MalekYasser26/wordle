import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle/features/gameplay/game_logic_cubit.dart';
import 'package:wordle/features/gameplay/views/gameplay_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GameLogicCubit()),
      ],
      child: MaterialApp(
        home: const GameplayView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
