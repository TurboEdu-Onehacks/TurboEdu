import 'dart:convert';

import 'package:edunation/features/study/questionScreen.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

import '../../constants/constants.dart';
import '../../credentials.dart';

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
                "Authorization": "Bearer ${Credentials().apiKey}"
              },
              body: jsonEncode({
                "model": "gpt-3.5-turbo",
                "messages": [
                  {
                    "role": "user",
                    "content":
                        "Act as a Teacher create a MCQ quiz for your student the quiz question and answer should be enclosed in square bracket and quiz answers should be in square bracket  don't type anything else. Don't type any enters. Put the correct answer in the list at last repeated. The form should be like this - question, option 1, option 2, option 3, option 4. Give the correct option in last in a form like this a,b,c,a,d,c after all question and answer are typed. The number of question should be in the table of 5. Question should be of 4 option and not of Yes or no. The text is - ${widget.text}"
                  }
                ],
                "temperature": 0.7
              }),
            );

            if (res.statusCode == 200) {
              Map<String, dynamic> responseBody = jsonDecode(res.body);
              List<dynamic> choices = responseBody["choices"];

              if (choices.isNotEmpty) {
                Map<String, dynamic> message = choices[0]["message"];
                String formattedBody = message["content"];

                List<String> formattedBodyList = formattedBody
                    .replaceAll("\\", "")
                    .replaceAll("]", "")
                    .replaceAll("[", "")
                    .replaceAll("\n\n", "\n")
                    .split("\n");

                List<String> RemoveRangeOfList(
                    List<String> list, int start, int end) {
                  List<String> listOfRange = list;
                  listOfRange.removeRange(start, end);
                  return listOfRange;
                }

                print(formattedBodyList);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (c) => QuestionScreen(
                      question: formattedBodyList[0],
                      MCQ1: formattedBodyList[1],
                      MCQ2: formattedBodyList[2],
                      MCQ3: formattedBodyList[3],
                      MCQ4: formattedBodyList[4],
                      remainingTextList:
                          RemoveRangeOfList(formattedBodyList, 0, 5),
                    ),
                  ),
                );
              } else {
                // Handle case where 'choices' is empty or null
                print("No 'choices' found in the response.");
              }
            } else {
              // Handle HTTP request error
              print("Error: ${res.statusCode} - ${res.reasonPhrase}");
            }
          },
        ),
      ),
    );
  }
}
