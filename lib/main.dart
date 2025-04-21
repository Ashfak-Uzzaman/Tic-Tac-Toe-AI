import 'package:flutter/material.dart';
import 'package:tic_tac_toe_ai/constants/routes.dart';
import 'package:tic_tac_toe_ai/screens/ai_game_screen.dart';
import 'package:tic_tac_toe_ai/screens/landing_screen.dart';
import 'package:tic_tac_toe_ai/screens/multiplayer_game_screen.dart';

// UI design: https://www.behance.net/gallery/222041287/Tic-Tac-Toe?tracking_source=search_projects%7Ctic+tac+toe+game+ui

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LandingScreen(),
    routes: {
      multiplayerScreenRoute: (context) => const MultiplayerGameScreen(),
      aIScreenRoute: (context) => const AIGameScreen(),
    },
  ));
}
