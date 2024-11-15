import 'package:bmet_ui/res/colors/app_colors.dart';
import 'package:bmet_ui/screen/summary/total_summary_screen.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class DocumentSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'ডকুমেন্টস সামারি',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.green),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      _buildProgressIndicator(),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            const Text('প্রয়োজনীয় কাগজপত্র',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold)),
                            const Divider(thickness: 1,),
                            LayoutBuilder(
                              builder: (context, constraints) {
                                int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2;
                                return GridView.builder(
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: crossAxisCount,
                                    crossAxisSpacing: 16,
                                    mainAxisSpacing: 16,
                                    childAspectRatio: 0.8,
                                  ),
                                  itemCount: 4,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return _buildDocumentCard(
                                        ['চাকরির ফাইলপত্র', 'ভিসা নথি', 'কাজের অনুমতি', 'ব্যাংক ডকুমেন্ট'][index],
                                        [Colors.blue, Colors.purple, Colors.green, Colors.teal][index]);
                                  },
                                );
                              },
                            ),
                            SizedBox(height: 16),
                            Center(
                              child: Container(
                                width: width*.6,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ElevatedButton.icon(
                                    onPressed: () => _showAddDocumentDialog(context),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      side: BorderSide(color: AppColor.tealColor),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      padding: EdgeInsets.symmetric(vertical: 16),
                                    ),
                                    icon: Icon(Icons.add_box_outlined, color: AppColor.tealColor),
                                    label: Text('আরো যোগ করুন',
                                        style: TextStyle(color: Colors.green, fontSize: 16)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: AppColor.tealColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'পূর্ববর্তী',
                      style: TextStyle(color: AppColor.tealColor, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TotalSummaryScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.tealColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      'পরের পেইজ',
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

  Widget _buildDocumentCard(String title, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.folder, color: color, size: 90),
                  SizedBox(height: 8),
                  Text(
                    title,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle, color: Colors.white),
                        SizedBox(width: 8),
                        Text('দেখুন',
                            style: TextStyle(color: Colors.white, fontSize: 14)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: Icon(Icons.edit, color: color, size: 20),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddDocumentDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('ডকুমেন্ট যোগ করুন'),
          content: Container(
            width: double.maxFinite,
            child: ListView(
              children: [
                ListTile(title: Text('নথি আপলোড করুন')),
                ListTile(title: Text('দাবিনামা')),
                ListTile(title: Text('বিমান টিকিট')),
                ListTile(title: Text('প্রত্যয়ের নকল')),
                ListTile(title: Text('শিক্ষা সনদপত্র')),
                ListTile(title: Text('জীবনবীমা')),
                ListTile(title: Text('স্বাস্থ্য বীমা')),
                ListTile(title: Text('পুলিশ ক্লিয়ারেন্স')),
                ListTile(title: Text('সিভি')),
                ListTile(title: Text('জন্ম সনদ')),
                ListTile(title: Text('নিয়োগকারী সংস্থা এর সাথে চুক্তি')),
                ListTile(title: Text('অন্যান্য')),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('বন্ধ করুন'),
            ),
          ],
        );
      },
    );
  }
}
