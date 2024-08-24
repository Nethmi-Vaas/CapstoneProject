import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'fruits/KingCoconut.dart';

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

  final List<Color> _colors = [
    Colors.green,
    Colors.orange,
    Colors.lightGreen,
    Colors.teal,
    Colors.blue,
    Colors.red,
    Colors.purple,
    Colors.yellow,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const SizedBox(width: 8),
            const Text(
              '',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                'Market Price Rate',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey[350],),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                          child: Text("Some error occurred: ${snapshot.error}"),
                        );
                      }
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        final selectCropTypes = snapshot.data?.docs ?? [];
                        List<CropType> cropTypeItems = selectCropTypes.map((cropType) {
                          return CropType(
                            name: cropType['C_name'] ?? "",
                            percentage: cropType['Percentage'] ?? 0,
                          );
                        }).toList();
                  
                        return Column(
                          children: [
                            SizedBox(
                              height: 250,
                              child: PieChart(
                                PieChartData(
                                  sections: getSections(cropTypeItems),
                                  centerSpaceRadius: 40,
                                  sectionsSpace: 2,
                                  borderData: FlBorderData(show: false),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            const SizedBox(height: 16),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cropTypeItems.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: InkWell(
                                    onTap: () {
                                      final String crop = cropTypeItems[index].name.toString();
                  
                                      if (crop == 'King coconut') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => KingCoco(),
                                          ),
                                        );
                                      } else if (crop == 'Crop B') {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => KingCoco(),
                                          ),
                                        );
                                      }
                                      // Add more conditions for other crops
                                    },
                                    child: ListTile(
                                      title: Text(
                                        cropTypeItems[index].name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      subtitle: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          LinearPercentIndicator(
                                            width: MediaQuery.of(context).size.width * 0.6,
                                            lineHeight: 20.0,
                                            percent: cropTypeItems[index].percentage / 100,
                                            backgroundColor: Colors.grey[300],
                                            progressColor: _colors[index % _colors.length],
                                          ),
                                          const SizedBox(width: 10),
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: Colors.green, width: 2.0),
                                            ),
                                            child: const Icon(
                                              Icons.arrow_forward,
                                              color: Colors.green,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> getSections(List<CropType> cropTypeItems) {
    return cropTypeItems.asMap().entries.map((entry) {
      int index = entry.key;
      CropType cropType = entry.value;
      return PieChartSectionData(
        value: cropType.percentage.toDouble(),
        color: _colors[index % _colors.length],
        title: '${cropType.percentage}%',
        radius: 60,
        titleStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }
}

class CropType {
  final String name;
  final int percentage;

  CropType({required this.name, required this.percentage});
}
