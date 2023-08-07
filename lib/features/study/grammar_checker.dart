import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class GrammarCheckerScreen extends StatefulWidget {
  @override
  _GrammarCheckerScreenState createState() => _GrammarCheckerScreenState();
}

class _GrammarCheckerScreenState extends State<GrammarCheckerScreen> {
  final _controller = TextEditingController();
  String _originalText = '';
  String _correctedText = '';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grammar Checker',
          style: GoogleFonts.poppins(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              _copyToClipboard();
            },
            icon: const Icon(
              Icons.copy,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Time to fix grammar 📒 ;)",
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "Everything is possible with the power of AI! 🤖",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: TextField(
                controller: _controller,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  hintText: 'Enter your text here...',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  setState(() {
                    _originalText =
                        'Just find grammar mistakes and show the corrected paragraph:\n' +
                            text;
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: _isLoading ? null : _fixGrammar,
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text('Fix Grammar'),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF00C851),
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  _correctedText,
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey), // Set the color to grey.
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _fixGrammar() async {
    setState(() {
      _isLoading = true;
    });

    final apiKey =
        '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'; // Replace with your actual API key.
    final endpoint =
        'https://api.openai.com/v1/engines/text-davinci-002/completions';

    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'prompt': _originalText,
          "max_tokens": 150,
          // Adjust the number of tokens based on your needs.
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final corrections = data['choices'][0]['text'];
        setState(() {
          _correctedText = corrections;
        });
      } else {
        print('API request failed with status code ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred during API request: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _correctedText));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Paragraph copied to clipboard!'),
      duration: Duration(seconds: 2),
    ));
  }
}
