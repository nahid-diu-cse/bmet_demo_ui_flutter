import 'package:bmet_ui/res/components/round_button.dart';
import 'package:bmet_ui/screen/bmet_registration/bmet_card/bmet_card_screen.dart';
import 'package:bmet_ui/screen/pdo/pdo_enrollment_card/pro_enrollment_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PdoPaymentScreen extends StatelessWidget {
  const PdoPaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 4,
        shadowColor: Colors.grey.shade200,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'পেমেন্ট করুন',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Please select one",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 24.h),
              PaymentOptionCard(
                assetPath: 'assets/bkash.png',
                label: 'Pay through bKash',
                onTap: () {},
              ),
              SizedBox(height: 16.h),
              PaymentOptionCard(
                assetPath: 'assets/sslcommerz.png',
                label: 'Pay through SSLCommerz',
                onTap: () {},
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  Expanded(
                    child: Text(
                      "I have read and agree to the Privacy Policy, Refund and Return Policy & Terms and Conditions",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              RoundButton(
                width: width,
                title: "PAY 300.00",
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PdoEnrollmentCardScreen()));
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300, // Light grey background color
                    borderRadius: BorderRadius.circular(8.0), // Rounded corners (optional)
                  ),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Cancel",
                      style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

class PaymentOptionCard extends StatelessWidget {
  final String assetPath;
  final String label;
  final VoidCallback onTap;

  const PaymentOptionCard({
    required this.assetPath,
    required this.label,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 3,
              offset: Offset(0, 5), // Shadow offset for a lifted look
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade200,
              ),
              padding: EdgeInsets.all(8.w),
              child: Image.asset(
                assetPath,
                height: 40.h,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.image,
                  size: 40.h,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              label,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                elevation: 4,
              ),
              child: Text(
                "Learn More",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
