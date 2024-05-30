import 'package:flutter/material.dart';

class Papaya extends StatelessWidget {
  Papaya({super.key});

  final List<Map<String, dynamic>> gridData = [
    {
      'image': 'assets/spacing.PNG',
      'text1': 'Spacing ',
      'text2': '1.8*1.8m',
      'color': const Color(0xFFD9F5C5),
    },
    {
      'image': 'assets/v2.png',
      'text1': 'Temperature',
      'text2': '21-32 C',
      'color': const Color(0xFFD9F5C5),
    },
    {
      'image': 'assets/v3.png',
      'text1': 'Germination ',
      'text2': '8-15 days',
      'color': const Color(0xFFD9F5C5),
    },
    {
      'image': 'assets/v4.png',
      'text1': 'Sprout to Harvest ',
      'text2': 'about 2 weeks',
      'color': const Color(0xFFD0EC94),
    },
    {
      'image': 'assets/phrange.jpg',
      'text1': 'Soil PH Range',
      'text2': '5.5-6.5',
      'color': const Color(0xFFD0EC94),
    },
    {
      'image': 'assets/v7.png',
      'text1': 'Water',
      'text2': ' 2 in/week',
      'color': const Color(0xFFD0EC94),
    },
    {
      'image': 'assets/v8.png',
      'text1': 'Diseases',
      'text2': 'Stem end rot',
      'color': const Color(0xFFFCDCA6),
    },
    {
      'image': 'assets/v10.png',
      'text1': 'Diseases',
      'text2': 'Powdery mildew',
      'color': const Color(0xFFFCDCA6),
    },
    {
      'image': 'assets/compost.jpeg',
      'text1': 'Manure ',
      'text2': 'organic manure',
      'color': const Color(0xFFF6A33E),
    },
    {
      'image': 'assets/nitpo.jpeg',
      'text1': 'Fertilizers',
      'text2': 'Nitrogen potash ',
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
                  'Papaya',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  'assets/papa.png',
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
