import 'package:bmet_ui/res/colors/app_colors.dart';
import 'package:bmet_ui/res/components/build_progress_indicator.dart';
import 'package:bmet_ui/res/components/round_button.dart';
import 'package:bmet_ui/screen/bmet_registration/verification/verification_screen.dart';
import 'package:flutter/material.dart';

import '../../../res/components/show_properties.dart';

class LanguageSkillScreen extends StatefulWidget {
  @override
  _LanguageSkillScreenState createState() => _LanguageSkillScreenState();
}

class _LanguageSkillScreenState extends State<LanguageSkillScreen> {
  List<Map<String, String>> languages = [];
  String selectedLanguage = "বাংলা";
  String speakingSkill = "মাতৃভাষা";
  String writingSkill = "মাতৃভাষা";

  final List<String> languageOptions = ["বাংলা", "ইংরেজি", "হিন্দি"];
  final List<String> skillOptions = ["মাতৃভাষা", "ভালো", "মোটামুটি"];

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          contentPadding: EdgeInsets.all(16.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.info,
                size: 90,
                color: Colors.grey,
              ),
              SizedBox(height: 16.0),
              Text(
                'তথ্য যাচাই',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'আপনার তথ্য নিশ্চিত হয়েছে, সাবমিট করার আগে একবার দেখে আপনার সমস্ত তথ্য পুনরায় যাচাই করুন, ভুল তথ্য প্রদান করলে আপনার আবেদনের প্রক্রিয়া বিলম্বিত হতে পারে।',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 24.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _showVerificationDialog(context);
                    },
                    child: Text(
                      'পরবর্তী',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.tealColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      _showVerificationDialog(context);
                    },
                    child: Text('রিভিউ'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColor.tealColor,
                      side: BorderSide(color: AppColor.tealColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _showVerificationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          contentPadding: EdgeInsets.all(16.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.info,
                size: 90,
                color: Colors.grey,
              ),
              SizedBox(height: 16.0),
              Text(
                'ভেরিফিকেশন',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'আপনার পাসপোর্ট যাচাইয়ের জন্য পাঠানো হয়েছে। এটি ৭২ ঘণ্টা পর্যন্ত সময় নিতে পারে',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 24.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerificationScreen()));
                },
                child: Text(
                  'ঠিক আছে',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.tealColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('ভাষাগত দক্ষতা'),
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
                  BuildProgressIndicator(text: "৬৭", percent: .67),

                  ShowProperties(title: "বিএমইটি ফর্ম", colorB: Colors.white,colorT: Colors.teal,),
                  ShowProperties(title: "ব্যক্তিগত তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "যোগাযোগের তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "নমিনীর তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "জরুরী যোগাযোগের তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "শিক্ষাগত যোগ্যতার বিবরণ", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "ভাষাগত দক্ষতা", colorB: Colors.teal, colorT: Colors.white),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'ভাষাগত যোগ্যতা',
                            labelStyle: TextStyle(color: Colors.teal[800]),
                            filled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal[800]!, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          ),
                          value: selectedLanguage,
                          items: languageOptions
                              .map((lang) => DropdownMenuItem(
                            value: lang,
                            child: Text(
                              lang,
                              style: TextStyle(color: Colors.teal[900]),
                            ),
                          ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedLanguage = value!;
                            });
                          },
                          dropdownColor: Colors.white,
                        ),
                        SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'মৌখিক দক্ষতা',
                            labelStyle: TextStyle(color: Colors.teal[800]),
                            filled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal[800]!, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          ),
                          value: speakingSkill,
                          items: skillOptions
                              .map((skill) => DropdownMenuItem(
                            value: skill,
                            child: Text(
                              skill,
                              style: TextStyle(color: Colors.teal[900]),
                            ),
                          ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              speakingSkill = value!;
                            });
                          },
                          dropdownColor: Colors.white,
                        ),
                        SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            labelText: 'লিখিত দক্ষতা',
                            labelStyle: TextStyle(color: Colors.teal[800]),
                            filled: false,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal, width: 1.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.teal[800]!, width: 2.0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12),
                          ),
                          value: writingSkill,
                          items: skillOptions
                              .map((skill) => DropdownMenuItem(
                            value: skill,
                            child: Text(
                              skill,
                              style: TextStyle(color: Colors.teal[900]),
                            ),
                          ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              writingSkill = value!;
                            });
                          },
                          dropdownColor: Colors.white,
                        ),
                        SizedBox(height: 20),
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
                        ),
                        SizedBox(height: 20),
                        Container(
                          child: ListView.builder(
                            shrinkWrap: true,
                            // This lets the ListView take only the required space
                            physics: NeverScrollableScrollPhysics(),
                            // Prevents conflicting scroll behavior
                            itemCount: languages.length,
                            itemBuilder: (context, index) {
                              final lang = languages[index];
                              return Card(
                                margin: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                elevation: 5,
                                shadowColor: Colors.grey.withOpacity(0.2),
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 16),
                                  leading: CircleAvatar(
                                    backgroundColor:
                                    Colors.blueAccent.withOpacity(0.8),
                                    child: Icon(
                                      Icons.language,
                                      color: Colors.white,
                                    ),
                                  ),
                                  title: Text(
                                    'ভাষা: ${lang['language']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  subtitle: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'মৌখিক দক্ষতা: ${lang['speakingSkill']} লিখিত দক্ষতা: ${lang['writingSkill']}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  trailing: Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                  ),
                                ),
                              );
                            },
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
              _showInfoDialog(context);
              // Implement the next action here
            },
          )
        ],
      ),
    );
  }
}
