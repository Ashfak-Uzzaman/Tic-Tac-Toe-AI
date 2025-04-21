import 'package:flutter/material.dart';
import 'package:tic_tac_toe_ai/components/text.dart';
import 'package:tic_tac_toe_ai/constants/colors.dart';
import 'package:tic_tac_toe_ai/screens/ai_game_screen.dart';
import 'package:tic_tac_toe_ai/screens/multiplayer_game_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              const SizedBox(height: 48),
              MainText(
                text: 'Tic - Tac - Toe',
                fontSize: 56,
                color: MainColor.accentColor,
              ),
              const SizedBox(
                  height: 8), // control spacing between text and image
              Padding(
                padding: EdgeInsets.all(24.0),
                child: Image.asset(
                  'assets/images/logo.jpeg',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 8), // spacing between image and buttons
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MainColor.accentColor,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MultiplayerGameScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: MainText(
                    text: 'Multi Player',
                    fontSize: 30,
                    color: MainColor.primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MainColor.accentColor,
                  shadowColor: Colors.transparent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AIGameScreen()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: MainText(
                    text: 'Play With AI',
                    fontSize: 30,
                    color: MainColor.primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 32), // optional bottom spacing
            ],
          ),
        ),
      ),
    );
  }
}
