import 'package:bmet_ui/res/components/build_progress_indicator.dart';
import 'package:bmet_ui/res/components/round_button.dart';
import 'package:bmet_ui/screen/bmet_registration/payment/payment_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../res/components/show_properties.dart';

class PaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('পেমেন্ট করুন'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BuildProgressIndicator(text: "৮২", percent: 0.82),

                  ShowProperties(title: "বিএমইটি ফর্ম", colorB: Colors.white,colorT: Colors.teal,),
                  ShowProperties(title: "ব্যক্তিগত তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "যোগাযোগের তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "নমিনীর তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "জরুরী যোগাযোগের তথ্য", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "শিক্ষাগত যোগ্যতার বিবরণ", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "ভাষাগত দক্ষতা", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "ভেরিফিকেশন", colorB: Colors.white, colorT: Colors.teal),
                  ShowProperties(title: "পেমেন্ট করুন", colorB: Colors.teal, colorT: Colors.white),

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
                                Color(0xFFE0F7FA), // Light teal color
                                Color(0xFFB2EBF2), // Slightly darker teal
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    Icons.check_circle,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.0),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                                decoration: BoxDecoration(
                                  color: Colors.green[100],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'ভেরিফাইড',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.green[800],
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.green[800],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Text(
                                'আপনার পাসপোর্ট যাচাই সম্পন্ন হয়েছে। আপনার সকল তথ্য সঠিক হলে নিচে পেমেন্ট করুন। পেমেন্টের পর তথ্য যাচাই সংক্রান্ত সকল আপডেট আপনাকে জানানো হবে। যেকোনো প্রয়োজনে কাস্টমার কেয়ার টিমের সাথে যোগাযোগ করুন।',
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
            title: "পেমেন্ট করুন",
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const PaymentSelectionScreen()));
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
            color: isChecked ? Colors.green : Colors.grey,
          ),
        ],
      ),
    );
  }
}

// To make the app responsive, MediaQuery is used to adapt widget sizes based on the screen size.
// For a more consistent responsive behavior across devices, use the "flutter_screenutil" package or similar libraries.
