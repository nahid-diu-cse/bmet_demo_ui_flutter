import 'package:bmet_ui/res/components/build_progress_indicator.dart';
import 'package:bmet_ui/res/components/round_button.dart';
import 'package:bmet_ui/res/components/round_input_field.dart';
import 'package:bmet_ui/screen/bmet_registration/important_communication_info/important_communication_info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../res/components/show_properties.dart';

class NomineeInfoScreen extends StatefulWidget {
  const NomineeInfoScreen({Key? key}) : super(key: key);

  @override
  _NomineeFormPageState createState() => _NomineeFormPageState();
}

class _NomineeFormPageState extends State<NomineeInfoScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _relationshipWithNominee;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('নমিনীর তথ্য'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BuildProgressIndicator(text: "৩০", percent: .30),

                  ShowProperties(title: "বিএমইটি ফর্ম", colorB: Colors.white,colorT: Colors.teal,),
                  ShowProperties(title: "ব্যক্তিগত তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "যোগাযোগের তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "নমিনীর তথ্য", colorB: Colors.teal, colorT: Colors.white),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Dropdown: Relationship with Nominee
                          DropdownButtonFormField<String>(
                            value: _relationshipWithNominee,
                            items: [
                              'পিতা',
                              'মাতা',
                              'স্বামী',
                              'স্ত্রী',
                              'অন্যান্য',
                            ].map((relationship) {
                              return DropdownMenuItem(
                                value: relationship,
                                child: Text(
                                  relationship,
                                  style: TextStyle(
                                      color: Colors
                                          .teal[700]), // Text color for items
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                _relationshipWithNominee = value!;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: "নমিনীর সাথে সম্পর্ক",
                              labelStyle: TextStyle(color: Colors.teal[400]),
                              // Teal shade for label
                              filled: false,
                              // Keep it false to ensure background is transparent
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal.shade200, width: 1.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.teal[200]!, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              hintText: 'নমিনীর সাথে সম্পর্ক নির্বাচন করুন',
                              hintStyle: TextStyle(color: Colors.teal[200]),
                              // Teal shade for hint text
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 12),
                            ),
                            dropdownColor: Colors
                                .white, // Background color for dropdown menu (set to white for better contrast)
                          ),

                          const SizedBox(height: 16.0),

                          RoundInputField(initVal: "নমিনীর নাম", labelTxt: "নমিনীর নাম"),
                          const SizedBox(height: 16.0),
                          RoundInputField(initVal: "জাতীয় পরিচয়পত্র লিখুন", labelTxt: "নমিনীর জাতীয় পরিচয়পত্র (ঐচ্ছিক)"),
                          const SizedBox(height: 16.0),
                          RoundInputField(initVal: "মোবাইল নাম্বার লিখুন", labelTxt: "নমিনীর মোবাইল নাম্বার"),
                          // Nominee Mobile Number
                          const SizedBox(height: 16.0),
                          RoundInputField(initVal: "পিতার সম্পূর্ণ নাম লিখুন", labelTxt: "নমিনীর পিতার নাম"),
                        ],
                      ),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ImportantCommunicationInfoScreen()));
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('তথ্য সফলভাবে জমা হয়েছে')),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
