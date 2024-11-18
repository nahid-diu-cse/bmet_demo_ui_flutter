import 'package:bmet_ui/res/components/build_progress_indicator.dart';
import 'package:bmet_ui/res/components/round_button.dart';
import 'package:bmet_ui/res/components/round_input_field.dart';
import 'package:bmet_ui/screen/bmet_registration/nomine_info/nomine_info_screen.dart';
import 'package:flutter/material.dart';

import '../../../res/components/show_properties.dart';
import '../personal_info/personal_info_screen.dart';

class CommunicationInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('যোগাযোগের তথ্য', style: TextStyle(fontSize: 18)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BuildProgressIndicator(text: "২২", percent: 0.22),
                  ShowProperties(title: "বিএমইটি ফর্ম", colorB: Colors.white,colorT: Colors.teal,),
                  ShowProperties(title: "ব্যক্তিগত তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "যোগাযোগের তথ্য", colorB: Colors.teal, colorT: Colors.white),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 24),
                        RoundInputField(initVal: "মোবাইল নম্বর", labelTxt: "মোবাইল নম্বর"),
                        SizedBox(height: 16),
                        RoundInputField(initVal: "ইমেইল", labelTxt: "ইমেইল"),
                        SizedBox(height: 16),
                        _buildDropDown('জেলা'),
                        SizedBox(height: 16),
                        _buildDropDown('থানা/উপজেলা'),
                        SizedBox(height: 16),
                        _buildDropDown('ওয়ার্ড/ইউনিয়ন'),
                        SizedBox(height: 24),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          RoundButton(
            width: width,
            title: "জমা দিন",
            onPress: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NomineeInfoScreen()));
            },
          )
        ],
      ),
    );
  }

  Widget _buildStatusIcon(bool isCompleted) {
    return Icon(
      isCompleted ? Icons.check_circle : Icons.cancel,
      color: isCompleted ? Colors.green : Colors.red,
    );
  }


  Widget _buildDropDown(String label) {
    return DropdownButtonFormField<String>(
      items: [
        DropdownMenuItem(value: 'Dhaka', child: Text('Dhaka', style: TextStyle(color: Colors.teal[900]))),
        DropdownMenuItem(value: 'option1', child: Text('Option 1', style: TextStyle(color: Colors.teal[900]))),
      ],
      value: 'Dhaka',
      onChanged: (value) {},
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.teal[700]),
        filled: false, // Keep it false for transparent background
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal.shade200, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal[800]!, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12),
      ),
      dropdownColor: Colors.white, // White background for dropdown menu
    );
  }
}