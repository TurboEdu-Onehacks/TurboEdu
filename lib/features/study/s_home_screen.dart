import 'package:edunation/constants/constants.dart';
import 'package:edunation/constants/utils.dart';
import 'package:edunation/features/meditation/screens/mediation_home_screen.dart';
import 'package:edunation/features/study/Create_Quiz.dart';
import 'package:edunation/features/study/create_flash_card.dart';
import 'package:edunation/features/study/learn_screen.dart';
import 'package:edunation/features/study/questionScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SHomeScreen extends StatefulWidget {
  const SHomeScreen({super.key});

  @override
  State<SHomeScreen> createState() => _SHomeScreenState();
}

class _SHomeScreenState extends State<SHomeScreen> {
  bool changeState = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                child: Text(
                  "Study Time!",
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 18,
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
                        moveScreen(context, MeditationHomeScreen());
                      },
                      child: Text(
                        "Peace",
                        style: TextStyle(color: Colors.black, fontSize: 22),
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
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => CreateFlashCard()));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 243, 243),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/364836.jpg",
                        height: 150,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        "Create Flash cards",
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        "Flashcards facilitate active recall, strengthen memory through repetition, allow self-paced learning, and target weak knowledge areas, enhancing retention and understanding efficiently.",
                        softWrap: true,
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (c) => CreateQuiz()));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 243, 243),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/question.png",
                        height: 150,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        "Create quiz",
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        "Enhances understanding, improves memory, encourages critical thinking, fosters curiosity, reinforces learning, boosts confidence, develops problem-solving skills, promotes active engagement, deepens knowledge.",
                        softWrap: true,
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: () {
                moveScreen(context, LearnScreen());
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 243, 243, 243),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.network(
                        "https://images.unsplash.com/photo-1513258496099-48168024aec0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      title: Text(
                        "Want to learn something?",
                        style: TextStyle(fontSize: 20),
                      ),
                      subtitle: Text(
                        "We should never stop learning, with the power of AI, we can learn a lot, even more than before! so why not give it a shot with $appName ;)?",
                        softWrap: true,
                        style: TextStyle(fontSize: 12),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
