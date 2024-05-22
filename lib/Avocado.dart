import 'package:flutter/material.dart';

class Avocado extends StatelessWidget {
  Avocado({super.key});

  final List<Map<String, dynamic>> gridData = [
    {
      'image': 'assets/spacing.PNG',
      'text1': 'Spacing ',
      'text2': '8*8m',
      'color': const Color(0xFFD9F5C5),
    },
    {
      'image': 'assets/v2.png',
      'text1': 'Temperature',
      'text2': '180-250C',
      'color': const Color(0xFFD9F5C5),
    },
    {
      'image': 'assets/v3.png',
      'text1': 'Germination ',
      'text2': '6-8 weeks',
      'color': const Color(0xFFD9F5C5),
    },
    {
      'image': 'assets/v4.png',
      'text1': 'Sprout to Harvest ',
      'text2': '4-6 weeks',
      'color': const Color(0xFFD0EC94),
    },
    {
      'image': 'assets/phrange.jpg',
      'text1': 'Soil PH Range',
      'text2': '5 - 7',
      'color': const Color(0xFFD0EC94),
    },
    {
      'image': 'assets/v7.png',
      'text1': 'Water',
      'text2': '2 gallons',
      'color': const Color(0xFFD0EC94),
    },
    {
      'image': 'assets/rootrot.jpeg',
      'text1': 'Diseases',
      'text2': 'Root rot',
      'color': const Color(0xFFFCDCA6),
    },
    {
      'image': 'assets/canker.jpeg',
      'text1': 'Diseases ',
      'text2': 'Canker',
      'color': const Color(0xFFFCDCA6),
    },
    {
      'image': 'assets/scab.jpeg',
      'text1': 'Diseases',
      'text2': 'Scab',
      'color': const Color(0xFFFCDCA6),
    },
    {
      'image': 'assets/Citrus-Fertilizer.jpg',
      'text1': 'Fertilizers',
      'text2': 'Citrus tree ',
      'color': const Color(0xFFF6A33E),
    },
    {
      'image': 'assets/chickenM.jpeg',
      'text1': 'Manure',
      'text2': 'Chicken manure',
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
            height: 70,
            width: 600,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Avocado',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/avo1.png',
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
