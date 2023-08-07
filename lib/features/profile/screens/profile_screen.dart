import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Profile! 🔥',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              _buildProfileImage(),
              SizedBox(height: 20),
              _buildUserNameAndJob(),
              SizedBox(height: 16),
              _buildBio(),
              SizedBox(height: 40),
              _buildEditProfileButton(),
              SizedBox(height: 16),
              _buildLogoutButton(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle a custom action, e.g., contact the user.
        },
        backgroundColor: Colors.lightBlue,
        child: Icon(
          Icons.email,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildProfileImage() {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(
            'https://via.placeholder.com/150', // Replace with actual URL for user's profile image.
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildUserNameAndJob() {
    return Column(
      children: [
        Text(
          'NotArmaan',
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Flutttreerrrr',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF666666),
          ),
        ),
      ],
    );
  }

  Widget _buildBio() {
    return Text(
      'Passionate about creating beautiful and user-friendly interfaces that deliver an exceptional user experience.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 18,
        color: Color(0xFF333333),
      ),
    );
  }

  Widget _buildEditProfileButton() {
    return ElevatedButton(
      onPressed: () {
        // Handle the edit profile action.
      },
      child: Text('Points: 01'),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF00C851),
        onPrimary: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        textStyle: TextStyle(fontSize: 18),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return TextButton(
      onPressed: () {
        // Handle the log out action.
      },
      child: Text('Log Out'),
      style: TextButton.styleFrom(
        primary: Color(0xFF007BFF),
        textStyle: TextStyle(fontSize: 16),
      ),
    );
  }
}
