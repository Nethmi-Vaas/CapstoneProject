import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_2/dropD.dart';
import 'package:flutter_application_2/feedbacks.dart';
import 'package:flutter_application_2/userguide.dart';

class DashBoardHome extends StatelessWidget {
  const DashBoardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {
            // Add drawer functionality if needed
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.notifications, color: Colors.black),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png', // Replace with your logo path
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 10),
            _buildCarouselSlider(),
            const SizedBox(height: 20),
            _buildOptionCard(
              context,
              'User Guide',
              'assets/user_guide_image.png', // Replace with your image
              const userGuide(),
            ),
            _buildOptionCard(
              context,
              'Crop Selection',
              'assets/crop_selection_image.png', // Replace with your image
              const DropDown(),
            ),
            _buildOptionCard(
              context,
              'Feedbacks and Suggestions',
              'assets/feedback_image.png', // Replace with your image
              const FeedBacks(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarouselSlider() {
    final List<String> imgList = [
      'assets/banner1.png', // Replace with your images
      'assets/banner2.png',
      'assets/banner3.png',
    ];

    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
      ),
      items: imgList.map((item) => Container(
        child: Center(
          child: Image.asset(item, fit: BoxFit.cover, width: 1000),
        ),
      )).toList(),
    );
  }

  Widget _buildOptionCard(
      BuildContext context, String title, String imagePath, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF8FB98B), // Adjust the color as per your design
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF6A8759),
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
