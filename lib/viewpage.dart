import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
                child: Text("Some error occurred ${snapshot.error}"),
              );
            }
            if (!snapshot.hasData) {
              return Container(
                height: 25,
                width: 25,
                child: Center(
                  child: const CircularProgressIndicator(),
                ),
              );
            } else {
              final selectCropTypes = snapshot.data?.docs ?? [];
              List<CropType> cropTypeItems = selectCropTypes.map((cropType) {
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
                    child: Container(
                      height: 100,
                      color: Colors.white,
                      child: ListTile(
                        title: Text(cropTypeItems[index].name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LinearPercentIndicator(
                              width: 140.0,
                              lineHeight: 14.0,
                              percent: cropTypeItems[index].percentage / 100,
                              backgroundColor: Colors.grey,
                              progressColor: Colors.blue,
                            ),
                            Text("Percentage: ${cropTypeItems[index].percentage}%"),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            selectedCrop = cropTypeItems[index].name;
                          });
                        },
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class CropType {
  final String name;
  final int percentage;

  CropType({required this.name, required this.percentage});
}
