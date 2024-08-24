import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FeedBacks extends StatefulWidget {
  const FeedBacks({Key? key});

  @override
  _FeedBacksState createState() => _FeedBacksState();
}

class _FeedBacksState extends State<FeedBacks> {
  int selectedIndex = -1;
  TextEditingController nameController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();
  bool isSubmitting = false;

  void handleCheckItemSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<void> submitFeedback() async {
    if (nameController.text.isEmpty || feedbackController.text.isEmpty) {
      // Handle input validation
      return;
    }
    setState(() {
      isSubmitting = true;
    });

    try {
      // Initialize Firebase if not already initialized
      await Firebase.initializeApp();
      // Add feedback to Firestore
      await FirebaseFirestore.instance.collection('feedbacks').add({
        'name': nameController.text,
        'feedback': feedbackController.text,
        'type': selectedIndex == 0
            ? 'Crops Selection'
            : selectedIndex == 1
            ? 'Price Rates'
            : 'Performances of the Application',
        'timestamp': DateTime.now(),
      });
      // Reset form
      nameController.clear();
      feedbackController.clear();
      setState(() {
        selectedIndex = -1;
        isSubmitting = false;
      });
      // Show confirmation dialog
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Feedback Submitted'),
          content: const Text('Thank you for your feedback!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      // Handle errors
      print('Error submitting feedback: $e');
      setState(() {
        isSubmitting = false;
      });
    }
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
            activeColor: const Color(0xFF1A5319),
          ),
          const SizedBox(width: 10.0),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () {},
        ),
        title: Image.asset(
          'assets/Logo/logo.png', // Replace with your logo path
          height: 40,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 8.0),
              const Text(
                "Please Select the type of Feedback.",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 15.0),
              buildCheckItem("Crops Selection", 0),
              buildCheckItem("Price Rates", 1),
              buildCheckItem("Performances of the Application", 2),
              const SizedBox(height: 20.0),
              selectedIndex != -1 ? buildFeedbackForm() : Container(),
            ],
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
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Enter your Name here',
              hintStyle: TextStyle(color: Colors.grey.shade600),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              filled: true,
              fillColor: Colors.white,
            ),
            maxLines: 1,
          ),
          const SizedBox(height: 8.0),
          TextFormField(
            controller: feedbackController,
            decoration: InputDecoration(
              hintText: 'Enter your feedback here',
              hintStyle: TextStyle(color: Colors.grey.shade600),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              filled: true,
              fillColor: Colors.white,
            ),
            maxLines: 3,
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: isSubmitting ? null : submitFeedback,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1A5319), // Button color
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 120.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: isSubmitting
                ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
                : const Text(
              'Submit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
