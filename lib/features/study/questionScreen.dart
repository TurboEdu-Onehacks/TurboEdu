import 'package:flutter/material.dart';

class QuestionScren extends StatefulWidget {
  String? question;
  String? MCQ1;
  String? MCQ2;
  String? MCQ3;
  String? MCQ4;
  QuestionScren(
      {super.key, this.question, this.MCQ1, this.MCQ2, this.MCQ3, this.MCQ4});

  @override
  State<QuestionScren> createState() => _QuestionScrenState();
}

class _QuestionScrenState extends State<QuestionScren> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Text(
                widget.question!,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
