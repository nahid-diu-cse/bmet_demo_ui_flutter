import 'package:bmet_ui/screen/summary/documents_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../res/colors/app_colors.dart';

class BankDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'ব্যাংকিং তথ্য',
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
              child: Column(
                children: [
                  _buildProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        _buildDropdownField(
                          'ব্যাংক *',
                          'ব্যাংক নির্বাচন করুন',
                          context,
                          _showBankListDialog,
                        ),
                        SizedBox(height: 16),
                        _buildDropdownField(
                          'শাখা *',
                          'শাখা নির্বাচন করুন',
                          context,
                          _showBranchListDialog,
                        ),
                        SizedBox(height: 16),
                        _buildTextField('অ্যাকাউন্টের নাম *', 'অ্যাকাউন্টের নাম লিখুন'),
                        SizedBox(height: 16),
                        _buildTextField('অ্যাকাউন্ট নম্বর লিখুন *', 'অ্যাকাউন্ট নম্বর লিখুন'),
                        SizedBox(height: 16),
                        const Text("ব্যাংক চেক অথবা স্টেটমেন্ট আপলোড করুন", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        Divider(color: Colors.black,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildFileUploadCard(),
                            Container(
                              width: width * .25,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColor.tealColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                ),
                                child: Text('এটা কি?',
                                    style:
                                    TextStyle(color: Colors.white, fontSize: 12)),
                              ),
                            ),
                          ],
                        ),
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
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: AppColor.tealColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'পূর্ববর্তী',
                      style: TextStyle(color: AppColor.tealColor, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DocumentSummaryScreen()));
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
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return LinearPercentIndicator(
      padding: EdgeInsets.symmetric(horizontal: 15),
      lineHeight: 30,
      percent: 0.88,
      center: Text("৮৮%"),
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

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColor.tealColor), // Green border
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColor.tealColor), // Green border
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColor.tealColor, width: 2), // Green border
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String hint, BuildContext context, Function dialog) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () => dialog(context),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.tealColor), // Green border
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(hint, style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
                Icon(Icons.arrow_drop_down, color: Colors.grey.shade600),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFileUploadCard() {
    return Card(
      color: Colors.grey.shade500,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(Icons.folder, color: Colors.teal, size: 90),
            SizedBox(height: 8),
            Text(
              'ব্যাংক ডকুমেন্ট',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              icon: Icon(Icons.upload_file, size: 16, color: Colors.white),
              label: Text('আপলোড করুন', style: TextStyle(fontSize: 12, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  void _showBankListDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('ব্যাংক নির্বাচন করুন'),
          content: Container(
            width: double.maxFinite,
            child: ListView(
              children: [
                ListTile(title: Text('BRAC BANK LTD.')),
                ListTile(title: Text('DUTCH-BANGLA BANK LTD.')),
                ListTile(title: Text('BANK ASIA LTD.')),
                ListTile(title: Text('CITI BANK N A')),
                ListTile(title: Text('EXIM BANK LTD.')),
                ListTile(title: Text('FIRST SECURITY ISLAMI BANK LTD.')),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('বন্ধ করুন'),
            ),
          ],
        );
      },
    );
  }

  void _showBranchListDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('শাখা নির্বাচন করুন'),
          content: Container(
            width: double.maxFinite,
            child: ListView(
              children: [
                ListTile(title: Text('ধানমন্ডি শাখা')),
                ListTile(title: Text('গুলশান শাখা')),
                ListTile(title: Text('উত্তরা শাখা')),
                ListTile(title: Text('মতিঝিল শাখা')),
                ListTile(title: Text('চিটাগাং শাখা')),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('বন্ধ করুন'),
            ),
          ],
        );
      },
    );
  }
}
