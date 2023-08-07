import 'dart:async';
import 'dart:convert';
import 'package:edunation/credentials.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LearnScreen(),
    );
  }
}

class LearnScreen extends StatefulWidget {
  const LearnScreen({Key? key}) : super(key: key);

  @override
  State<LearnScreen> createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  final TextEditingController _questionController = TextEditingController();
  List<ChatMessage> _chatMessages = [];
  bool _isTyping = false;

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  Future<void> _getAnswer() async {
    // Get the user's question from the TextField
    String userQuestion = _questionController.text.trim();

    try {
      if (userQuestion.isNotEmpty) {
        // Replace YOUR_API_KEY with your actual OpenAI GPT-3 API key
        String apiKey = Credentials().apiKey;
        String prompt =
            "Teacher: Please answer the following question - $userQuestion";

        setState(() {
          _isTyping = true;
          _chatMessages
              .add(ChatMessage(sender: "Teacher", text: "...", isTyping: true));
        });

        final endpoint =
            'https://api.openai.com/v1/engines/text-davinci-002/completions';
        final response = await http.post(
          Uri.parse(endpoint),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $apiKey',
          },
          body: jsonEncode({
            'prompt': prompt,
            'max_tokens': 300, // Increase this value for longer responses
          }),
        );

        if (response.statusCode == 200) {
          var data = jsonDecode(response.body);
          String answer = data['choices'][0]['text'];

          // Stop typing animation and show the answer
          setState(() {
            _isTyping = false;
            _chatMessages.removeLast();
            _chatMessages.add(ChatMessage(sender: "Teacher", text: answer));
          });
        } else {
          // Handle API error
          setState(() {
            _isTyping = false;
            _chatMessages.add(ChatMessage(
                sender: "Teacher",
                text: "Error: Unable to get the answer. Please try again."));
          });

          // Print the response body in the error case
          print("API Error Response Body: ${response.body}");
        }
      }
    } catch (e) {
      print("Error: $e");
      setState(() {
        _isTyping = false;
        _chatMessages.add(ChatMessage(
            sender: "Teacher",
            text: "Error: Unable to get the answer. Please try again."));
      });
    }
  }

  Future<void> _simulateTyping() async {
    setState(() {
      _chatMessages
          .add(ChatMessage(sender: "Teacher", text: "...", isTyping: true));
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _chatMessages.removeLast();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Virtual Teacher!'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ..._chatMessages.map((message) => ChatBubble(message: message)),
            TextField(
              controller: _questionController,
              decoration: InputDecoration(
                labelText: 'Ask a Question :)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _isTyping
                  ? null
                  : _getAnswer, // Disable button while typing animation is running
              child: const Text('Ask'),
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class ChatMessage {
  final String sender;
  final String text;
  final bool isTyping;

  ChatMessage(
      {required this.sender, required this.text, this.isTyping = false});
}

class ChatBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      alignment: message.sender == "User"
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: message.sender == "User"
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          message.isTyping
              ? SizedBox(
                  width: 24.0,
                  height: 8.0,
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.transparent,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                )
              : Text(message.text, style: TextStyle(fontSize: 16.0)),
          const SizedBox(height: 4.0),
          Text(message.sender, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      decoration: BoxDecoration(
        color: message.sender == "User"
            ? Colors.blue.shade100
            : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
