import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DropDownExampleState createState() => _DropDownExampleState();
}

class _DropDownExampleState extends State<DropDown> {
  String selectedValue1 = 'Option 1';
  String selectedValue2 = 'Option A';
  String selectedValue3 = 'Choice 1';

  List<String> options1 = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  List<String> options2 = ['Option A', 'Option B', 'Option C', 'Option D'];
  List<String> options3 = ['Choice 1', 'Choice 2', 'Choice 3', 'Choice 4'];

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
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img_removal_6.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50),
            DropdownButton<String>(
              value: selectedValue1,
              onChanged: (newValue) {
                setState(() {
                  selectedValue1 = newValue!;
                });
              },
              items: options1.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 50),
            DropdownButton<String>(
              value: selectedValue2,
              onChanged: (newValue) {
                setState(() {
                  selectedValue2 = newValue!;
                });
              },
              style: const TextStyle(color: Colors.green),
              items: options2.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 50),
            DropdownButton<String>(
              value: selectedValue3,
              onChanged: (newValue) {
                setState(() {
                  selectedValue3 = newValue!;
                });
              },
              items: options3.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 70.0),
            SizedBox(
              height: 50.0, 
              width: 500.0, 
              child: ElevatedButton(
                onPressed: () {
                  //submit
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
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF16764B),
                        Color(0xFFF8B23C)
                      ], 
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: const Center(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
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
            )
          ],
        ),
      ),
    );
  }
}
