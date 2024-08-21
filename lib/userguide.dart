import 'package:flutter/material.dart';
import 'package:flutter_application_2/privacyPolicy.dart';

// ignore: camel_case_types
class userGuide extends StatelessWidget {
  const userGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 1, 50, 0.1),
            child: Row(
              children: [
                Image.asset(
                  'assets/logo.png',
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 8.0),
                  const Text(
                    "How to use ?",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/help_icon.png', // Your icon image
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: const Text(
                          "Welcome to iCrop! This user guide is designed to help you make the most out of our app by providing instructions and helpful tips.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Image.asset(
                        'assets/calendar_icon.png', // Your icon image
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            const Divider(color: Colors.black),
            const SizedBox(height: 20.0),
            _buildStep(context, "1", "Step 01", "First select a month and then a District and an area."),
            _buildStep(context, "2", "Step 02", "After submitting this, you can see the higher price rates of the crops in that selected month."),
            _buildStep(context, "3", "Step 03", "After clicking one of those crops, you can see temperature, diseases, fertilizers and some valuable information of that crop."),
            _buildStep(context, "4", "Step 04", "Further, you can enter your feedbacks and suggestions for improving iCrop."),
          ],
        ),
      ),
    );
  }

  Widget _buildStep(BuildContext context, String number, String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: const Color(0xFF5A8A4D),
            radius: 20,
            child: Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Text(
                  description,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
