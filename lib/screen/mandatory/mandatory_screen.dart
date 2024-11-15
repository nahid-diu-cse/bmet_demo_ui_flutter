import 'package:bmet_ui/res/colors/app_colors.dart';
import 'package:bmet_ui/screen/employee_details/employee_works_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class MandatoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
        title: Text(
          'বাধ্যতামূলক তথ্য',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                // Padding for fixed button
                children: [
                  LinearPercentIndicator(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    lineHeight: 30,
                    percent: 0.1,
                    center: Text("0%"),
                    barRadius: Radius.circular(10),
                    linearGradient: LinearGradient(
                      colors: [
                        AppColor.progressBarColor1,
                        AppColor.progressBarColor2,
                      ],
                    ),
                    animateFromLastPercent: true,
                    animation: true,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Container(
                      height: height * .06,
                      width: width,
                      color: AppColor.tealColor,
                      child: _buildSectionHeader('ব্যক্তিগত তথ্য'),
                    ),
                  ),
                  _buildInfoCard([
                    _buildRow('নাম', 'MD ABDUL SOBHAN'),
                    _buildRow('পিতার নাম', 'ABDUL SAMAD'),
                    _buildRow('মাতার নাম', 'ROKEYA BEGUM'),
                    _buildRow('পাসপোর্ট নম্বর', 'EN017975'),
                  ]),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Container(
                      height: height * .06,
                      width: width,
                      color: AppColor.tealColor,
                      child: _buildSectionHeader('পাসপোর্ট তথ্য'),
                    ),
                  ),
                  _buildPassportInfoSection(height, width),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Container(
                        height: height * 0.06,
                        width: width,
                        color: AppColor.tealColor,
                        child: _buildSectionHeader('মোবাইল নম্বর')),
                  ),
                  _buildMobileNumberSection(),
                  _buildDivider(),
                  _buildSectionHeader('বিএমইটি রেজিস্ট্রেশন'),
                  _buildBMETRegistrationCards(width),
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EmployeeWorksDetailsScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.tealColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'পরের পেইজ',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(
            Icons.person,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(List<Widget> rows) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: rows),
      ),
    );
  }

  Widget _buildRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 14)),
          Text(value,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildPassportInfoSection(double height, double width) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'পাসপোর্ট মেয়াদউত্তীর্ণ তারিখ',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildDropdown('২৫')),
                SizedBox(width: 8),
                Expanded(child: _buildDropdown('জানু.')),
                SizedBox(width: 8),
                Expanded(child: _buildDropdown('২০২৩')),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: height * .06,
                  width: width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.tealColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'দেখুন ',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
                Container(
                  height: height * 0.06,
                  width: width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'রিপ্লেস',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.tealColor),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Center(
        child: Text(
          value,
          style: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildMobileNumberSection() {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.phone_android, size: 28, color: AppColor.tealColor),
                SizedBox(width: 10),
                Text(
                  'মোবাইল নম্বর',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              '* এই মোবাইল নম্বর আপনার সাথে যোগাযোগ করা হবে',
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBMETRegistrationCards(double width) {
    return Column(
      children: [
        _buildRegistrationCard("বিএমইটি রেজিস্ট্রেশন", 'SRM2021848767', '5G',
            Colors.deepPurple, width),
        _buildRegistrationCard(
            "পিডিও", 'Qatar-7898336', '', Colors.purple, width),
        _buildRegistrationCard("বায়োমেট্রিক ডাটা", 'ডেটা জমা দেওয়া হয়েছে', '',
            Colors.deepPurpleAccent, width),
      ],
    );
  }

  Widget _buildRegistrationCard(
      String text, String title, String subtitle, Color color, double width) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 2,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.description_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: width * .2,
                  child: Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            Container(
              width: width * .4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              constraints: BoxConstraints(
                minHeight: 40, // Set the minimum height here
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    if (subtitle.isNotEmpty)
                      Text(
                        subtitle,
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                  ],
                ),
              ),
            ),
            Icon(Icons.check_circle, color: Colors.white, size: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey.shade300,
      height: 16,
      thickness: 1,
      indent: 16,
      endIndent: 16,
    );
  }
}
