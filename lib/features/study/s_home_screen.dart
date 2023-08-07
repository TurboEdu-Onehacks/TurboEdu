import 'package:edunation/features/study/create_flash_card.dart';
import 'package:edunation/features/study/questionScreen.dart';
import 'package:flutter/material.dart';

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
                child: Text("Study"),
                onTap: () {
                  setState(() {
                    changeState = !changeState;
                  });
                },
              ),
              changeState
                  ? TextButton(
                      onPressed: () {},
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
                        "Create Flash card",
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
                    context,
                    MaterialPageRoute(
                        builder: (c) => QuestionScren(
                              question:
                                  "What is the biggest cell in the human body?",
                              MCQ1: "Nerve cell",
                              MCQ2: "Brain Cell",
                              MCQ3: "Blood cell",
                              MCQ4: "Skin cell",
                            )));
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
                      "https://educloud.app/lms/src/timetable/hero.png",
                      height: 150,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      "Create Time Table",
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(
                      "Time tables structure study sessions, promote consistency, prioritize tasks, reduce procrastination, enhance focus, optimize retention, and manage workload efficiently.",
                      softWrap: true,
                      style: TextStyle(fontSize: 12),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
