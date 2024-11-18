import 'package:bmet_ui/res/components/round_button.dart';
import 'package:bmet_ui/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/colors/app_colors.dart';

class BMITCardScreen extends StatefulWidget {
  BMITCardScreen({Key? key}) : super(key: key);

  @override
  State<BMITCardScreen> createState() => _BMITCardScreenState();
}

class _BMITCardScreenState extends State<BMITCardScreen> {
  List<Map<String, String>> seeMore = [];

  String selectedOption = "বিস্তারিত দেখুন";

  final List<String> seeMoreOption = ["বিস্তারিত দেখুন"];

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: AppColor.tealColor),
        //   onPressed: () {},
        // ),
        title: Text(
          "আপনার বিএমআইটি কার্ড",
          style: TextStyle(color: Colors.black, fontSize: 18.sp),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.download, ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: AppColor.tealColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(16.r), // Smoother rounded corners
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 3,
                            offset: Offset(0, 5), // Enhanced shadow effect
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
                                "বিএমইটি রেজিস্ট্রেশন ফরম",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.teal.shade900,
                                ),
                              ),
                              Icon(Icons.info_outline, color: Colors.teal.shade700),
                            ],
                          ),
                          _buildField(label: "বিএমইটি নম্বর", value: "**********"),
                          Divider(),
                          _buildField(label: "নাম", value: "Nahid Hasan"),
                          Divider(),
                          _buildField(label: "পাসপোর্ট নম্বর", value: "123***********"),
                          Divider(),
                          _buildField(label: "পিতা", value: "Md. Chan Mia"),
                          Divider(),
                          _buildField(label: "লিঙ্গ", value: "Male"),
                          Divider(),
                          DropdownButtonFormField<String>(
                            value: selectedOption,
                            items: seeMoreOption
                                .map((lang) => DropdownMenuItem(
                              value: lang,
                              child: Text(lang),
                            ))
                                .toList(),
                            onChanged: (value) {
                            },
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 32.h), // Increased spacing for better balance
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColor.tealColor,
                            width: 4.0,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Image.asset(
                          'assets/qr_code.png',
                          height: 150.h,
                          width: 150.w,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(
                            Icons.qr_code,
                            size: 150.h,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h), // Increased spacing for a balanced look
                  ],
                ),
              ),
            ),
          ),
          RoundButton(
            width: width, // Made button width relative for a better fit
            title: "সাপোর্টিং ডকুমেন্ট যোগ করুন",
            onPress: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
            },
            buttonColor: AppColor.tealColor, // Use theme color for consistency
            textColor: Colors.white,
          ),
        ],
      ),

    );
  }

  Widget _buildField({required String label, required String value}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(
              label,
              style: TextStyle(fontSize: 14.sp, color: Colors.black54),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              value,
              style: TextStyle(fontSize: 14.sp, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
