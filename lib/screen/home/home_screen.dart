import 'dart:ffi';

import 'package:bmet_ui/res/colors/app_colors.dart';
import 'package:bmet_ui/res/routes/routes_name.dart';
import 'package:bmet_ui/screen/clearance/bmet_clearance_screen.dart';
import 'package:bmet_ui/screen/clearance/clearance_step_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: AppColor.tealColor),
          onPressed: () {},
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/login_appbar_icon.JPG',
              width: 130,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.email_outlined, color: AppColor.tealColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your journey abroad',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
                ],
              ),
            ),
            // Green and Blue Cards Section
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Enables horizontal scrolling
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      print('BMET registration card tapped!');
                      // You can also navigate to a new page
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ClearanceStepScreen()));
                    },
                    borderRadius: BorderRadius.circular(8),
                    child: Material(
                      elevation: 5,
                      // Adds elevation for shadow
                      borderRadius: BorderRadius.circular(8),
                      // Matches the Container's border radius
                      shadowColor: Colors.black.withOpacity(0.2),
                      child: Container(
                        height: 130,
                        width: 250,
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.green.shade400,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.assignment_outlined, color: Colors.white),
                            SizedBox(height: 10),
                            Text(
                              'BMET registration',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Register into the databank to search and apply for jobs',
                              style: TextStyle(fontSize: 12, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Material(
                    elevation: 5,
                    // Adds elevation for shadow
                    borderRadius: BorderRadius.circular(8),
                    // Matches the Container's border radius
                    shadowColor: Colors.black.withOpacity(0.2),
                    child: Container(
                      height: 130,
                      width: 250,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.teal.shade400,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.search, color: Colors.white),
                          SizedBox(height: 10),
                          Text(
                            'Search for jobs',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Find your desired jobs',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(
              thickness: 8,
              color: Colors.grey.withOpacity(0.4),
            ),
            // Services Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Services near me',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'View all (10)',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    serviceCard(context, height*.18, width*.3,"assets/images/service_certificate_icon.JPG"),
                    SizedBox(width: 10),
                    serviceCard(context, height*.18, width*.3,"assets/images/ami_probashi.JPG"),
                    SizedBox(width: 10),
                    serviceCard(context, height*.18, width*.3,"assets/images/ami_probashi_brac.JPG"),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Divider(
              color: Colors.grey.withOpacity(0.4),
              thickness: 8,
            ),
            // Help Center Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Help center',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'View all (6)',
                    style: TextStyle(fontSize: 14, color: Colors.blue),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    serviceCard(context, height*.18, width*.3,"assets/images/help1.JPG"),
                    SizedBox(width: 10),
                    serviceCard(context, height*.18, width*.3,"assets/images/help2.JPG"),
                    SizedBox(width: 10),
                    serviceCard(context, height*.18, width*.3,"assets/images/help3.JPG"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_open),
            label: 'My documents',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget card(double height, double width, String text) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(Icons.verified_outlined, size: 30, color: Colors.teal),
    );
  }

  Widget serviceCard(BuildContext context, double height, double width, String image) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(image),
    );
  }
}
