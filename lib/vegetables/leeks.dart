// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class leeks extends StatelessWidget {
  leeks({super.key});

  final List<Map<String, dynamic>> gridData = [
    {
      'image': 'assets/Details/image_05.jpg',
      'text1': 'Spacing ',
      'text2': '4/Square',
      'color': const Color(0xFFD9F5C5),
    },
    {
      'image': 'assets/Details/v2.png',
      'text1': 'Temperature',
      'text2': '20 - 25 C',
      'color': const Color(0xFFD9F5C5),
    },
    {
      'image': 'assets/Details/v3.png',
      'text1': 'Germination ',
      'text2': '10 - 14 days',
      'color': const Color(0xFFD9F5C5),
    },
    {
      'image': 'assets/Details/v4.png',
      'text1': 'Sprout to Harvest ',
      'text2': '120 - 170 days ',
      'color': const Color(0xFFD0EC94),
    },
    {
      'image': 'assets/Details/phrange.jpg',
      'text1': 'Soil PH Range',
      'text2': '5.6-7.5',
      'color': const Color(0xFFD0EC94),
    },
    {
      'image': 'assets/Details/v7.png',
      'text1': 'Water',
      'text2': ' 1 in/week',
      'color': const Color(0xFFD0EC94),
    },
    {
      'image': 'assets/Details/whiterot.jpeg',
      'text1': 'Diseases',
      'text2': 'White rot',
      'color': const Color(0xFFFCDCA6),
    },
    {
      'image': 'assets/rust.jpeg',
      'text1': 'Diseases ',
      'text2': 'Rust',
      'color': const Color(0xFFFCDCA6),
    },
    {
      'image': 'assets/Details/v11.png',
      'text1': 'Manure ',
      'text2': 'Urea',
      'color': const Color(0xFFF6A33E),
    },
    {
      'image': 'assets/Details/pro.jpeg',
      'text1': 'Fertilizers',
      'text2': 'Profenophos ',
      'color': const Color(0xFFF6A33E),
    },
  ];

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
      body: Column(
        children: [
          Container(
            color: const Color(0xFF66B68B),
            height: 70,
            width: 600,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Leeks',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/Details/leeks.png',
                  width: 100,
                  height: 100,
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              children: List.generate(gridData.length, (index) {
                return GridItem(
                  image: gridData[index]['image'],
                  text1: gridData[index]['text1'],
                  text2: gridData[index]['text2'],
                  color: gridData[index]['color'],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  final String image;
  final String text1;
  final String text2;
  final Color color;

  const GridItem({
    super.key,
    required this.image,
    required this.text1,
    required this.text2,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
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
          Text(
            text1,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            text2,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Image.asset(
            image,
            width: 60,
            height: 60,
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
