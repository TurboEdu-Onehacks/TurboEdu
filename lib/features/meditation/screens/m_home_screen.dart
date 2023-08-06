import 'dart:async';
import 'package:flutter/material.dart';
import 'package:edunation/common/get_started_btn.dart';
import '../../../constants/utils.dart';
import 'mediation_screen.dart';

class MeditationHomeScreen extends StatefulWidget {
  const MeditationHomeScreen({Key? key}) : super(key: key);

  @override
  State<MeditationHomeScreen> createState() => _MeditationHomeScreenState();
}

class _MeditationHomeScreenState extends State<MeditationHomeScreen> {
  String? selectedOption = "Easy Mode";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meditation Time 😌',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                height: 250,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1474418397713-7ede21d49118?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=853&q=80',
                    ),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: ElevatedButton(
                  onPressed: () {
                    _showChooseOptionDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Choose Option',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Selected Option:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                selectedOption!,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GetStartedButton(
                  text: 'Get Started',
                  onPressed: () {
                    moveScreen(
                      context,
                      MeditationScreen(mode: selectedOption!),
                      isPushReplacement: true,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showChooseOptionDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildOptionButton('Easy Mode', Colors.blue),
                const SizedBox(height: 10),
                _buildOptionButton('Medium Mode', Colors.green),
                const SizedBox(height: 10),
                _buildOptionButton('Hard Mode', Colors.orange),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildOptionButton(String label, Color color) {
    return ElevatedButton(
      onPressed: () => _onOptionSelected(label),
      style: ElevatedButton.styleFrom(
        primary: selectedOption == label ? color : Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          color: selectedOption == label ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _onOptionSelected(String option) {
    setState(() {
      selectedOption = option;
    });
    Timer(const Duration(milliseconds: 1200), () {
      Navigator.pop(context, selectedOption);
    });
  }
}
