import 'dart:convert';

import 'package:edunation/features/study/questionScreen.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

import '../../constants/constants.dart';

class Quiz extends StatefulWidget {
  String? text;
  Quiz({super.key, this.text});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: Text("Create Quiz"),
        onPressed: () async {
          final res = await http.post(
              Uri.parse("https://api.openai.com/v1/chat/completions"),
              headers: {
                "Content-Type": "application/json",
                "Authorization": "Bearer $openaiAPIKEY"
              },
              body: jsonEncode({
                "model": "gpt-3.5-turbo",
                "messages": [
                  {
                    "role": "user",
                    "content":
                        "Act as a Teacher create a MCQ quiz for your student the quiz question and answer should be enclosed in square bracket and quiz answers should be in square bracket  don't type anything else. Don't type any enters. Put the correct answer in the list at last repeated. The form should be like this - question, option 1, option 2, option 3, option 4, the option which is the answere again repeated. The text is - ${widget.text}"
                  }
                ],
                "temperature": 0.7
              }));
          print(res.body);
          String formattedBody =
              jsonDecode(res.body)["choices"][0]["message"]["content"];
          List<String> formattedBodyList = formattedBody
              .replaceAll("\\", "")
              .replaceAll("]", "")
              .replaceAll("[", "")
              .split("\n");
          List<String> RemoveRangeOfLIst(List<String> list, start, end) {
            List<String> listOfRange = list;
            listOfRange.removeRange(start, end);
            return listOfRange;
          }

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (c) => QuestionScreen(
                question: formattedBodyList[0],
                MCQ1: formattedBodyList[1],
                MCQ2: formattedBodyList[2],
                MCQ3: formattedBodyList[3],
                MCQ4: formattedBodyList[4],
                correctAns: formattedBodyList[5],
                remainingTextList: RemoveRangeOfLIst(formattedBodyList, 0, 5),
              ),
            ),
          );
        },
      )),
    );
  }
}
