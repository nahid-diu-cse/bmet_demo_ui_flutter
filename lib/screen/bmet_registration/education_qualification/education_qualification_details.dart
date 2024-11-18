import 'package:bmet_ui/res/components/round_button.dart';
import 'package:bmet_ui/screen/bmet_registration/language_info/language_skill_screen.dart';
import 'package:flutter/material.dart';

import '../../../res/colors/app_colors.dart';
import '../../../res/components/show_properties.dart';

class EducationQualificationDetails extends StatefulWidget {
  @override
  _EducationQualificationDetailsState createState() =>
      _EducationQualificationDetailsState();
}

class _EducationQualificationDetailsState
    extends State<EducationQualificationDetails> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('শিক্ষাগত যোগ্যতার বিবরণ'),
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

                  ShowProperties(title: "বিএমইটি ফর্ম", colorB: Colors.white,colorT: Colors.teal,),
                  ShowProperties(title: "ব্যক্তিগত তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "যোগাযোগের তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "নমিনীর তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "জরুরী যোগাযোগের তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "শিক্ষাগত যোগ্যতার বিবরণ", colorB: Colors.teal, colorT: Colors.white),


                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            EducationDetailCard(
                              educationLevel: 'মাধ্যমিক/দাখিল/ও-লেভেল/সমমান',
                              passingYear: '2010',
                            ),
                            EducationDetailCard(
                              educationLevel:
                                  'উচ্চ মাধ্যমিক/আলিম/এ-লেভেল/সমমান',
                              passingYear: '2016',
                            ),
                            SizedBox(height: 10),
                            Center(
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      // Handle adding more educational details
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min, // Make row's size minimal
                                      children: [
                                        Icon(
                                          Icons.add_circle_outline,
                                          color: AppColor.tealColor,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'আরো যোগ করুন',
                                          style: TextStyle(
                                            color: AppColor.tealColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
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
                      builder: (context) => LanguageSkillScreen()));
              // Handle the next button click
            },
          ),
        ],
      ),
    );
  }
}


class EducationDetailCard extends StatelessWidget {
  final String educationLevel;
  final String passingYear;

  const EducationDetailCard({
    required this.educationLevel,
    required this.passingYear,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.school,
                  color: AppColor.tealColor,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'শিক্ষাগত যোগ্যতা: $educationLevel',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              'পাশের বছর: $passingYear',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
