import 'package:edunation/constants/utils.dart';
import 'package:edunation/features/auth/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: Text(
                  appName,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Center(
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://media.istockphoto.com/id/157482029/photo/stack-of-books.jpg?s=612x612&w=0&k=20&c=ZxSsWKNcVpEzrJ3_kxAUuhBCT3P_dfnmJ81JegPD8eE=')),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              //custom get started button

              InkWell(
                onTap: () {
                  moveScreen(context,  SignUpScreen());
                },
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Get Started -> ",
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
