import 'package:flutter/material.dart';

class Brinjal extends StatelessWidget {
  Brinjal({super.key});

  final List<Map<String, dynamic>> gridData = [
    {
      'image': 'assets/Details/image_05.jpg',
      'text1': 'Spacing ',
      'text2': '1/Square',
      'color': Colors.white,
    },
    {
      'image': 'assets/Details/v2.png',
      'text1': 'Temperature',
      'text2': '13-21C',
      'color': Colors.white,
    },
    {
      'image': 'assets/Details/v3.png',
      'text1': 'Germination ',
      'text2': '7-14 days',
      'color': Colors.white,
    },
    {
      'image': 'assets/Details/v4.png',
      'text1': 'Sprout to Harvest ',
      'text2': '75-90 days',
      'color': Colors.white,
    },
    {
      'image': 'assets/Details/phrange.jpg',
      'text1': 'Soil PH Range',
      'text2': '5.5-5.8',
      'color': Colors.white,
    },
    {
      'image': 'assets/Details/v7.png',
      'text1': 'Water',
      'text2': ' 1 in/week',
      'color': Colors.white,
    },
    {
      'image': 'assets/Details/phomopsisblight.jpg',
      'text1': 'Diseases',
      'text2': 'PhomopsisBlight',
      'color': Colors.white,
    },
    {
      'image': 'assets/Details/leafspot.jpg',
      'text1': 'Diseases ',
      'text2': 'LeafSpot',
      'color': Colors.white,
    },
    {
      'image': 'assets/Details/alternaria_.jpg',
      'text1': 'Diseases',
      'text2': 'Alternaria',
      'color': Colors.white,
    },
    {
      'image': 'assets/Details/TSP.jpg',
      'text1': 'Fertilizers',
      'text2': 'Tsp ',
      'color': Colors.white,
    },
    {
      'image': 'assets/Details/cattlecompost.jpg',
      'text1': 'Manure',
      'text2': 'Cattle Compost',
      'color': Colors.white,
    },
    {
      'image': 'assets/Details/v11.png',
      'text1': 'Fertilizers',
      'text2': 'Urea',
      'color': Colors.white,
    },
  ];
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        ),
          body: Column(children:[
          Container(
            height: 80,
            color: Color.fromRGBO(36, 77, 55, 1),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    const SizedBox(width: 10),
                    const Text(
                      'Brinjal',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset('assets/Details/Brinjal.png', width: 70, height: 70),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
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
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 60,
              height: 60,
              alignment: Alignment.center,
            ),
            const SizedBox(height: 8),
            Text(
              text1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              text2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
