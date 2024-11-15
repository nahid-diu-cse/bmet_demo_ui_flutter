import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../res/colors/app_colors.dart';

class PaymentSummaryScreen extends StatelessWidget {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('পেমেন্ট সামারি'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
                    padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Progress Bar

                        SizedBox(height: 16),

                        // Nominal Fee Section
                        FeeSection(
                          icon: Icons.credit_card,
                          title: 'নমিনাল ফি',
                          description:
                          'বিবিএমইটি ক্লিয়ারেন্স এর জন্য আবেদন করতে, আপনাকে একটি অফেরতযোগ্য নমিনাল ফি দিতে হবে। ',
                          amount: '50 Tk',
                          highlightText: 'এখন মোট প্রযোজ্য',
                          iconBackground: Colors.green[50],
                        ),

                        SizedBox(height: 30),

                        // Additional Section After Nominal Fee
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.credit_card,
                                    color: AppColor.tealColor,
                                    size: 40,
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'সরকারি ফি',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'একবার আপনার BMET ক্লিয়ারেন্স আবেদন অনুমোদিত হলে, আপনার QR-ভিত্তিক ক্লিয়ারেন্স কার্ড এক্সেস করার জন্য আপনাকে সম্পূর্ণ সরকারি ফী দিতে হবে। ',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        _Fee(context, "সরকারি ফিস", '5550 Tk', "পরে মোট প্রদেয় ", "5550 Tk"),

                        SizedBox(height: 20),

                        // Fee Breakdown Section
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200, // Light grey background
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1), // Light shadow color
                                blurRadius: 8,
                                offset: Offset(0, 2), // Adjust the offset for a slight shadow effect
                              ),
                            ],
                          ),
                          child: const ExpansionTile(
                            title: Text('ফি বিবরণ', style: TextStyle(fontWeight: FontWeight.bold)),
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('ফি টাইপ', style: TextStyle(fontWeight: FontWeight.bold)),
                                        Text('টাকার পরিমাণ', style: TextStyle(fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Divider(),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Welfare - Welfare & Insurance fee'),
                                        Text('4500 Tk'),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Tax - Advance tax'),
                                        Text('400 Tk'),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('AP - Service charge'),
                                        Text('650 Tk'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),


                        SizedBox(height: 30),

                        // Warning Box
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center, // Center-aligns the text
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'শুধুমাত্র অনলাইনে পেমেন্ট প্রযোজ্য।\n', // First line
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16, // Optional: Adjust font size
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'কাস্টমার পেমেন্ট করবেন না।', // Second line
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14, // Optional: Adjust font size
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),

                        // Confirmation Checkbox
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start, // Aligns children to the start horizontally
                            crossAxisAlignment: CrossAxisAlignment.center, // Centers children vertically
                            children: [
                              Checkbox(
                                value: isChecked,
                                activeColor: Colors.blue,
                                onChanged: (bool? value) {
                                  // Handle checkbox change
                                },
                              ),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    text: 'আমি পড়েছি এবং সম্মত হয়েছি ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'গোপনীয়তা নীতি',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 14,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Handle privacy policy link tap
                                            print('Privacy Policy tapped');
                                          },
                                      ),
                                      TextSpan(
                                        text: ', বিক্রয় এবং রিটার্ন নীতি ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '& শর্তাবলী',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 14,
                                          decoration: TextDecoration.underline,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            // Handle terms and conditions link tap
                                            print('Terms and Conditions tapped');
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentSummaryScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.tealColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'পেমেন্ট সম্পন্ন করুন',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildProgressIndicator() {
    return LinearPercentIndicator(
      padding: EdgeInsets.symmetric(horizontal: 15),
      lineHeight: 30,
      percent: 1,
      center: Text("১০০%"),
      barRadius: Radius.circular(10),
      linearGradient: LinearGradient(
        colors: [
          AppColor.progressBarColor1,
          AppColor.progressBarColor2,
        ],
      ),
      animateFromLastPercent: true,
      animation: true,
    );
  }
}

class FeeSection extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final String amount;
  final String highlightText;
  final Color? iconBackground;

  const FeeSection({
    required this.icon,
    required this.title,
    required this.description,
    required this.amount,
    required this.highlightText,
    this.iconBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 40, color: AppColor.tealColor),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 4),
                  Text(description, style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        _Fee(context, "নমিনাল ফি", '50 Tk', "এখন মোট প্রদান", "50 Tk"),
      ],
    );
  }
}

Widget _Fee(BuildContext context, String t1, String r1, String t2, String r2) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      // Top text section
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              blurRadius: 10, // Softness of the shadow
              offset: Offset(0, 4), // Offset in X and Y directions
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              t1,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10),
            Text(
              r1,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 5),
      // Bottom button section
      Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: AppColor.tealColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Shadow color
              blurRadius: 10, // Softness of the shadow
              offset: Offset(0, 4), // Offset in X and Y directions
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              t2,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 10),
            Text(
              r2,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
