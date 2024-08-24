import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/appbar.dart';
import 'package:flutter_application_2/widgets/drawer.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Privacy Policy',
        actions: [

          SizedBox(width: 16),
        ],
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 8.0),
              const Text(
                "Privacy & Policy",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                "iCrop is committed to protecting your privacy. Our privacy policy outlines how we collect, use, and safeguard your information. This brief overview will provide you with the essential points.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Color.fromARGB(255, 18, 18, 18),
                ),
              ),
              const SizedBox(height: 20.0),
              _buildPrivacyItem(
                icon: Icons.info,
                title: "Information We Collect",
                content:
                "We collect information to provide better services to our users. This includes personal information, usage data, and other relevant details.",
              ),
              const Divider(),
              _buildPrivacyItem(
                icon: Icons.lock,
                title: "How We Use Your Information",
                content:
                "Your information is used to enhance your experience with iCrop. This includes personalizing content, improving our services, and ensuring security.",
              ),
              const Divider(),
              _buildPrivacyItem(
                icon: Icons.shield,
                title: "Your Privacy Rights",
                content:
                "You have rights regarding your personal data. These include accessing, correcting, and deleting your information. Learn more about your rights in our full privacy policy.",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPrivacyItem(
      {required IconData icon, required String title, required String content}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 30, color: Colors.black),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  content,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
