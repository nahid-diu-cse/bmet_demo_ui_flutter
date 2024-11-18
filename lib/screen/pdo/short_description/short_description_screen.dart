import 'package:bmet_ui/res/components/round_button.dart';
import 'package:bmet_ui/screen/pdo/pdo_payment/pdo_payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShortDescriptionScreen extends StatefulWidget {
  const ShortDescriptionScreen({super.key});

  @override
  State<ShortDescriptionScreen> createState() => _ShortDescriptionScreenState();
}

class _ShortDescriptionScreenState extends State<ShortDescriptionScreen> {

  _showDialogu(BuildContext context,double height, double width){
    showDialog(context: context, builder: (BuildContext context){
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40.0),
                    child: Container(
                      width: 120, // Width and height for the circular box
                      height: 120,
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
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const Text(
                    'পিডিও এনরোলমেন্ট কার্ড',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'আপনি সফলভাবে পেমেন্ট সম্পন্ন করার পরে একটি QR Code সংবলিত এনরোলমেন্ট কার্ড পাবেন যা আপনি আপনার পিডিও সেশনের ক্লাসের সময়ে ব্যবহার করবেন।',
                    style: TextStyle(fontSize:14),
                    textAlign: TextAlign.center,
                  ),
                ],
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PdoPaymentScreen()));
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

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
        title: Text(
          'সংক্ষিপ্ত বিবরণ',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(5)),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "নির্ধারিত সময়ের মধ্যে পেমেন্ট সম্পন্ন করে আপনার কাঙ্কিত বুকিং নিশ্চিত করুন",
                              style: TextStyle(color: Colors.red, fontSize: 16),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "বাকি : 19 মিনিট 57 সেকেন্ড ",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Card(
                        elevation: 5,
                        // Adds elevation to create a shadow effect
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10), // Adds rounded corners
                        ),
                        shadowColor: Colors.black.withOpacity(0.25),
                        // Shadow color for a subtle effect
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green.withOpacity(0.2),
                            // Light background color
                            borderRadius: BorderRadius.circular(15),
                            // Same as Card border radius for consistency
                            border: Border.all(
                                color: Colors.green.withOpacity(
                                    0.5)), // Adds a border for a subtle effect
                          ),
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _nameCol("পাসপোর্ট নং", "A123 *** ***"),
                                    SizedBox(height: 16),
                                    _nameCol(
                                        "পিতার নাম", "Mohammad Abdur Rahman"),
                                    SizedBox(height: 16),
                                    _nameCol("জন্ম তারিখ", "05-12-1998"),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _nameCol("নাম", "Arafat Rahman"),
                                    SizedBox(height: 16),
                                    _nameCol("মাতার নাম", "Sahera Begum"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            RoundButton(
              width: width,
              title: "পেমেন্ট করুন",
              onPress: () {
                _showDialogu(context,height,width);
              },
            ),
          ],
        ),
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
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
        Text(
          title,
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ],
    );
  }
}


