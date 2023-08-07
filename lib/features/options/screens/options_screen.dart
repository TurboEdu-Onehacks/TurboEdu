import 'package:edunation/constants/utils.dart';
import 'package:edunation/features/meditation/screens/choose_mediation_screen.dart';
import 'package:edunation/features/study/s_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_picker/image_picker.dart';

import '../../../constants/constants.dart';

class OptionsScreen extends StatefulWidget {
  @override
  _OptionsScreenState createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<OptionsScreen> {
  bool _isPeaceState = true;

  void _toggleState(bool isPeaceState) {
    setState(() {
      _isPeaceState = isPeaceState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            moveScreen(context, ChooseMediationScreen());
          },
          child: Icon(Icons.arrow_circle_right_outlined)),
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text(appName,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () => _toggleState(true),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: _isPeaceState ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: _isPeaceState
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 20,
                              spreadRadius: 5,
                            )
                          ]
                        : [],
                  ),
                  child: Center(
                    child: Text(
                      "Peace State",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: _isPeaceState ? Colors.blue : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () => _toggleState(false),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: !_isPeaceState ? Colors.white : Colors.transparent,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: !_isPeaceState
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 20,
                              spreadRadius: 5,
                            )
                          ]
                        : [],
                  ),
                  child: Center(
                    child: Text(
                      "Study State",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: !_isPeaceState ? Colors.blue : Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (!_isPeaceState) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (c) => SHomeScreen()));
                  }
                },
                child: Text(
                  "Let's Go",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
