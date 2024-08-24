import 'package:flutter/material.dart';
import 'package:flutter_application_2/Pages/dropD.dart';
import 'package:flutter_application_2/Pages/userguide.dart';
import 'package:flutter_application_2/widgets/appbar.dart';
import 'package:flutter_application_2/widgets/drawer.dart';

import 'feedbacks.dart';

class DashBoardHome extends StatelessWidget {
  const DashBoardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Dashboard',
        actions: [

          SizedBox(width: 16),
        ],
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _buildSingleImage(),
            const SizedBox(height: 20),
            _buildOptionButton(
              context,
              'Crop Selection',
              'assets/icons/icon_02.png', // Replace with your image path
              const DropDown(),
              0xFFD6EFD8, // Background color for the button
            ),
            _buildOptionButton(
              context,
              'User Guide',
              'assets/icons/icon_03.png', // Replace with your image path
              userGuide(), // Changed to `const` and corrected the widget name
              0xFF96B565,
            ),
            _buildOptionButton(
              context,
              'Feedbacks',
              'assets/icons/icon_04.png', // Replace with your image path
              const FeedBacks(),
              0xFF96B565,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSingleImage() {
    return Image.asset(
      'assets/New folder/Home_01.jpg', // Replace with your image path
      width: double.infinity,
      height: 300, // Adjust the height as needed
      fit: BoxFit.cover,
    );
  }

  Widget _buildOptionButton(
      BuildContext context, String title, String imagePath, Widget page, int backgroundColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, // Text and icon color
          backgroundColor: Color(backgroundColor), // Background color for the button
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage(imagePath),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



}
