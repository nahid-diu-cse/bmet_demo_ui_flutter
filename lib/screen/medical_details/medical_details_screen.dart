import 'package:bmet_ui/screen/bank_details/bank_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../res/colors/app_colors.dart';

class MedicalDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
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
          'মেডিকেল বিষয়ে তথ্য',
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
                        _buildTextField(
                          width,'মেডিকেল ক্লিয়ারেন্স রেফারেন্স নম্বর *',
                          'আপনার রেফারেন্স নম্বর দিন',
                          showInfo: true,
                        ),
                        SizedBox(height: 16),
                        _buildDropdownField(
                          'মেডিকেল সেন্টার',
                          'মেডিকেল সেন্টার নির্বাচন করুন',
                          context,
                        ),
                        SizedBox(height: 16),
                        _buildDateDropdownSelector(),
                        SizedBox(height: 16),
                        const Text("মেডিকেল ডকুমেন্টস আপলোড করুন", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                        Divider(color: Colors.black,),
                        SizedBox(height: 16),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BankDetailsScreen()));
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
      percent: 0.75,
      center: Text("৭৫%"),
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

  Widget _buildTextField(double width,String label, String hint, {bool showInfo = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color:AppColor.tealColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColor.tealColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColor.tealColor, width: 2),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(String label, String hint, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            _showMedicalCenterDialog(context);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
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

  Widget _buildDateDropdownSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('মেডিকেল পরীক্ষার তারিখ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildDropdown('দিন', List.generate(31, (index) => '${index + 1}')),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _buildDropdown(
                'মাস',
                ['জানুয়ারি', 'ফেব্রুয়ারি', 'মার্চ', 'এপ্রিল', 'মে', 'জুন', 'জুলাই', 'আগস্ট', 'সেপ্টেম্বর', 'অক্টোবর', 'নভেম্বর', 'ডিসেম্বর'],
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _buildDropdown('বছর', List.generate(50, (index) => '${1970 + index}')),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdown(String hint, List<String> items) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.green),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.green),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.green, width: 2),
        ),
      ),
      items: items.map((item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
      onChanged: (value) {},
      hint: Text(hint),
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
            Icon(Icons.folder, color: Colors.yellow.shade700, size: 90),
            SizedBox(height: 8),
            Text(
              'মেডিকেল ডকুমেন্ট',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow.shade700,
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

  void _showMedicalCenterDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('মেডিকেল সেন্টার নির্বাচন করুন'),
          content: Container(
            width: double.maxFinite,
            child: ListView(
              children: [
                ListTile(title: Text('আন-রিয়াদ মেডিকেল চেক-আপ')),
                ListTile(title: Text('উপশহর মেডিকেল সেন্টার')),
                ListTile(title: Text('সন্ধ্যা মেডিকেল সেন্টার')),
                ListTile(title: Text('মাসকাট মেডিকেল সেন্টার')),
                ListTile(title: Text('পালস মেডিকেল সেন্টার লিমিটেড')),
                ListTile(title: Text('ওয়েস্টার্ন মেডিকেয়ার লিমিটেড')),
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
