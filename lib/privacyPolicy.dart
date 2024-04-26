import 'package:flutter/material.dart';

// ignore: camel_case_types
class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF16764B), Color(0xFFF8B23C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 1, 50, 0.1),
            child: Row(
              children: [
                Image.asset(
                  'assets/applogo.png',
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img_removal_6.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 8.0),
                Text("Privacy Policy",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25)),
                SizedBox(height: 10.0),
                Text(
                  " We value your privacy and are committed to protecting your personal information. This Privacy Policy outlines how we collect, use, and safeguard any information you provide while using our application.",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Color.fromARGB(255, 18, 18, 18),
                    fontFamily: 'JosefinSans',
                  ),
                ),
                SizedBox(height: 10.0),
                Text(" Information Collection:",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Text(
                    " We do not collect any personal information from users of our application. We do not require users to create accounts or provide any personal data.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black)),
                SizedBox(height: 10.0),
                Text("  Information Usage:",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Text(
                    " Since we do not collect any personal information, we do not use it for any purpose.Our application is designed to provide farmers with actionable insights and information related to crop selection, market prices, and other agricultural factors without the need for user data.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black)),
                SizedBox(height: 10.0),
                Text("  Changes to Privacy Policy:",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                Text(
                    " We reserve the right to update or modify this Privacy Policy at any time. Any changes will be effective immediately upon posting the updated Privacy Policy  within the application.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black)),
                SizedBox(height: 20.0),
                Text(
                    "  By using our application, you agree to the terms outlined in this Privacy Policy. If you have any questions or concerns about our Privacy Policy, please contact us at icrop@gmail.com. Thank you for trusting us with your privacy.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black)),
                SizedBox(height: 110.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
