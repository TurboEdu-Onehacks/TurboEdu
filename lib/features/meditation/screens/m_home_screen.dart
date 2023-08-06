import 'package:flutter/material.dart';

class MeditationHomeScreen extends StatefulWidget {
  const MeditationHomeScreen({super.key});

  @override
  State<MeditationHomeScreen> createState() => _MeditationHomeScreenState();
}

class _MeditationHomeScreenState extends State<MeditationHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
