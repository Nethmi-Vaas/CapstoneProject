import 'package:flutter/material.dart';
import 'package:flutter_application_2/dropD.dart';
import 'package:flutter_application_2/feedbacks.dart';
import 'package:flutter_application_2/userguide.dart';

class DashBoardHome extends StatelessWidget {
  const DashBoardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              Image.asset(
                'assets/Logo/logo.png', // Replace with your logo path
                width: 40,
                height: 30,
              ),
            ],
          ),
        ),
        actions: [

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _buildSingleImage(), // Replaces the carousel slider with a single image
            const SizedBox(height: 20),
            _buildOptionButton(
              context,
              'Crop Selection',
              'assets/crop_selection_image.png', // Replace with your image path
              const DropDown(),
            ),
            _buildOptionButton(
              context,
              'User Guide',
              'assets/user_guide_image.png', // Replace with your image path
               userGuide(),
            ),
            _buildOptionButton(
              context,
              'Feedback',
              'assets/feedback_image.png', // Replace with your image path
              const FeedBacks(),
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
      height: 400, // Adjust the height as needed
      fit: BoxFit.cover,
    );
  }

  Widget _buildOptionButton(
      BuildContext context, String title, String imagePath, Widget page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black, backgroundColor: Color(0xFFE4F5E1), // Text and icon color
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
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: TextStyle(
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

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Image.asset(
              'assets/Logo/logo.png', // Replace with your logo path
              width: 100,
              height: 100,
            ),
          ),
          _buildDrawerItem(context, Icons.home, 'Home', () {
            Navigator.pop(context);
          }),
          _buildDrawerItem(context, Icons.grass, 'Crop Selection', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DropDown()));
          }),
          _buildDrawerItem(context, Icons.book, 'User Guide', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  userGuide()));
          }),
          _buildDrawerItem(context, Icons.feedback, 'Feedback and Suggestions',
                  () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FeedBacks()));
              }),
          _buildDrawerItem(context, Icons.privacy_tip, 'Privacy Policy', () {
            // Implement Privacy Policy page navigation
          }),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title,
      VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      onTap: onTap,
    );
  }
}
