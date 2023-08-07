import 'package:edunation/common/work_harder_btn.dart';
import 'package:edunation/constants/utils.dart';
import 'package:edunation/features/meditation/screens/mediation_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class WellDoneScreen extends StatefulWidget {
  const WellDoneScreen({super.key});

  @override
  State<WellDoneScreen> createState() => _WellDoneScreenState();
}

class _WellDoneScreenState extends State<WellDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Well done! 👏🏻",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Lottie.asset('assets/animations/clap_animation.json'),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  'Well Done! 🥳',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              WorkHarderButton(onPressed: () {
                moveScreen(context, MeditationHomeScreen());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
