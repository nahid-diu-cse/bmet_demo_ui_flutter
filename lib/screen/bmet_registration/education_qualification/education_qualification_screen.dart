import 'package:bmet_ui/res/components/build_progress_indicator.dart';
import 'package:bmet_ui/res/components/round_button.dart';
import 'package:bmet_ui/screen/bmet_registration/education_qualification/education_qualification_details.dart';
import 'package:flutter/material.dart';

import '../../../res/components/show_properties.dart';

class EducationFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('শিক্ষাগত যোগ্যতার বিবরণ'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BuildProgressIndicator(text: "৫৬", percent: 0.56),

                  ShowProperties(title: "বিএমইটি ফর্ম", colorB: Colors.white,colorT: Colors.teal,),
                  ShowProperties(title: "ব্যক্তিগত তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "যোগাযোগের তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "নমিনীর তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "জরুরী যোগাযোগের তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "শিক্ষাগত যোগ্যতার বিবরণ", colorB: Colors.teal, colorT: Colors.white),


                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Educational Qualification Dropdown
                        CustomDropdown(
                          label: 'শিক্ষাগত যোগ্যতা',
                          items: [
                            'প্রাথমিক শিক্ষা',
                            'মাধ্যমিক শিক্ষা',
                            'উচ্চ শিক্ষা'
                          ],
                        ),

                        SizedBox(height: 16.0),

                        // Passing Year Dropdown
                        CustomDropdown(
                          label: 'পাসের বছর',
                          items: ['২০২৩', '২০২২', '২০২১', '২০২০'],
                        ),

                        SizedBox(height: 16.0),

                        // Institution/School Dropdown
                        CustomDropdown(
                          label: 'প্রতিষ্ঠান/স্কুল',
                          items: [
                            'প্রতিষ্ঠান ১',
                            'প্রতিষ্ঠান ২',
                            'প্রতিষ্ঠান ৩'
                          ],
                        ),

                        SizedBox(height: 16.0),

                        // Board Dropdown
                        CustomDropdown(
                          label: 'বোর্ড',
                          items: ['বোর্ড ১', 'বোর্ড ২', 'বোর্ড ৩'],
                        ),

                        SizedBox(height: 16.0),

                        // Subject Dropdown
                        CustomDropdown(
                          label: 'বিষয়',
                          items: ['বিজ্ঞান', 'কলা', 'বানিজ্য'],
                        ),

                        SizedBox(height: 16.0),

                        // Grade/Division Dropdown
                        CustomDropdown(
                          label: 'গ্রেড/ডিভিশন',
                          items: ['A+', 'A', 'B', 'C'],
                        ),

                        SizedBox(height: 16.0),

                        // Add More Button
                        ElevatedButton(
                          onPressed: () {},
                          child: Text('+ আরও যোগ করুন'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.teal,
                            side: BorderSide(color: Colors.teal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          RoundButton(
            width: width,
            title: "পরবর্তী",
            onPress: () {
              // Your logic here
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EducationQualificationDetails()));
            },
          ),
        ],
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> items;

  CustomDropdown({required this.label, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        SizedBox(height: 8.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.teal, width: 1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(
                'নির্বাচন করুন $label',
                style: TextStyle(color: Colors.teal[600]),
              ),
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.teal[900]),
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {},
              dropdownColor: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
