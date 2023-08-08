import 'package:edunation/features/study/s_home_screen.dart';
import 'package:flutter/material.dart';

class QuestionScreen extends StatefulWidget {
  String? question;
  String? MCQ1;
  String? MCQ2;
  String? MCQ3;
  String? MCQ4;
  List<String>? remainingTextList;
  QuestionScreen(
      {super.key,
      this.question,
      this.MCQ1,
      this.MCQ2,
      this.MCQ3,
      this.MCQ4,
      this.remainingTextList});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  String answerStatus = "not";
  bool enabled = true;
  void checkQuestion(selectedOption) {
    setState(() {
      answerStatus = "correct";
      enabled = false;
    });
  }

  List<String> RemoveRangeOfLIst(List<String> list, start, end) {
    List<String> listOfRange = list;
    listOfRange.removeRange(start, end);
    return listOfRange;
  }

  Widget renderConditionally(String answerStatus) {
    if (answerStatus == "not") {
      return Container();
    } else if (answerStatus == "correct") {
      return Column(
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: ElevatedButton(
                child: Text("Next Question"),
                onPressed: () {
                  if (widget.remainingTextList! == []) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => SHomeScreen()));
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => QuestionScreen(
                          question: widget.remainingTextList![0],
                          MCQ1: widget.remainingTextList![1],
                          MCQ2: widget.remainingTextList![2],
                          MCQ3: widget.remainingTextList![3],
                          MCQ4: widget.remainingTextList![4],
                          remainingTextList: RemoveRangeOfLIst(
                              widget.remainingTextList!, 0, 5),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          )
        ],
      );
    } else {
      return Column(
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.75,
              child: ElevatedButton(
                child: Text("Next Question"),
                onPressed: () {
                  if (widget.remainingTextList! == []) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => SHomeScreen()));
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => QuestionScreen(
                          question: widget.remainingTextList![0],
                          MCQ1: widget.remainingTextList![1],
                          MCQ2: widget.remainingTextList![2],
                          MCQ3: widget.remainingTextList![3],
                          MCQ4: widget.remainingTextList![4],
                          remainingTextList: RemoveRangeOfLIst(
                              widget.remainingTextList!, 0, 5),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Center(
                      child: Text(
                    widget.question!,
                    textAlign: TextAlign.center,
                    softWrap: true,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: ElevatedButton(
                    onPressed: enabled
                        ? () {
                            checkQuestion(widget.MCQ1);
                          }
                        : () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 173, 143, 143),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    child: Text(
                      widget.MCQ1!,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: ElevatedButton(
                    onPressed: enabled
                        ? () {
                            checkQuestion(widget.MCQ2);
                          }
                        : () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 173, 143, 143),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    child: Text(
                      widget.MCQ2!,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: ElevatedButton(
                    onPressed: enabled
                        ? () {
                            checkQuestion(widget.MCQ3);
                          }
                        : () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 173, 143, 143),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    child: Text(
                      widget.MCQ3!,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: ElevatedButton(
                    onPressed: enabled
                        ? () {
                            checkQuestion(widget.MCQ4);
                          }
                        : () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 173, 143, 143),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                    child: Text(
                      widget.MCQ4!,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              renderConditionally(answerStatus),
            ],
          ),
        ),
      ),
    );
  }
}
