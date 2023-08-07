import 'package:edunation/constants/utils.dart';
import 'package:edunation/features/meditation/screens/choose_mediation_screen.dart';
import 'package:edunation/features/meditation_activities_screen.dart/screens/meditation_activites_screen.dart';
import 'package:edunation/features/study/s_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class MeditationHomeScreen extends StatefulWidget {
  const MeditationHomeScreen({Key? key}) : super(key: key);

  @override
  State<MeditationHomeScreen> createState() => _MeditationHomeScreenState();
}

class _MeditationHomeScreenState extends State<MeditationHomeScreen> {
  bool changeState = false;
  String? selectedOption = "Easy Mode";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                child: Text(
                  "Meditation Time!",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () {
                  setState(() {
                    changeState = !changeState;
                  });
                },
              ),
              changeState
                  ? TextButton(
                      onPressed: () {
                        moveScreen(context, SHomeScreen());
                      },
                      child: Text(
                        "Study",
                        style: TextStyle(color: Colors.green, fontSize: 22),
                      ))
                  : Container(),
              IconButton(
                icon:
                    changeState ? Icon(Icons.cut) : Icon(Icons.arrow_drop_down),
                onPressed: () {
                  setState(() {
                    changeState = !changeState;
                  });
                },
              ),
            ]),
        centerTitle: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(), // Allow natural scrolling
        children: [
          Container(
            height: size.height *
                1, // Set the container height instead of using full height
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  HexColor(
                      '#B4C4D9'), // Changed the background color to a bit dark
                  HexColor('#F0F0F0'),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 0),
                  Container(
                    width: size.width * 0.8,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          'https://images.unsplash.com/photo-1512438248247-f0f2a5a8b7f0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bWVkaXRhdGlvbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60',
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'MEDITATION TIME!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 41,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              blurRadius: 2,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: size.width * 0.8,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Get started with meditation!',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Meditation helps to improve focus, reduce stress, and promote emotional well-being. Start your meditation journey now!',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      moveScreen(context, MeditationActivitiesScreen());
                    },
                    child: Container(
                      width: size.width * 0.6,
                      height: size.height * 0.07,
                      alignment: Alignment.center,
                      child: Text(
                        'Calming activites!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: HexColor('#9bcfa9'),
                        boxShadow: [
                          BoxShadow(
                            color: HexColor('#67c27f').withOpacity(0.5),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      moveScreen(context, const ChooseMediationScreen(),
                          isPushReplacement: true);
                    },
                    child: Container(
                      width: size.width * 0.6,
                      height: size.height * 0.07,
                      alignment: Alignment.center,
                      child: Text(
                        'Start Meditation',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: HexColor('#5E4AE3'),
                        boxShadow: [
                          BoxShadow(
                            color: HexColor('#5E4AE3').withOpacity(0.5),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
