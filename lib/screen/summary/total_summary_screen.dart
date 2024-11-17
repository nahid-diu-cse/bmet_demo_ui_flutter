import 'package:bmet_ui/screen/summary/payment_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../res/colors/app_colors.dart';
import 'documents_summary_screen.dart';

class TotalSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        // White background for the AppBar
        elevation: 0,
        // Remove the shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          // Back arrow icon in black
          onPressed: () {
            Navigator.pop(context);
            // Add your back button functionality here
          },
        ),
        title: const Text(
          'সামারি',
          style: TextStyle(
            color: Colors.black, // Black text color
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info, color: AppColor.tealColor),
            // Info icon in green
            onPressed: () {
              // Add your info button functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        // Profile Section
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.blue.shade900, Colors.purple.shade300],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // Center items vertically
                            children: [
                              // Profile Image
                              Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white, width: 2),
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage('assets/profile.jpg'),
                                    // Replace with your image
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16), // Space between image and text
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'MD ABDUL SOBHAN',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    const Text(
                                      'পাসপোর্ট নম্বর: EH0517375',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    ElevatedButton(
                                      onPressed: () {
                                        // Add your functionality here
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColor.tealColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        // Ensures the button wraps its content
                                        children: [
                                          Text(
                                            'ছবি পরিবর্তন করুন',
                                            style: TextStyle(
                                              color: Colors
                                                  .white, // Set text color to white
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          // Add some spacing between label and icon
                                          Icon(
                                            Icons.camera_alt,
                                            color:
                                                Colors.white, // Set icon color to white
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        // List of Actions
                        _buildAlternatingActionItems(),

                        // Editable Sections
                        SizedBox(height: 16),
                        Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                EditableSection(title: 'চাকরির বিবরণ'),
                                EditableSection(title: 'নিয়োগকর্তার তথ্য'),
                                EditableSection(title: 'ভিসা'),
                                EditableSection(title: 'পিভিও এবং বায়োমেট্রিক ডাটা'),
                                EditableSection(title: 'মেডিকেল'),
                                EditableSection(title: 'ব্যাংক একাউন্ট'),
                                EditableSection(title: 'ডকুমেন্ট'),
                              ],
                            ),
                          ),
                        ),

                        // Submit Button
                        SizedBox(height: 16),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentSummaryScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.tealColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'পেমেন্ট সম্পন্ন করুন',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: LinearPercentIndicator(
        padding: EdgeInsets.zero,
        lineHeight: 20,
        percent: 1.0,
        center: const Text("১০০%",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        barRadius: Radius.circular(15),
        linearGradient: LinearGradient(
          colors: [Colors.teal.shade300, Colors.teal.shade700],
        ),
        animateFromLastPercent: true,
        animation: true,
      ),
    );
  }

  Widget _buildAlternatingActionItems() {
    final List<Map<String, dynamic>> actions = [
      {
        'icon': Icons.assignment,
        'title': 'আপনার ক্রিয়াকলাপ অ্যাসিক্লেশন',
        'subtitle':
            'আপনি বিএমইটি ক্লিয়ারেন্সের জন্য আবেদন করেছেন। আপনার এপ্লিকেশনটি বিএমইটি কর্মকর্তারা সম্পন্ন করবে।',
      },
      {
        'icon': Icons.attach_money,
        'title': 'নমিনাল ফি',
        'subtitle':
            'বিএমইটি ক্লিয়ারেন্স এপ্লিকেশনের জন্য একটি অফেরতযোগ্য নমিনাল ফি প্রদান করুন। ',
      },
      {
        'icon': Icons.track_changes,
        'title': 'অ্যাসিক্লেশন ট্র্যাকিং',
        'subtitle':
            'বিএমইটি ডেস্ক  থেকে পাসপোর্ট নম্বর দিয়ে আপনার এপ্লিকেশনটি ট্র্যাক করুন। ',
      },
      {
        'icon': Icons.notification_important,
        'title': 'নোটিফিকেশন পান',
        'subtitle': 'আপনার এপ্লিকেশন টি অনুমোদিত হলে আপনাকে জানানো হবে। ',
      },
      {
        'icon': Icons.qr_code,
        'title': 'সরকারি ফি',
        'subtitle':
            'আপনার এপ্লিকেশন টি অনুমোদিত হওয়ার পর, ডিজিটাল QR - ভিত্তিক ক্লিয়ারেন্স কার্ড পেতে সরকারি ফি প্রদান করুন। ',
      },
      {
        'icon': Icons.airplanemode_active,
        'title': 'এরাপোর্ট ইমিগ্রেশন',
        'subtitle':
            'প্লেনে উঠার পূর্বে এয়ারপোর্ট ইমিগ্রেশন ডেস্কে আপনার ক্লেয়ারেন্স কার্ডটি স্ক্যান করুন।',
      },
    ];

    return Column(
      children: List.generate(actions.length, (index) {
        final action = actions[index];
        final hasBackground = index % 2 == 0; // Alternating background

        return Container(
          margin: EdgeInsets.symmetric(vertical: 4),
          decoration: BoxDecoration(
            color: hasBackground ? Colors.grey.shade200 : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListTile(
            leading: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.green)),
              child: Icon(action['icon'], color: Colors.green),
            ),
            title: Text(
              action['title'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(action['subtitle']),
          ),
        );
      }),
    );
  }
}

class EditableSection extends StatelessWidget {
  final String title;

  const EditableSection({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(
          Icons.edit,
          color: AppColor.tealColor,
        ),
        onTap: () {
          // Add your action here
        },
      ),
    );
  }
}
