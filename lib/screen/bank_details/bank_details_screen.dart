import 'package:bmet_ui/screen/summary/documents_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BankDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
          'ব্যাংকিং তথ্য',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _buildProgressIndicator(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    _buildTextField(
                        'অ্যাকাউন্টের নাম *', 'অ্যাকাউন্টের নাম লিখুন'),
                    SizedBox(height: 16),
                    _buildTextField(
                        'অ্যাকাউন্ট নম্বর লিখুন *', 'অ্যাকাউন্ট নম্বর লিখুন'),
                    SizedBox(height: 16),
                    _buildFileUploadSection(width),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          _buildFooterButtons(context),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: LinearPercentIndicator(
        padding: EdgeInsets.zero,
        lineHeight: 30,
        percent: 0.88,
        center: Text("৮৮%",
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
            hintStyle: TextStyle(color: Colors.grey.shade600),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.teal, width: 2),
            ),
            filled: true,
            fillColor: Colors.grey.shade100,
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(
      String label, String hint, BuildContext context, Function dialog) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        GestureDetector(
          onTap: () => dialog(context),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.teal),
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(hint,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 14)),
                Icon(Icons.arrow_drop_down, color: Colors.teal),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFileUploadSection(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ব্যাংক চেক অথবা স্টেটমেন্ট আপলোড করুন",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        Divider(color: Colors.black),
        SizedBox(height: 8),
        Row(
          children: [
            _buildFileUploadCard(),
            SizedBox(width: 16),
            Expanded(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.help, size: 16),
                label: Text('এটা কি?'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFileUploadCard() {
    return Container(
      width: 120,
      height: 140,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.folder, color: Colors.teal, size: 50),
          SizedBox(height: 8),
          Text(
            'ব্যাংক ডকুমেন্ট',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'আপলোড করুন',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterButtons(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.teal),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                'পূর্ববর্তী',
                style: TextStyle(color: Colors.teal, fontSize: 16),
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
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
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

  void _showBankListDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('বন্ধ করুন'),
          ),
        ],
      ),
    );
  }

  void _showBranchListDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('শাখা নির্বাচন করুন'),
        content: Container(
          width: double.maxFinite,
          child: ListView(
            children: [
              ListTile(title: Text('ধানমন্ডি শাখা')),
              ListTile(title: Text('গুলশান শাখা')),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('বন্ধ করুন'),
          ),
        ],
      ),
    );
  }
}
