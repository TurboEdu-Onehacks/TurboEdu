import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:audioplayers/audioplayers.dart';

class CalmingBubblesScreen extends StatefulWidget {
  @override
  _CalmingBubblesScreenState createState() => _CalmingBubblesScreenState();
}

class _CalmingBubblesScreenState extends State<CalmingBubblesScreen> {
  List<Bubble> bubbles = [];
  Color selectedColor = Colors.blue; // Default color

  final AudioPlayer _audioCache = AudioPlayer();

  void _onTapDown(TapDownDetails details) {
    setState(() {
      bubbles
          .add(Bubble(position: details.localPosition, color: selectedColor));
    });
    _playClickSound(); // Play the click sound when a bubble is created
  }

  void _playClickSound() async {
    // Replace 'assets/click_sound.mp3' with your sound file path
    await _audioCache.play(AssetSource('sounds/sound.mp3'));
  }

  void _clearBubbles() {
    setState(() {
      bubbles.clear();
    });
  }

  void _openColorPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Select Color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: selectedColor,
              onColorChanged: (Color color) {
                setState(() {
                  selectedColor = color;
                });
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'The healing bubbles',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: _clearBubbles,
          ),
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: _openColorPicker,
          ),
        ],
      ),
      body: GestureDetector(
        onTapDown: _onTapDown,
        child: CustomPaint(
          painter: BubblesPainter(bubbles),
          child: Container(),
        ),
      ),
    );
  }
}

class Bubble {
  Offset position;
  double radius;
  Color color;

  Bubble({required this.position, required this.color})
      : radius = math.Random().nextInt(30).toDouble() + 20;
}

class BubblesPainter extends CustomPainter {
  List<Bubble> bubbles;

  BubblesPainter(this.bubbles);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    for (Bubble bubble in bubbles) {
      paint.color = bubble.color;
      canvas.drawCircle(bubble.position, bubble.radius, paint);
    }
  }

  @override
  bool shouldRepaint(BubblesPainter oldDelegate) => true;
}
