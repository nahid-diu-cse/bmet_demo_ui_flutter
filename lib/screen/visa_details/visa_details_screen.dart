import 'package:bmet_ui/res/colors/app_colors.dart';
import 'package:bmet_ui/screen/pdo_biometric/pdo_biometric_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class VisaDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'ভিসার বিবরণ',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.green),
            onPressed: () {
              Navigator.pop(context);
            },
          )
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
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: width * .25,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.tealColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                              ),
                              child: Text('এটা কি?',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12)),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Icon or Image
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                // Placeholder for image background
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.picture_as_pdf,
                                color: AppColor.tealColor,
                                size: 60,
                              ), // Replace with Image.asset if you have an asset
                            ),
                            const SizedBox(width: 30),
                            // Spacing between image and text
                            // Text
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "পেপার ভিসা",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  // Spacing between title and subtitle
                                  Text(
                                    "পেপার ভিসার ক্ষেত্রে ভিসা যাচাইয়ের জন্য আপনাকে বিএমইটি অফিসে যেতে হবে।",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        _buildSectionHeader('ডকুমেন্টস'),
                        Divider(
                          thickness: 1,
                          color: Colors.black.withOpacity(0.7),
                        ),
                        _buildFileUploadCard(),
                        SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'ভিসার বিবরণ',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        Divider(thickness: 1, color: Colors.grey.shade300),
                        _buildTextField(width, 'ভিসা রেফারেন্স নম্বর/রক ভিসা *',
                            'আপনার ভিসা রেফারেন্স নম্বর লিখুন'),
                        Divider(
                            height: 32,
                            thickness: 1,
                            color: Colors.grey.shade300),
                        _buildTextField(
                            width, 'ভিসা নং *', 'আপনার ভিসা নম্বর লিখুন'),
                        Divider(
                            height: 32,
                            thickness: 1,
                            color: Colors.grey.shade300),
                        _buildTextField(width, 'স্টিকার নং *',
                            'আপনার স্টিকারের নম্বর লিখুন',
                            showInfo: true),
                        Divider(
                            height: 32,
                            thickness: 1,
                            color: Colors.grey.shade300),
                        _buildTextField(
                            width, 'স্পনসর আইডি *', 'আপনার স্পনসর আইডি লিখুন',
                            showInfo: true),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColor.tealColor),
                      // Set the border color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'পূর্ববর্তী',
                      style: TextStyle(
                          color: AppColor.tealColor,
                          fontSize: 16,
                          fontWeight: FontWeight
                              .bold), // Ensure the text color contrasts with the background
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PdoBiometricScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.tealColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'পরের পেজ',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return LinearPercentIndicator(
      padding: EdgeInsets.symmetric(horizontal: 15),
      lineHeight: 30,
      percent: 0.55,
      center: Text("৫৫%"),
      barRadius: Radius.circular(10),
      linearGradient: LinearGradient(
        colors: [
          AppColor.progressBarColor1,
          AppColor.progressBarColor2,
        ],
      ),
      animateFromLastPercent: true,
      animation: true,
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildFileUploadCard() {
    return Card(
      color: Colors.grey.shade400,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(Icons.folder, color: Colors.purple, size: 90),
            SizedBox(height: 8),
            Text(
              'ভিসা নথি',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              icon: Icon(Icons.upload_file, size: 16, color: Colors.white),
              label: Text('আপলোড করুন',
                  style: TextStyle(fontSize: 12, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(double width, String label, String hint,
      {bool showInfo = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            if (showInfo)
              Container(
                width: width * .25,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.tealColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                  child: Text('এটা কি?',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
          ],
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
