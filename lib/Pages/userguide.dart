import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/appbar.dart';
import 'package:flutter_application_2/widgets/drawer.dart';

class userGuide extends StatefulWidget {
  @override
  _userGuideState createState() => _userGuideState();
}

class _userGuideState extends State<userGuide> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': 'Welcome to iCrop!',
      'subtitle': 'This user guide is designed to help you make the most out of our app by providing instructions and helpful tips.',
      'image': 'assets/User_Guide/image_01.jpg',
    },
    {
      'title': 'Selecting Date and Location',
      'subtitle': 'Start by selecting the month you are interested in. Once the month is selected, choose the district where you want to check crop prices. After selecting the district, pick a specific area within that district.',
      'image': 'assets/User_Guide/image_02.jpg',
    },
    {
      'title': 'Viewing Crop Details',
      'subtitle': 'Choose a Crop: From the list of crops, click on the crop you are interested in to view detailed information.',
      'image': 'assets/User_Guide/image_03.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Users Guide',
        actions: [

          SizedBox(width: 16),
        ],
      ),
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        _pages[index]['image']!,
                        height: 250,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _pages[index]['title']!,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _pages[index]['subtitle']!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pages.length,
                  (index) => buildDot(index, context),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: _currentIndex == index ? 20 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: _currentIndex == index ? Colors.green : Colors.grey,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: userGuide(),
  ));
}
