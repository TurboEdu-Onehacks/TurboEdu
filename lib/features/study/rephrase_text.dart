import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class RephraseTextScreen extends StatefulWidget {
  @override
  _RephraseTextScreenState createState() => _RephraseTextScreenState();
}

class _RephraseTextScreenState extends State<RephraseTextScreen> {
  final _controller = TextEditingController();
  String _originalPrompt = '';
  String _rephrasedPrompt = '';
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rephrase Prompt',
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
                "Rephrase your prompt 📋 ;)",
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
                "Get multiple versions of your prompt with the power of AI! 🚀",
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
                  hintText: 'Enter your prompt here...',
                  border: OutlineInputBorder(),
                ),
                onChanged: (text) {
                  setState(() {
                    _originalPrompt = text;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: _isLoading ? null : _rephrasePrompt,
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text('Rephrase Prompt'),
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
                  _rephrasedPrompt,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey, // Set the color to grey.
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _rephrasePrompt() async {
    setState(() {
      _isLoading = true;
    });

    final endpoint =
        'https://api.openai.com/v1/engines/text-davinci-002/completions';

    try {
      final response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer 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',
        },
        body: jsonEncode({
          'prompt': 'Rephrase the following:\n' + _originalPrompt,
          'max_tokens': 150,
          // Adjust the number of tokens based on your needs.
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final rephrasedText = data['choices'][0]['text'];
        setState(() {
          _rephrasedPrompt = rephrasedText;
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
    Clipboard.setData(ClipboardData(text: _rephrasedPrompt));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Prompt copied to clipboard!'),
      duration: Duration(seconds: 2),
    ));
  }
}
