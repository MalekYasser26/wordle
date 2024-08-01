import 'package:flutter/material.dart';
import 'package:wordle/features/gameplay/views/gameplay_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GameplayView(),
      debugShowCheckedModeBanner: false,
    );
  }
}

