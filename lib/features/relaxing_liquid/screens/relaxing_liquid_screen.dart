import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

void main() => runApp(RelaxingLiquidApp());

class RelaxingLiquidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RelaxingLiquidScreen(),
    );
  }
}

class RelaxingLiquidScreen extends StatefulWidget {
  @override
  _RelaxingLiquidScreenState createState() => _RelaxingLiquidScreenState();
}

class _RelaxingLiquidScreenState extends State<RelaxingLiquidScreen> {
  double particleX = 0.5;
  double particleY = 0.5;

  void _onPanUpdate(DragUpdateDetails details) {
    // Update the particle's position based on the touch movement
    setState(() {
      particleX = details.localPosition.dx / MediaQuery.of(context).size.width;
      particleY = details.localPosition.dy / MediaQuery.of(context).size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Relaxing Liquid'),
      ),
      body: GestureDetector(
        onPanUpdate: _onPanUpdate,
        child: LiquidSwipe(
          pages: [
            Container(color: Colors.blue),
            Container(color: Colors.green),
            Container(color: Colors.orange),
          ],
        ),
        // Custom Paint to draw particles on top of the liquid swipe pages
        // The particles follow the touch movement
      ),
    );
  }
}

class ParticlePainter extends CustomPainter {
  final Offset particleOffset;

  ParticlePainter(this.particleOffset);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.fill;

    // Draw a small circle at the particle's offset
    canvas.drawCircle(
        Offset(particleOffset.dx * size.width, particleOffset.dy * size.height),
        10,
        paint);
  }

  @override
  bool shouldRepaint(ParticlePainter oldDelegate) => true;
}
