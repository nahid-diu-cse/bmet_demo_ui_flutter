import 'package:bmet_ui/res/components/round_button.dart';
import 'package:bmet_ui/screen/visa_details/visa_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../res/colors/app_colors.dart';

class EmployeeDetailsScreen extends StatelessWidget {
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
          'নিয়োগকারীর তথ্য',
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
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 16),
                        Text("নিয়োগকারীর তথ্য", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Divider(thickness: 1,),
                        _buildTextField('নিয়োগকারীর নাম *', 'নিয়োগকারীর নাম লিখুন'),
                        SizedBox(height: 16),
                        _buildTextField('নিয়োগকারীর ঠিকানা *', 'নিয়োগকারীর ঠিকানা লিখুন'),
                        SizedBox(height: 16),
                        _buildTextField('নিয়োগকারীর কম্যুনাগ নম্বর', 'নিয়োগকারীর যোগাযোগ নম্বর লিখুন'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          RoundButton(width:width,title: "পরের পেইজ", onPress: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => VisaDetailsScreen()));
          })
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
        percent: 0.44,
        center: Text("৪৪%",
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
        Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
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
