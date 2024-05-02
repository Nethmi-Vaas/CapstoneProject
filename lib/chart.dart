import 'package:flutter/material.dart';

// ignore: camel_case_types
class chart extends StatelessWidget {
  const chart({super.key});
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
            padding: const EdgeInsets.fromLTRB(1, 5, 10, 5),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back),
                ),
                Image.asset(
                  'assets/applogo.png',
                  scale: 0.7,
                  width: 300,
                  height: 300,
                  alignment: Alignment.topLeft,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF66B68B),
            height: 50,
            width: 600,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Action when the first text is clicked
                    },
                    child: const Text(
                      'Vegetables',
                      style: TextStyle(
                        color: Colors.white, // Change the color of the text
                        fontSize: 18, // Change the size of the text
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Action when the second text is clicked
                    },
                    child: const Text(
                      'Fruits',
                      style: TextStyle(
                        color: Colors.white, // Change the color of the text
                        fontSize: 18, // Change the size of the text
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Action when the third text is clicked
                    },
                    child: const Text(
                      'Grains',
                      style: TextStyle(
                        color: Colors.white, // Change the color of the text
                        fontSize: 18, // Change the size of the text
                      ),
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
