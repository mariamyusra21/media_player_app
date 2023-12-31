import 'package:flutter/material.dart';
import 'package:media_player_app/home_page.dart';

// @dart=2.9
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}
