import 'package:edunation/features/meditation_sounds/screens/nature_sounds.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:edunation/features/calming_bubbles/screens/calming_bubbles_screen.dart';
import 'package:edunation/features/relaxing_liquid/screens/relaxing_liquid_screen.dart';
import 'package:edunation/features/meditation_activities_screen.dart/widgets/meditation_widget.dart';

import '../../../constants/utils.dart';

class MeditationActivitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Relaxing Activities!',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Center(
            child: Text(
              "Relaxing Activities! 🔥🔥",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontSize: 21,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 00),
          MeditationWidget(
            image:
                'https://images.unsplash.com/photo-1536623975707-c4b3b2af565d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bWVkaXRhdGlvbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60',
            text: 'Healing Bubbles',
            onTap: () => moveScreen(context, CalmingBubblesScreen()),
          ),
          SizedBox(height: 00),
          MeditationWidget(
            image:
                'https://images.unsplash.com/photo-1522075782449-e45a34f1ddfb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
            text: 'Infinite Relaxer',
            onTap: () => moveScreen(context, RelaxingLiquidScreen()),
          ),
          MeditationWidget(
            image:
                'https://images.unsplash.com/photo-1528715471579-d1bcf0ba5e83?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWVkaXRhdGlvbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60',
            text: 'Nature sounds',
            onTap: () => moveScreen(context, NatureSoundsScreen()),
          ),
          // Add more MeditationActivityCard widgets with different activities
        ],
      ),
    );
  }
}

class MeditationActivityCard extends StatelessWidget {
  final String image;
  final String text;
  final VoidCallback onTap;

  const MeditationActivityCard({
    required this.image,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                image,
                height: 150,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return ShimmerEffect(); // Implement shimmer loading effect.
                },
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/placeholder_image.png', // Add a placeholder image asset.
                    height: 150,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerEffect extends StatelessWidget {
  // Implement shimmer effect here.
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
    );
  }
}
