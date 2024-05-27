import 'package:flutter/material.dart';
import 'package:flutter_application_2/dropD.dart';
import 'package:flutter_application_2/feedbacks.dart';
import 'package:flutter_application_2/userguide.dart';

// ignore: camel_case_types
class dashBoard extends StatelessWidget {
  const dashBoard({super.key});

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
              padding: const EdgeInsets.fromLTRB(25, 1, 50, 0.1),
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
        body: Container(
            width: 600,
            height: MediaQuery.of(context).size.height, // This is New Chanege
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/bg.jpg'), 
                fit: BoxFit.cover, 
              ),
            ),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(110, 40, 100, 10),
                child: Column(children: <Widget>[
                  const SizedBox(height: 0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const userGuide()),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAB03E),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            spreadRadius: -2,
                            blurRadius: 4,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/img_1355174_1.png',
                            width: 100,
                            height: 100,
                            alignment: Alignment.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'User Guide',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //box2
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DropDown()),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAB03E),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            spreadRadius: -2,
                            blurRadius: 4,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/crops.png',
                            width: 100,
                            height: 100,
                            alignment: Alignment.center,
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          const Text(
                            'Crop Selection',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //box3
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FeedBacks()),
                      );
                    },
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAB03E),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            spreadRadius: -2,
                            blurRadius: 4,
                            offset: const Offset(0, -2),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/img_feedback_1.png',
                            width: 90,
                            height: 90,
                            alignment: Alignment.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Feedbacks & Suggestions',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]))));
  }
}
