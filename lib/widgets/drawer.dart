import 'package:flutter/material.dart';

import '../Pages/dropD.dart';
import '../Pages/feedbacks.dart';
import '../Pages/privacyPolicy.dart';
import '../Pages/userguide.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
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
          _buildDrawerItem(context, Icons.feedback, 'Feedback and Suggestions', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const FeedBacks()));
          }),
          _buildDrawerItem(context, Icons.privacy_tip, 'Privacy Policy', () {
            // Implement Privacy Policy page navigation
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const PrivacyPolicy()));
            //PrivacyPolicy
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
