import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Center(
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
            SizedBox(height: 30),
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
          ],
        ),
      ),
    );
  }
}
