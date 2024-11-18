import 'package:bmet_ui/res/components/build_progress_indicator.dart';
import 'package:bmet_ui/res/components/round_button.dart';
import 'package:bmet_ui/res/components/round_input_field.dart';
import 'package:bmet_ui/res/components/show_properties.dart';
import 'package:bmet_ui/screen/bmet_registration/communication_info/communication_info_screen.dart';
import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatefulWidget {
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  String maritalStatus = 'অবিবাহিত';
  String religion = 'ইসলাম';
  int heightFeet = 5;
  int heightInches = 0;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('ব্যক্তিগত তথ্য',style: TextStyle(color: Colors.black,fontSize: 18),),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BuildProgressIndicator(text: '১১', percent: .11),
                  ShowProperties(title: "বিএমইটি ফর্ম", colorB: Colors.white,colorT: Colors.teal,),
                  ShowProperties(title: "ব্যক্তিগত তথ্য", colorB: Colors.teal, colorT: Colors.white),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RoundInputField(initVal:  "পিতার নাম", labelTxt: "পিতার নাম"),
                        const SizedBox(height: 16),
                        RoundInputField(initVal: "মাতার নাম", labelTxt: "মাতার নাম"),
                        SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: maritalStatus,
                          decoration: InputDecoration(
                            labelText: 'বৈবাহিক অবস্থা',
                            labelStyle: TextStyle(color: Colors.teal[700]), // Teal shade for label
                            filled: false, // Keep it false to ensure background is transparent
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal.shade200, width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal[700]!, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          items: ['অবিবাহিত', 'বিবাহিত']
                              .map((status) => DropdownMenuItem(
                            value: status,
                            child: Text(
                              status,
                              style: TextStyle(color: Colors.teal[900]), // Text color for items
                            ),
                          ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              maritalStatus = value!;
                            });
                          },
                          dropdownColor: Colors.white, // Background color for dropdown menu (set to white for better contrast)
                        ),

                        SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: religion,
                          decoration: InputDecoration(
                            labelText: 'ধর্ম',
                            labelStyle: TextStyle(color: Colors.teal[800]), // Teal shade for label
                            filled: false, // Keep it false to ensure background is transparent
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal.shade200, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal[800]!, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          items: ['ইসলাম', 'হিন্দু', 'খ্রিস্টান', 'বৌদ্ধ']
                              .map((rel) => DropdownMenuItem(
                            value: rel,
                            child: Text(
                              rel,
                              style: TextStyle(color: Colors.teal[900]), // Text color for items
                            ),
                          ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              religion = value!;
                            });
                          },
                          dropdownColor: Colors.white, // Background color for dropdown menu (set to white for better contrast)
                        ),

                        SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                initialValue: heightFeet.toString(),
                                decoration: InputDecoration(
                                  labelText: 'উচ্চতা (ফুট)',
                                  labelStyle: TextStyle(color: Colors.teal[800]), // Teal shade for label
                                  filled: false, // Keep it false to ensure background is transparent
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal.shade200, width: 1.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal[800]!, width: 2.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    heightFeet = int.tryParse(value) ?? 0;
                                  });
                                },
                              )
                              ,
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: TextFormField(
                                initialValue: heightInches.toString(),
                                decoration: InputDecoration(
                                  labelText: 'উচ্চতা (ইঞ্চি)',
                                  labelStyle: TextStyle(color: Colors.teal[800]),
                                  border: OutlineInputBorder(),
                                  filled: false,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal.shade200, width: 1.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.teal[800]!, width: 2.0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),

                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    heightInches = int.tryParse(value) ?? 0;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                          initialValue: weight.toString(),
                          decoration: InputDecoration(
                            labelText: 'ওজন (কেজি)',
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(color: Colors.teal[800]),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal.shade200, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal[800]!, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              weight = int.tryParse(value) ?? 0;
                            });
                          },
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommunicationInfoScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField({
    required String hintText,
    TextEditingController? controller,
    bool readOnly = false,
    VoidCallback? onTap,
    TextInputType keyboardType = TextInputType.text,
    String tagLabel="",
  }) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: tagLabel,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black38),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.teal.shade200, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.teal.shade700, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red.shade700, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red.shade700, width: 2.0),
        ),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.withOpacity(0.2),
        //     spreadRadius: 1,
        //     blurRadius: 5,
        //     offset: Offset(0, 3),
        //   ),
        // ],
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'এই তথ্যটি প্রয়োজনীয়';
        }
        return null;
      },
    );
  }
}
