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
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xFF16764B), Color(0xFFF8B23C)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 8.0),
            const Text("How to use ?",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25)),
            const SizedBox(height: 10.0),
            const Text(
              "Welcome to iCrop! This user guide is designed to help you make the most out of our app by providing instructions and helpful tips.Thank you for trusting us with your privacy.",
              textAlign: TextAlign.justify,
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const SizedBox(height: 2.0),
            const Text(
              " *First select a month, a district, an area and also a type of crops that you want to cultivate.",
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 2.0),
            const Text(
              " *After submitting this, you can see the higher price rates of the crops in that selected month and the particular area.",
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 2.0),
            const Text(
              " *After clicking one of those crops, you can see temperature, diseases, fertilizers and some valuable information of that crop.By checking one by one, you can select the best option that is suitable to cultivate. ",
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 2.0),
            const Text(
                " *Further, you can enter your feedbacks and suggestions for improving iCrop.",
                textAlign: TextAlign.justify),
            const SizedBox(height: 40.0),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyPolicy()),
                );
              },
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: const LinearGradient(
                      colors: [Color(0xFF16764B), Color(0xFFF8B23C)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: const Border(
                      left: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                    ),
                  ),
                  height: 120,
                  width: 300,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      Text("Terms of Use & Privacy Policy",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      SizedBox(height: 10.0),
                      Text(
                          "Review our terms of use and privacy policy to understand how we collect, use, and protect your data.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                          )),
                      SizedBox(height: 10.0),
                      Text(
                        "More...",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
