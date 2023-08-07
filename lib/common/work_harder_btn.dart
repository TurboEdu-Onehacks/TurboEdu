import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkHarderButton extends StatelessWidget {
  final VoidCallback onPressed;

  WorkHarderButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // Button background color
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        elevation: 4, // Shadow elevation
        textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
     
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.work,
            color: Colors.white,
          ), // An icon to represent work
          SizedBox(width: 8),
          Text(
            "Work Harder",
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 18,
            ),
          ), // Text for the button
        ],
      ),
    );
  }
}
