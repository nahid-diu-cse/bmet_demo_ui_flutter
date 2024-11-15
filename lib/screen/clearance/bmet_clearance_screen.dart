import 'package:bmet_ui/screen/mandatory/mandatory_screen.dart';
import 'package:flutter/material.dart';

import '../../res/colors/app_colors.dart';

class BmetClearanceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'বিএমইটি ক্রিয়াকলাপ',
              style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Main Content
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(bottom: 80), // Add bottom padding for button
              children: [
                const Center(
                  child: Text(
                    'Apply for Airport emigration clearance',
                    style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/images/clearance_init_image.JPG', // Replace with your image asset path
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
                _buildInfoCard(
                  title: 'অনলাইন ইমিগ্রেশন ক্রিয়াকলাপ',
                  descriptionList: [
                    {
                      "text":
                      'আপনি এখন আমি প্রবাসীর মাধ্যমে ওয়ান-স্টপ বিএমইটি ক্লিয়ারেন্সের জন্য আবেদন করে QR-code ভিত্তিক বিএমইটি স্মার্ট কার্ডটি পেতে পারেন।',
                      "icon": Icons.description_outlined,
                    },
                    {
                      "text":
                      'আপনি যদি কোনো রিক্রুটিং এজেন্সির সহায়তা ছাড়াই আপনার ভিসা অর্জন করেন তবে আপনার BMET ক্লিয়ারেন্সের জন্য আবেদন করা উচিত।',
                      "icon": Icons.description_outlined,
                    },
                  ],
                ),
                SizedBox(height: 16),
                _buildInfoCardWithSteps(
                  title: 'কিভাবে আবেদন করতে হবে',
                  steps: [
                    {
                      "text":
                      'আপনি যদি কোনো রিক্রুটিং এজেন্সির সহায়তা ছাড়াই আপনার চাকরি অধিগ্রহণ করেন তবে আপনি ছাড়পত্রের জন্য আবেদন করতে পারবেন।',
                      "icon": Icons.work_outline,
                    },
                    {
                      "text":
                      'আপনি অবশ্যই প্রি-ডিপারচার ওরিয়েন্টেশন (PDO) সম্পন্ন করেছেন বা আপনার একটি উচ্চ শিক্ষাগত সংস্থাপত্র থাকতে হবে।',
                      "icon": Icons.school_outlined,
                    },
                    {
                      "text": 'আপনার ভিসা, কর্মসংস্থান এবং ব্যাঙ্কের বিবরণ লিখুন।',
                      "icon": Icons.account_balance_outlined,
                    },
                    {
                      "text": 'প্রয়োজনীয় প্রয়োজনীয় কাগজপত্র আপলোড করুন।',
                      "icon": Icons.upload_file,
                    },
                    {
                      "text":
                      'সরকার অনুমোদিত ফি প্রদান করুন এবং আপনার আবেদন জমা দিন।',
                      "icon": Icons.attach_money_outlined,
                    },
                    {
                      "text":
                      'অনুমোদনের পর একটি ডিজিটাল QR-কোড ভিত্তিক BMET ক্লিয়ারেন্স কার্ড পান।',
                      "icon": Icons.qr_code_scanner,
                    },
                    {
                      "text":
                      'এয়ারপোর্ট ইমিগ্রেশনে আপনার এই কার্ডটি স্ক্যান করুন এবং বিদেশে উড়ে যান!',
                      "icon": Icons.flight_takeoff,
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => MandatoryScreen()));
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
                  'আবেদন প্রক্রিয়া শুরু করুন',
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
      elevation: 2,
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
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
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
    required String title,
    required List<Map<String, dynamic>> steps,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Divider(
              thickness: 1,
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
                          style: TextStyle(fontSize: 14, color: Colors.grey[700]),
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
