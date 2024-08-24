import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/userguide.dart';
import 'package:flutter_application_2/viewpage.dart';

import 'feedbacks.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String? selectedMonth;
  String? selectedDistrict;
  String? selectedArea;
  String? selectedCroptype;

  bool showAreaDropdown = false;
  bool showCropDropdown = false;
  bool showCropTypeDropdown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildDrawer(context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => Row(
            children: [
              IconButton(
                icon: Icon(Icons.menu, color: Colors.black),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              Image.asset(
                'assets/Logo/logo.png', // Replace with your logo path
                width: 40,
                height: 40,
              ),
            ],
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImageHeader(),
            const SizedBox(height: 20),
            _buildMonthDropdown(),
            const SizedBox(height: 20),
            _buildDistrictDropdown(),
            const SizedBox(height: 20),
            if (showAreaDropdown) _buildAreaDropdown(),
            const SizedBox(height: 20),
            if (showCropDropdown) _buildselectcroptypeDropdown(),
            const SizedBox(height: 20),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildImageHeader() {
    return Image.asset(
      'C:src\flutter_application_2assetsCrop selectionimage_04.jpg', // Replace with your image path
      width: double.infinity,
      height:50, // Adjust the height as needed
      fit: BoxFit.cover,
    );
  }

  Widget _buildMonthDropdown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Month").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Some error occurred ${snapshot.error}"),
            );
          }
          List<DropdownMenuItem<String>> monthItems = [];
          if (!snapshot.hasData) {
            return Container(
                height: 40,
                width: 40,
                child: const CircularProgressIndicator());
          } else {
            final selectMonth = snapshot.data?.docs;
            if (selectMonth != null) {
              for (var month in selectMonth) {
                monthItems.add(
                  DropdownMenuItem(
                    value: month['M_id'],
                    child: Text(
                      month['name'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              }
            }
            return _buildDropdownContainer(
              child: DropdownButton<String>(
                underline: const SizedBox(),
                isExpanded: true,
                hint: const Text(
                  "Select the Month",
                  style: TextStyle(fontSize: 18),
                ),
                value: selectedMonth,
                items: monthItems,
                onChanged: (value) {
                  setState(() {
                    selectedMonth = value;
                  });
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildDistrictDropdown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("District").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Some error occurred ${snapshot.error}"),
            );
          }
          List<DropdownMenuItem<String>> districtItems = [];
          if (!snapshot.hasData) {
            return Container(
                height: 40,
                width: 40,
                child: const CircularProgressIndicator());
          } else {
            final selectDistrict = snapshot.data?.docs;
            if (selectDistrict != null) {
              for (var district in selectDistrict) {
                districtItems.add(
                  DropdownMenuItem(
                    value: district['D_id'],
                    child: Text(
                      district['D_name'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              }
            }
            return _buildDropdownContainer(
              child: DropdownButton<String>(
                underline: const SizedBox(),
                isExpanded: true,
                hint: const Text(
                  "Select the District",
                  style: TextStyle(fontSize: 18),
                ),
                value: selectedDistrict,
                items: districtItems,
                onChanged: (value) {
                  setState(() {
                    selectedDistrict = value;
                    showAreaDropdown = true;
                  });
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildAreaDropdown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Area")
            .where("D_id", isEqualTo: selectedDistrict)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Some error occurred ${snapshot.error}"),
            );
          }
          List<DropdownMenuItem<String>> areaItems = [];
          if (!snapshot.hasData) {
            return Container(
                height: 40,
                width: 40,
                child: const CircularProgressIndicator());
          } else {
            final selectArea = snapshot.data?.docs;
            if (selectArea != null) {
              for (var area in selectArea) {
                areaItems.add(
                  DropdownMenuItem(
                    value: area['A_id'],
                    child: Text(
                      area['A_name'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              }
            }
            return _buildDropdownContainer(
              child: DropdownButton<String>(
                underline: const SizedBox(),
                isExpanded: true,
                hint: const Text(
                  "Select the Area",
                  style: TextStyle(fontSize: 18),
                ),
                value: selectedArea,
                items: areaItems,
                onChanged: (value) {
                  setState(() {
                    selectedArea = value;
                    showCropDropdown = true;
                  });
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildselectcroptypeDropdown() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("Crop_Type").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Some error occurred ${snapshot.error}"),
            );
          }
          List<DropdownMenuItem<String>> areaItems = [];
          if (!snapshot.hasData) {
            return Container(
                height: 40,
                width: 40,
                child: const CircularProgressIndicator());
          } else {
            final selectcroptype = snapshot.data?.docs;
            if (selectcroptype != null) {
              for (var area in selectcroptype) {
                areaItems.add(
                  DropdownMenuItem(
                    value: area['CT_id'],
                    child: Text(
                      area['CT_name'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              }
            }
            return _buildDropdownContainer(
              child: DropdownButton<String>(
                underline: const SizedBox(),
                isExpanded: true,
                hint: const Text(
                  "Select the Crop Type",
                  style: TextStyle(fontSize: 18),
                ),
                value: selectedCroptype,
                items: areaItems,
                onChanged: (value) {
                  setState(() {
                    selectedCroptype = value;
                    showCropTypeDropdown = true;
                  });
                },
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildDropdownContainer({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          if (selectedMonth != null &&
              selectedDistrict != null &&
              selectedArea != null &&
              selectedCroptype != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ViewPage(
                    selectedMonth: '$selectedMonth',
                    selectedDistrict: '$selectedDistrict',
                    selectedArea: '$selectedArea',
                    selectedCroptype: '$selectedCroptype',
                  )),
            );
          } else {
            print('Please select all options');
          }
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF1A5319)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 9.0),
          child: const Text(
            'Submit',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Image.asset(
              'assets/Logo/logo.png', // Replace with your logo path
              width: 100,
              height: 100,
            ),
          ),
          _buildDrawerItem(context, Icons.home, 'Home', () {
            Navigator.pop(context);
          }),
          _buildDrawerItem(context, Icons.grass, 'Crop Selection', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DropDown()));
          }),
          _buildDrawerItem(context, Icons.book, 'User Guide', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => userGuide()));
          }),
          _buildDrawerItem(context, Icons.feedback, 'Feedback and Suggestions',
                  () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const FeedBacks()));
              }),
          _buildDrawerItem(context, Icons.privacy_tip, 'Privacy Policy', () {
            // Implement Privacy Policy page navigation
          }),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title,
      VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      onTap: onTap,
    );
  }
}
