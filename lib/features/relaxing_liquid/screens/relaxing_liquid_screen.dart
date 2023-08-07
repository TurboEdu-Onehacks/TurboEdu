import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class RelaxingLiquidScreen extends StatefulWidget {
  @override
  _RelaxingLiquidScreenState createState() => _RelaxingLiquidScreenState();
}

class _RelaxingLiquidScreenState extends State<RelaxingLiquidScreen>
    with SingleTickerProviderStateMixin {
  List<Particle> particles = [];
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    // Add new particle position to the list based on touch movement
    setState(() {
      particles.add(
        Particle(
          position: details.localPosition,
          velocity: details.delta * 0.2,
          acceleration: details.delta * 0.02,
          color: _getRandomColor(),
        ),
      );
    });
  }

  void _onPanEnd(DragEndDetails details) {
    // Clear the particles list when the finger is released
    setState(() {
      particles.clear();
    });
  }

  Color _getRandomColor() {
    // Generate a random color
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
        .withOpacity(1.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Infinite Relaxer',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onPanUpdate: _onPanUpdate,
        onPanEnd: _onPanEnd,
        child: Stack(
          children: [
            LiquidSwipe(
              pages: [
                Container(color: Colors.blue),
                Container(color: Colors.green),
                Container(color: Colors.orange),
              ],
            ),
            // Custom Paint to draw particles on top of the liquid swipe pages
            // The particles follow the touch movement
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                _updateParticles();
                return Stack(
                  children: particles.map((particle) {
                    return Positioned(
                      left: particle.position.dx,
                      top: particle.position.dy,
                      child: ParticleWidget(color: particle.color),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _updateParticles() {
    for (int i = particles.length - 1; i >= 0; i--) {
      Particle particle = particles[i];
      particle.velocity += particle.acceleration;
      particle.position += particle.velocity;
      // Remove particles that are off-screen
      if (particle.position.dx < 0 ||
          particle.position.dy < 0 ||
          particle.position.dx > MediaQuery.of(context).size.width ||
          particle.position.dy > MediaQuery.of(context).size.height) {
        particles.removeAt(i);
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Particle {
  Offset position;
  Offset velocity;
  Offset acceleration;
  Color color;

  Particle({
    required this.position,
    required this.velocity,
    required this.acceleration,
    required this.color,
  });
}

class ParticleWidget extends StatelessWidget {
  final Color color;

  ParticleWidget({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20, // Make the particles bigger
      height: 20,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
