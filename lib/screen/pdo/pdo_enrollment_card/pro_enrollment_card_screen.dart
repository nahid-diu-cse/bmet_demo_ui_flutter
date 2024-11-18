import 'package:bmet_ui/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../res/colors/app_colors.dart';

class PdoEnrollmentCardScreen extends StatelessWidget {
  PdoEnrollmentCardScreen({super.key});


  _showDialogu(BuildContext context,double height, double width){
    showDialog(context: context, builder: (BuildContext context){
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: (){},
              child: Container(
                padding: EdgeInsets.all(20),
                width: width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.green.shade300], // Adjust shade as needed
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: width*.4, // Width and height for the circular box
                      height: width*.4,
                      decoration: BoxDecoration(
                        color: Colors.teal.withOpacity(0.2), // Background color of the circular box
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.person_outline,
                          color: Colors.teal,
                          size: 90,
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text("ছবি যোগ করুন",textAlign:TextAlign.center,style: TextStyle(color: AppColor.tealColor,fontWeight: FontWeight.bold),),
                    Icon(FontAwesomeIcons.circlePlus,color: AppColor.tealColor,)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 50,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                },
                child: Text(
                  'পরবর্তী',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  bool _isChecked = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
          'পিডিও এনরোলমেন্ট কার্ড',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(10),
                  shadowColor: Colors.black,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Card(
                        elevation: 5,
                        // Adds elevation to create a shadow effect
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Adds rounded corners
                        ),
                        shadowColor: Colors.black.withOpacity(0.25),
                        child: Container(
                          width: width,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.white, Colors.green.shade300],
                                // Adjust shade as needed
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "পিডিও এনরোলমেন্ট কার্ড",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Icon(FontAwesomeIcons.gofore)
                                    ],
                                  ),
                                  Text('ইউজার আইডি : 104******'),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.person,
                                        size: width * .4,
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          _nameCol("নাম : ", "Rifat Vuiya"),
                                          _nameCol(
                                              "পাসপোর্ট নম্বর :", "**********"),
                                          _nameCol("ব্যাচ নং :", "**********"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                "উপস্থিতি",
                                style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: _isChecked
                                                  ? Colors.teal
                                                  : Colors.grey,
                                              width: 2.0,
                                            ),
                                            color: _isChecked
                                                ? Colors.teal
                                                : Colors.transparent,
                                          ),
                                          child: _isChecked
                                              ? Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 18,
                                                )
                                              : null,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("১ম দিন")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: _isChecked
                                                  ? Colors.teal
                                                  : Colors.grey,
                                              width: 2.0,
                                            ),
                                            color: _isChecked
                                                ? Colors.teal
                                                : Colors.transparent,
                                          ),
                                          child: _isChecked
                                              ? Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 18,
                                                )
                                              : null,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("২য় দিন")
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: _isChecked
                                                  ? Colors.teal
                                                  : Colors.grey,
                                              width: 2.0,
                                            ),
                                            color: _isChecked
                                                ? Colors.teal
                                                : Colors.transparent,
                                          ),
                                          child: _isChecked
                                              ? Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 18,
                                                )
                                              : null,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("৩য় দিন")
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: _nameCol(
                                          "কারিগরি প্রশিক্ষণ কেন্দ্র :",
                                          "Technical Training Center, Kalihati, Tangail",
                                        )),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Expanded(
                                    child: _nameCol("রোল নং : ", "123****"),
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: _nameCol(
                                          "ক্লাসের তারিখ : ",
                                          "25 Mar 2024 - 28 Mar 2024",
                                        )),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Expanded(
                                    child: _nameCol(
                                        "ক্লাসের সময় : ", "09:00 AM 0 03:30 PM"),
                                  ),
                                ],
                              ),
                              Divider(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: _nameCol(
                                          "দেশ : ",
                                          "Bangladesh",
                                        )),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Expanded(
                                    child: _nameCol("পিতা : ", "MD. Akram Khan"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(16),
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
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: (){
                _showDialogu(context, height, width);
              },
              child: Container(
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                    Border.all(color: AppColor.tealColor, width: 2)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: const Center(
                      child: Text(
                        "ছবি যোগ করুন",
                        style: TextStyle(
                            color: AppColor.tealColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _nameCol(String label, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 13, color: Colors.black),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 13, color: Colors.black),
        ),
      ],
    );
  }
}
