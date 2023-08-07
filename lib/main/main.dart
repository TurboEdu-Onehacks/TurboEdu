import 'package:edunation/features/calming_bubbles/screens/calming_bubbles_screen.dart';
import 'package:edunation/features/meditation/screens/choose_mediation_screen.dart';
import 'package:edunation/features/meditation/screens/mediation_home_screen.dart';
import 'package:edunation/features/meditation_activities_screen.dart/screens/meditation_activites_screen.dart';
import 'package:edunation/features/relaxing_liquid/screens/relaxing_liquid_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  //pls run asap
  // it takes a lot of time to run, idk why
  //hmm

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Edunation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MeditationActivitiesScreen(),
    );
  }
}
