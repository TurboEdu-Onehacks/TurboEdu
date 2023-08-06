import 'dart:async';
import 'package:edunation/constants/utils.dart';
import 'package:edunation/features/meditation/screens/choose_mediation_screen.dart';
import 'package:flutter/material.dart';

class MeditationScreen extends StatefulWidget {
  final String mode;

  const MeditationScreen({Key? key, required this.mode}) : super(key: key);

  @override
  _MeditationScreenState createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen>
    with TickerProviderStateMixin {
  int remainingTime = 50;
  Timer? timer;
  final List<String> randomThoughts = [
    "Take a deep breath...",
    "Focus on your breath...",
    "Feel the present moment...",
    "Let go of any tension...",
    "Find inner peace...",
    "Embrace tranquility...",
  ];
  String currentThought = "";
  String backgroundImage =
      'https://images.unsplash.com/photo-1506126613408-eca07ce68773?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=499&q=80';

  @override
  void initState() {
    super.initState();

    if (widget.mode == "Easy Mode") {
      remainingTime = 200;
    } else if (widget.mode == "Medium Mode") {
      remainingTime = 500;
    } else {
      remainingTime = 700;
    }
    setState(() {});

    startTimer();
    showRandomThought();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void giveUp() {
    timer?.cancel();
    setState(() {
      remainingTime = 0;
    });
    moveScreen(context, ChooseMediationScreen());
  }

  void showRandomThought() {
    const int intervalInSeconds = 5;
    int currentIndex = 0;

    Timer.periodic(Duration(seconds: intervalInSeconds), (timer) {
      setState(() {
        currentThought = randomThoughts[currentIndex];
        currentIndex = (currentIndex + 1) % randomThoughts.length;
        backgroundImage = getRandomBackgroundImage();
      });
    });
  }

  String getRandomBackgroundImage() {
    // Replace this with your logic to get random background images
    // For simplicity, we'll use the same image for demonstration purposes
    return 'https://images.unsplash.com/photo-1506126613408-eca07ce68773?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=499&q=80';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$remainingTime',
                style: const TextStyle(
                  fontSize: 72,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Text(
                  currentThought,
                  key: Key(currentThought),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: giveUp,
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  'Give Up',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
