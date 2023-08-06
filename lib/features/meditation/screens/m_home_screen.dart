import 'dart:async';

import 'package:edunation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MeditationHomeScreen extends StatefulWidget {
  const MeditationHomeScreen({Key? key}) : super(key: key);

  @override
  State<MeditationHomeScreen> createState() => _MeditationHomeScreenState();
}

class _MeditationHomeScreenState extends State<MeditationHomeScreen> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appName,
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Meditation Time 😌",
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 250,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    image: const DecorationImage(
                        image: NetworkImage(
                      'https://images.unsplash.com/photo-1474418397713-7ede21d49118?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=853&q=80',
                    ))),
              ),
              Center(
                child: SuperCoolButton(
                  onPressed: () {
                    _showChooseOptionDialog();
                  },
                  text: 'Choose Option',
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
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomButton(
                  color: Colors.grey.shade100,
                  label: 'Easy Mode',
                  onTap: () => _onOptionSelected('Easy Mode'),
                  isSelected: selectedOption == 'Easy Mode',
                ),
                SizedBox(height: 10),
                CustomButton(
                  color: Colors.green,
                  label: 'Medium Mode',
                  onTap: () => _onOptionSelected('Medium Mode'),
                  isSelected: selectedOption == 'Medium Mode',
                ),
                SizedBox(height: 10),
                CustomButton(
                  color: Colors.orange,
                  label: 'Hard Mode',
                  onTap: () => _onOptionSelected('Hard Mode'),
                  isSelected: selectedOption == 'Hard Mode',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onOptionSelected(String option) {
    setState(() {
      selectedOption = option;
    });
    Timer(Duration(milliseconds: 1200), () {
      Navigator.pop(context, selectedOption);
    });
  }
}

class SuperCoolButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const SuperCoolButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 70),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [Colors.purple, Colors.blue],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(30),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback? onTap;
  final bool isSelected;

  const CustomButton({
    required this.color,
    required this.label,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.8) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: color,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
