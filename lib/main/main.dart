
import 'package:edunation/features/options/screens/options_screen.dart';
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
      home: OptionsScreen(),
    );
  }
}
