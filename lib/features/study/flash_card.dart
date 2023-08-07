import 'dart:convert';

import 'package:edunation/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<String> useChatAPI(String prompt) async {
  print(prompt);
  final res = await http.post(
      Uri.parse("https://api.openai.com/v1/chat/completions"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer keyHere"
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": "$prompt"}
        ],
        "temperature": 0.7
      }));
  print(res.body);

  return res.body;
}

class FlashCard extends StatefulWidget {
  String? textInput;
  FlashCard({super.key, required this.textInput});

  @override
  State<FlashCard> createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  bool _showFrontSide = true;
  bool _flipXAxis = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _buildFront(String frontText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(color: Colors.blue),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              frontText,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRear(String backtext) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(color: Colors.blue),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Text(
              backtext,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFlipAnimation(frontText, backtext) {
    return GestureDetector(
      onTap: () => setState(() => _showFrontSide = !_showFrontSide),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 600),
        child: _showFrontSide ? _buildFront(frontText) : _buildRear(backtext),
      ),
    );
  }

  Map<String, dynamic>? res;
  List<String> flashArray = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: res == null
          ? Center(
              child: ElevatedButton(
              child: Text(
                "Create flash card",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                res = jsonDecode(await useChatAPI(
                    "act as a pro student who loves to create flash cards Create a flashcard for the following lines from a chapter Don't type anything else Front and back should be seperated by a comma. Don't use comma inside the content of Front and Back of the flashcard. The answer which is back should not be more than 20 words and front should not be more that 10 words.Don't type any enter and comma in the text The lines are - ${widget.textInput}"));
                String content = res!["choices"][0]["message"]["content"];
                flashArray = content
                    .replaceAll("[", "")
                    .replaceAll("[", "")
                    .replaceAll(",", "")
                    .replaceAll("Back:", ",")
                    .split(",")
                    .map((e) => e.trim())
                    .toList();
                setState(() {
                  res;
                  flashArray;
                });
                // String content = res;
              },
            ))
          : SafeArea(
              child: ListView.builder(
                itemCount: flashArray.length - 1,
                itemBuilder: (context, index) {
                  if (flashArray[index].contains("Front:")) {
                    return _buildFlipAnimation(
                        flashArray[index].replaceAll("Front:", ""),
                        flashArray[index + 1]);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
    );
  }
}
