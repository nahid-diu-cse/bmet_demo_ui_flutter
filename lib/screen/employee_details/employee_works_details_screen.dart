import 'package:bmet_ui/res/components/build_progress_indicator.dart';
import 'package:bmet_ui/screen/employee_details/employee_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../res/colors/app_colors.dart';

class EmployeeWorksDetailsScreen extends StatelessWidget {
  const EmployeeWorksDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'কর্মসংস্থান তথ্য',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.green),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column( // Padding for fixed button
                children: [
                  BuildProgressIndicator(text: "২২", percent: 0.22),
                  _buildInitialInfoSection(),
                  _buildScrollContent(context),
                ],
              ),
            ),
          ),
          Container(
            width: width,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => EmployeeDetailsScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.tealColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'পরের পেইজ',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomProgressIndicator() {
    return LinearPercentIndicator(
      padding: EdgeInsets.symmetric(horizontal: 15),
      lineHeight: 30,
      percent: 0.22,
      center: Text("২২%"),
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

  Widget _buildInitialInfoSection() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.assignment_outlined, color: Colors.teal, size: 32),
            SizedBox(width: 16),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'সিঙ্গেল উইন্ডো ক্লিয়ারেন্স',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: '\nশেষ রিক্রুটিং এজেন্সির সহায়তায় জবই ঢাকায় পৌঁছা যাবে। সিঙ্গেল (একক) উইন্ডো ক্লিয়ারেন্স সম্পন্ন।',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildScrollContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("গন্তব্য দেশ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          Divider(
            thickness: 1,
          ),
          GestureDetector(
            onTap: () => _showPopupDialog(
                context, 'দেশ', ['বাংলাদেশ', 'ভারত', 'মালয়েশিয়া']),
            child: _buildDropdownField('দেশ *', 'দেশ নির্বাচন করুন'),
          ),
          SizedBox(height: 16),
          Text("চাকরির বিবরণ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          Divider(
            thickness: 1,
          ),
          GestureDetector(
            onTap: () => _showPopupDialog(
                context, 'চাকরির বিবরণ', ['কাজ ১', 'কাজ ২', 'কাজ ৩']),
            child: _buildDropdownField(
                'চাকরি *', 'কাজের বিভাগ নির্বাচন করুন'),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () => _showPopupDialog(
                context, 'ভিসার ধরণ', ['ধরণ ১', 'ধরণ ২', 'ধরণ ৩']),
            child: _buildDropdownField('ভিসার ধরণ *', 'কাজের ধরন নির্বাচন করুন'),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () => _showPopupDialog(context, 'দক্ষতার ধরণ *',
                ['সাধারণ', 'দক্ষ', 'অদক্ষ', 'প্রফেশনাল']),
            child: _buildDropdownField('দক্ষতার ধরণ *', 'দক্ষ নির্বাচন করুন'),
          ),
          SizedBox(height: 16),
          _buildTextField('বেতন (প্রতি মাসে) *', '1200'),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildDropdownField('চুক্তির মেয়াদ *', '0 বছর')),
              SizedBox(width: 8),
              Expanded(child: _buildDropdownField('', '5 মাস')),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'প্রয়োজনীয় কাগজপত্র',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              _buildFileUploadCard(
                  'চাকরির অনুমতি', Colors.grey.shade300, Colors.deepPurple.shade900),
              SizedBox(width: 8),
              _buildFileUploadCard(
                  'কাজের অনুমতি', Colors.grey.shade300, Colors.green.shade900),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty)
          Text(label,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(hint, style: TextStyle(fontSize: 14, color: Colors.grey)),
              Icon(Icons.arrow_drop_down, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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

  Widget _buildFileUploadCard(String label, Color bgColor, Color iconColor) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: bgColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Icon(Icons.folder, color: iconColor, size: 48),
              SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                    color: iconColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: iconColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_file, size: 16, color: Colors.white),
                    SizedBox(width: 4),
                    Text('আপলোড করুন',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPopupDialog(
      BuildContext context, String title, List<String> options) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: options
                .map((option) => ListTile(
                      title: Text(option),
                      onTap: () {
                        Navigator.pop(context, option);
                      },
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}
