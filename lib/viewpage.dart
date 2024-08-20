import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Avocado.dart';
import 'package:flutter_application_2/Brinjal.dart';
import 'package:flutter_application_2/Cabbage.dart';
import 'package:flutter_application_2/Carrots.dart';
import 'package:flutter_application_2/Cowpea.dart';
import 'package:flutter_application_2/Gchillie.dart';
import 'package:flutter_application_2/Grapes.dart';
import 'package:flutter_application_2/GreenGram.dart';
import 'package:flutter_application_2/KingCoconut.dart';
import 'package:flutter_application_2/Papaya.dart';
import 'package:flutter_application_2/Pineapple.dart';
import 'package:flutter_application_2/Potatoes.dart';
import 'package:flutter_application_2/Pumpkin.dart';
import 'package:flutter_application_2/leeks.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({
    super.key,
    required this.selectedMonth,
    required this.selectedDistrict,
    required this.selectedArea,
    required this.selectedCroptype,
  });

  final String selectedMonth;
  final String selectedDistrict;
  final String selectedArea;
  final String selectedCroptype;

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {
  late String selectedMonth = widget.selectedMonth;
  late String selectedDistrict = widget.selectedDistrict;
  late String selectedArea = widget.selectedArea;
  late String selectedCroptype = widget.selectedCroptype;
  String? selectedCrop;

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
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [

                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Market Price Rates',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Crops List',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("Area_crop_month")
                            .where("M_id", isEqualTo: selectedMonth)
                            .where("A_id", isEqualTo: selectedArea)
                            .where("CT_id", isEqualTo: selectedCroptype)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                  "Some error occurred: ${snapshot.error}"),
                            );
                          }
                          if (!snapshot.hasData) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            final selectCropTypes = snapshot.data?.docs ?? [];
                            List<CropType> cropTypeItems =
                                selectCropTypes.map((cropType) {
                              return CropType(
                                name: cropType['C_name'] ?? "",
                                percentage: cropType['Percentage'] ?? 0,
                              );
                            }).toList();

                            return ListView.builder(
                              padding: const EdgeInsets.all(10.0),
                              itemCount: cropTypeItems.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        final String crop = cropTypeItems[index]
                                            .name
                                            .toString();
                                        print("Selected crop: $crop");

                                        // Navigation based on selected crop
                                        if (crop == "Leeks") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => leeks()),
                                          );
                                        } else if (crop == "Carrot") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Carrot()),
                                          );
                                        } else if (crop == "Cabbage") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Cabbage()),
                                          );
                                        } else if (crop == "Green chilli") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Gchillie()),
                                          );
                                        } else if (crop == "Potato") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Potato()),
                                          );
                                        } else if (crop == "Avocado") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Avocado()),
                                          );
                                        } else if (crop == "Brinjal") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Brinjal()),
                                          );
                                        } else if (crop == "Cowpea") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Cowpea()),
                                          );
                                        } else if (crop == "Grapes") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Grapes()),
                                          );
                                        } else if (crop == "Graphes") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Grapes()),
                                          );
                                        } else if (crop == "Green Gram") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    GreenGram()),
                                          );
                                        } else if (crop == "King coconut") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    KingCoco()),
                                          );
                                        } else if (crop == "Papaya") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Papaya()),
                                          );
                                        } else if (crop == "Pineapple") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Pineapple()),
                                          );
                                        } else if (crop == "Pumpkin") {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Pumpkin()),
                                          );
                                        } else {
                                          print("Unknown crop selected: $crop");
                                        }
                                      },
                                      child: ListTile(
                                        title: Text(cropTypeItems[index].name),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                LinearPercentIndicator(
                                                  width: 120.0,
                                                  lineHeight: 20.0,
                                                  percent: cropTypeItems[index]
                                                          .percentage /
                                                      100,
                                                  backgroundColor: Colors.grey,
                                                  progressColor:
                                                      const Color(0xFF16764B),
                                                ),
                                                const SizedBox(width: 5),
                                                Image.asset(
                                                  'assets/arrow.png',
                                                  width: 25,
                                                  height: 20,
                                                  fit: BoxFit.cover,
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 5),
                                          ],
                                        ),
                                      ),
                                    ));
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class CropType {
  final String name;
  final int percentage;

  CropType({required this.name, required this.percentage});
}
