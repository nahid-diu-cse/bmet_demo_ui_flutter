import 'package:bmet_ui/res/components/build_progress_indicator.dart';
import 'package:bmet_ui/res/components/round_button.dart';
import 'package:bmet_ui/res/components/round_input_field.dart';
import 'package:bmet_ui/screen/bmet_registration/education_qualification/education_qualification_screen.dart';
import 'package:flutter/material.dart';

import '../../../res/components/show_properties.dart';

class ImportantCommunicationInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Getting the screen size to make the UI responsive
    var width = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('জরুরী যোগাযোগের তথ্য'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BuildProgressIndicator(text: "৪৪", percent: 0.44),

                  ShowProperties(title: "বিএমইটি ফর্ম", colorB: Colors.white,colorT: Colors.teal,),
                  ShowProperties(title: "ব্যক্তিগত তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "যোগাযোগের তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "নমিনীর তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "জরুরী যোগাযোগের তথ্য", colorB: Colors.teal, colorT: Colors.white),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05,
                      vertical: screenHeight * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: screenHeight * 0.01),
                        DropdownButtonFormField<String>(
                          items: const [
                            DropdownMenuItem(
                                value: 'relative',
                                child: Text('সম্পর্ক নির্ধারণ করুন')),
                            DropdownMenuItem(
                                value: 'friend', child: Text('বন্ধু')),
                            DropdownMenuItem(
                                value: 'colleague', child: Text('সহকর্মী')),
                          ],
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            labelText: "সম্পর্ক",
                            labelStyle: TextStyle(color: Colors.teal[800]),
                            filled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal.shade200, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal[800]!, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02,
                              horizontal: width * 0.03,
                            ),
                            hintText: 'সম্পর্ক নির্ধারণ করুন',
                            hintStyle: TextStyle(color: Colors.teal[600]),
                          ),
                        ),
                        SizedBox(height: 16),
                        RoundInputField(initVal: "জরুরী যোগাযোগের নাম লিখুন", labelTxt: "নাম"),
                        SizedBox(height: 16),
                        RoundInputField(initVal: "জরুরী যোগাযোগের জন্য মোবাইল নাম্বার প্রদান করুন", labelTxt: "মোবাইল নাম্বার"),

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
                  builder: (context) => EducationFormScreen(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
