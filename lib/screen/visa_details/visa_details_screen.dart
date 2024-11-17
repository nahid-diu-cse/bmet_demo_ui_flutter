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
          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: AppColor.tealColor),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            // Mobile Layout
            return _buildMobileLayout(width,context);
          } else {
            // Tablet/Desktop Layout
            return _buildTabletLayout(width,context);
          }
        },
      ),
    );
  }

  Widget _buildMobileLayout(double width, BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildProgressIndicator(),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: width * .4,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.tealColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        ),
                        child: Text('এটা কি?',
                            style: TextStyle(color: Colors.white, fontSize: 14)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildVisaDetailsSection(width),
                  SizedBox(height: 20),
                  _buildFileUploadCard(),
                  SizedBox(height: 24),
                  _buildVisaFields(width),
                ],
              ),
            ),
          ),
        ),
        _buildBottomNavigation(context),
      ],
    );
  }

  Widget _buildTabletLayout(double width, BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildProgressIndicator(),
                  SizedBox(height: 32),
                  _buildVisaDetailsSection(width),
                  SizedBox(height: 32),
                  _buildFileUploadCard(),
                  SizedBox(height: 32),
                  _buildVisaFields(width),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: _buildBottomNavigation(context),
          ),
        ),
      ],
    );
  }

  Widget _buildVisaDetailsSection(double width) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(
            Icons.picture_as_pdf,
            color: AppColor.tealColor,
            size: 40,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "পেপার ভিসা",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "পেপার ভিসার ক্ষেত্রে ভিসা যাচাইয়ের জন্য আপনাকে বিএমইটি অফিসে যেতে হবে।",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressIndicator() {
    return LinearPercentIndicator(
      padding: EdgeInsets.zero,
      lineHeight: 20,
      percent: .55,
      center: Text("৫৫%",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      barRadius: Radius.circular(15),
      linearGradient: LinearGradient(
        colors: [Colors.teal.shade300, Colors.teal.shade700],
      ),
      animateFromLastPercent: true,
      animation: true,
    );
  }

  Widget _buildFileUploadCard() {
    return Card(
      color: Colors.grey.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(Icons.folder, color: AppColor.tealColor, size: 90),
            SizedBox(height: 12),
            Text(
              'ভিসা নথি',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.tealColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              icon: Icon(Icons.upload_file, size: 20, color: Colors.white),
              label: Text('আপলোড করুন',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVisaFields(double width) {
    return Column(
      children: [
        _buildTextField(width, 'ভিসা রেফারেন্স নম্বর/রক ভিসা *', 'আপনার ভিসা রেফারেন্স নম্বর লিখুন'),
        SizedBox(height: 16),
        _buildTextField(width, 'ভিসা নং *', 'আপনার ভিসা নম্বর লিখুন'),
        SizedBox(height: 16),
        _buildTextField(width, 'স্টিকার নং *', 'আপনার স্টিকারের নম্বর লিখুন', showInfo: true),
        SizedBox(height: 16),
        _buildTextField(width, 'স্পনসর আইডি *', 'আপনার স্পনসর আইডি লিখুন', showInfo: true),
      ],
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            filled: true,
            fillColor: Colors.grey.shade100,
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigation(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'পূর্ববর্তী',
                style: TextStyle(
                    color: AppColor.tealColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
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
                  borderRadius: BorderRadius.circular(16),
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
    );
  }
}
