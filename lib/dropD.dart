import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/viewpage.dart';

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
  String? selectedCrop;

  bool showAreaDropdown = false;
  bool showCropDropdown = false;
  bool showCropTypeDropdown = false;

  List<String> fetchedData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 1, 50, 0.1),
              child: Row(
                children: [
                  Image.asset(
                    'assets/logo.png',
                    alignment: Alignment.topLeft,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 50),
              _buildMonthDropdown(),
              const SizedBox(height: 20),
              _buildDistrictDropdown(),
              const SizedBox(height: 20),
              if (showAreaDropdown) _buildAreaDropdown(),
              const SizedBox(height: 20),
              if (showCropDropdown) _buildselectcroptypeDropdown(),
              const SizedBox(height: 10),
              ElevatedButton(
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
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.green
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (fetchedData.isNotEmpty) _buildFetchedDataList(),
            ],
          ),
        ));
  }

  Widget _buildMonthDropdown() {
    return StreamBuilder<QuerySnapshot>(
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
                  ),
                ),
              );
            }
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButton<String>(
                underline: const SizedBox(),
                isExpanded: true,
                hint: const Text(
                  "Select the Month",
                  style: TextStyle(fontSize: 20),
                ),
                value: selectedMonth,
                items: monthItems,
                onChanged: (value) {
                  setState(() {
                    selectedMonth = value;
                  });
                },
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildDistrictDropdown() {
    return StreamBuilder<QuerySnapshot>(
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
                  ),
                ),
              );
            }
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButton<String>(
                underline: const SizedBox(),
                isExpanded: true,
                hint: const Text(
                  "Select the District",
                  style: TextStyle(fontSize: 20),
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
            ),
          );
        }
      },
    );
  }

  Widget _buildAreaDropdown() {
    return StreamBuilder<QuerySnapshot>(
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
                  ),
                ),
              );
            }
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButton<String>(
                underline: const SizedBox(),
                isExpanded: true,
                hint: const Text(
                  "Select the Area",
                  style: TextStyle(fontSize: 20),
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
            ),
          );
        }
      },
    );
  }

  Widget _buildselectcroptypeDropdown() {
    return StreamBuilder<QuerySnapshot>(
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
                  ),
                ),
              );
            }
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButton<String>(
                underline: const SizedBox(),
                isExpanded: true,
                hint: const Text(
                  "Select the Crop Type",
                  style: TextStyle(fontSize: 20),
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
            ),
          );
        }
      },
    );
  }

  Widget _buildFetchedDataList() {
    return Expanded(
      child: ListView.builder(
        itemCount: fetchedData.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(fetchedData[index]),
          );
        },
      ),
    );
  }

  void fetchDataFromFirestore(
      String month, String district, String area, String cropType) {
    FirebaseFirestore.instance
        .collection("Month")
        .doc(month)
        .collection("District")
        .doc(district)
        .collection("Area")
        .doc(area)
        .collection("CropType")
        .get()
        .then((QuerySnapshot querySnapshot) {
      setState(() {
        fetchedData.clear();
        for (var doc in querySnapshot.docs) {
          fetchedData.add(doc['C1']); // C1 - field name
          fetchedData.add(doc['C2']);
          fetchedData.add(doc['C3']);
          fetchedData.add(doc['C4']);
          fetchedData.add(doc['C5']);
        }
      });
    });
  }
}
