import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MeditationWidget extends StatefulWidget {
  final String image;
  final String text;
  final VoidCallback onTap;
  const MeditationWidget(
      {super.key,
      required this.image,
      required this.text,
      required this.onTap});

  @override
  State<MeditationWidget> createState() => MeditationWidgetState();
}

class MeditationWidgetState extends State<MeditationWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.image),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      height: size.height * 0.28,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.text,
            style: GoogleFonts.poppins(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          InkWell(
            onTap: widget.onTap,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 60),
              width: double.infinity,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black, width: 1.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "Go Ahead",
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
