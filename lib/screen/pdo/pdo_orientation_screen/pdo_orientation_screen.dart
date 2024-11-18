import 'package:bmet_ui/screen/pdo/date_selection/date_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../res/colors/app_colors.dart';

class PdoOrientationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.grey.shade200,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'প্রি-ডিপারচার ওরিয়েন্টেশন',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.lightbulb),
          ),
        ],
      ),
      body: Column(
        children: [
          // Main Content
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(bottom: 80),
              // Add bottom padding for button
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      'বাধ্যতামূলক প্রি-ডিপার্চার ওরিয়েন্টেশন (পিডিও) ট্রেনিংয়ে রেজিস্ট্রেশন করুন',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset(
                    'assets/images/pdo_home.png',
                    // Replace with your image asset path
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                SizedBox(height: 16),
                _buildInfoCardWithSteps(
                  steps: [
                    {
                      "text":
                          'আমি প্রবাসীর মাধ্যমে পছন্দের পিডিও সেশন বুক করুন',
                      "icon": FontAwesomeIcons.book,
                    },
                    {
                      "text":
                          'আপনার পছন্দসই তারিখ, সময় এবং টেকনিক্যাল ট্রেনিং সেন্টার (টিটিসি) নির্বাচন করুন',
                      "icon": FontAwesomeIcons.calendar,
                    },
                    {
                      "text":
                          'পেমেন্ট সম্পন্ন করবার পর আপনি QR Code সম্বলিত এনরোলমেন্ট কার্ড পাবেন',
                      "icon": FontAwesomeIcons.qrcode,
                    },
                    {
                      "text": 'এনরোলমেন্ট কার্ড সাথে নিয়ে আপনার সেশনে যান',
                      "icon": FontAwesomeIcons.idCard,
                    },
                    {
                      "text":
                          'সফল ভাবে ট্রেনিং শেষ করে QR Code সম্বলিত সার্টিফিকেট গ্রহণ করুন',
                      "icon": FontAwesomeIcons.receipt,
                    },
                    {
                      "text": 'এবার ফ্লাইটের প্রস্তুতি নিন!',
                      "icon": FontAwesomeIcons.plane,
                    },
                  ],
                ),
              ],
            ),
          ),
          // Persistent Bottom Button
          Container(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DateSelectionScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.tealColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Center(
                child: Text(
                  'শুরু করুন',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required List<Map<String, dynamic>> descriptionList,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      shadowColor: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...descriptionList.map((item) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(item["icon"], size: 28, color: AppColor.tealColor),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          item["text"],
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade700),
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey.shade300),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCardWithSteps({
    required List<Map<String, dynamic>> steps,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      shadowColor: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              thickness: 1,
              color: Colors.grey.shade300,
            ),
            SizedBox(height: 10),
            ...steps.map((step) {
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(step["icon"], size: 28, color: AppColor.tealColor),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          step["text"],
                          style: TextStyle(
                              fontSize: 14, color: Colors.grey.shade700),
                        ),
                      ),
                    ],
                  ),
                  Divider(color: Colors.grey.shade300),
                ],
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
