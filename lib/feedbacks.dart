import 'package:flutter/material.dart';

class FeedBacks extends StatefulWidget {
  const FeedBacks({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FeedBacksState createState() => _FeedBacksState();
}

class _FeedBacksState extends State<FeedBacks> {
  int selectedIndex = -1;

  void handleCheckItemSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget buildCheckItem(String title, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Row(
        children: [
          Radio<int>(
            value: index,
            groupValue: selectedIndex,
            onChanged: (value) => handleCheckItemSelection(value!),
            activeColor: const Color(0xFF16764B),
          ),
          const SizedBox(width: 10.0),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ],
      ),
    );
  }

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
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(''),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 8.0),
                const Text(
                  "Feedbacks and Suggestions",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  "Please Select the type of feedback",
                  style: TextStyle(color: Color(0xffc5c5c5)),
                ),
                const SizedBox(height: 10.0),
                buildCheckItem("Crops Selection", 0),
                buildCheckItem("Price Rates", 1),
                buildCheckItem("Performances of the Application", 2),
                const SizedBox(height: 10.0),
                selectedIndex != -1 ? buildFeedbackForm() : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFeedbackForm() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Feedbacks Form:',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your Name here',
              border: OutlineInputBorder(),
            ),
            maxLines: 1,
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your feedback here',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {},
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
                    Color(0xFFF8B23C),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: const Center(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
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
        ],
      ),
    );
  }
}
