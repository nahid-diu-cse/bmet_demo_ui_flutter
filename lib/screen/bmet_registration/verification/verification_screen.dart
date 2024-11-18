import 'package:bmet_ui/res/colors/app_colors.dart';
import 'package:bmet_ui/res/components/build_progress_indicator.dart';
import 'package:bmet_ui/res/components/round_button.dart';
import 'package:bmet_ui/screen/bmet_registration/payment/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../res/components/show_properties.dart';

class VerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('ভেরিফিকেশন'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BuildProgressIndicator(text: "৭৮", percent: .78),

                  ShowProperties(title: "বিএমইটি ফর্ম", colorB: Colors.white,colorT: Colors.teal,),
                  ShowProperties(title: "ব্যক্তিগত তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "যোগাযোগের তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "নমিনীর তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "জরুরী যোগাযোগের তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "শিক্ষাগত যোগ্যতার বিবরণ", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "ভাষাগত দক্ষতা", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "ভেরিফিকেশন", colorB: Colors.teal, colorT: Colors.white),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFB2EBF2), // Light cyan color
                                Color(0xFF80DEEA), // Slightly darker cyan
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'পাসপোর্ট ভেরিফিকেশন স্ট্যাটাস',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueGrey[900],
                                    ),
                                  ),
                                  Icon(
                                    Icons.verified_user,
                                    color: Colors.blueAccent,
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.0),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 12.0),
                                decoration: BoxDecoration(
                                  color: Colors.orange[100],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'পেন্ডিং',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.orange[800],
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Icon(
                                      Icons.info_outline,
                                      color: Colors.grey[600],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                'ওপেন নেওয়া ডাটা যাচাইয়ের জন্য ৭২ ঘন্টা অপেক্ষা করুন',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blueGrey[800],
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Center(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 14.0, horizontal: 20.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 0,
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(FontAwesomeIcons.fileCirclePlus,
                                      color: Colors.grey),
                                  SizedBox(width: 8.0),
                                  Text(
                                    'সাপোর্টিং ডকুমেন্ট যোগ করুন',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PaymentScreen()));
              // Implement the next action here
            },
          ),
        ],
      ),
    );
  }
}

class VerificationSection extends StatelessWidget {
  final String title;
  final bool isChecked;

  const VerificationSection({
    Key? key,
    required this.title,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 18)),
          Icon(
            isChecked ? Icons.check_circle : Icons.radio_button_unchecked,
            color: isChecked ? AppColor.tealColor : Colors.grey,
          ),
        ],
      ),
    );
  }
}
