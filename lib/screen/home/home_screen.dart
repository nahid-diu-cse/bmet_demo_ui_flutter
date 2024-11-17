import 'package:bmet_ui/res/colors/app_colors.dart';
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

            // Image.asset(
            //   'assets/images/login_appbar_icon.JPG',
            //   width: width * 0.35,
            // ),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              const Padding(
                padding: EdgeInsets.only(top: 16.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your journey abroad',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
                  ],
                ),
              ),
              // Green and Blue Cards Section
              SizedBox(
                height: height * 0.2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildFeatureCard(
                      context,
                      color: Colors.green.shade400,
                      icon: Icons.assignment_outlined,
                      title: 'BMET registration',
                      description: 'Register into the databank to search and apply for jobs',
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ClearanceStepScreen()));
                      },
                    ),
                    SizedBox(width: 16),
                    _buildFeatureCard(
                      context,
                      color: Colors.teal.shade400,
                      icon: Icons.search,
                      title: 'Search for jobs',
                      description: 'Find your desired jobs',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(thickness: 8, color: Colors.grey.withOpacity(0.4)),
              // Services Section
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Services near me',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'View all (10)',
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    serviceCard(context, "assets/images/service_certificate_icon.JPG"),
                    SizedBox(width: 16),
                    serviceCard(context, "assets/images/ami_probashi.JPG"),
                    SizedBox(width: 16),
                    serviceCard(context, "assets/images/ami_probashi_brac.JPG"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(thickness: 8, color: Colors.grey.withOpacity(0.4)),
              // Help Center Section
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Help center',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'View all (6)',
                      style: TextStyle(fontSize: 14, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.2,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    serviceCard(context, "assets/images/help1.JPG"),
                    SizedBox(width: 16),
                    serviceCard(context, "assets/images/help2.JPG"),
                    SizedBox(width: 16),
                    serviceCard(context, "assets/images/help3.JPG"),
                  ],
                ),
              ),
            ],
          ),
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

  Widget _buildFeatureCard(BuildContext context,
      {required Color color,
        required IconData icon,
        required String title,
        required String description,
        required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(16),
        shadowColor: Colors.black.withOpacity(0.2),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: Colors.white, size: 32),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 8),
              Text(
                description,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget serviceCard(BuildContext context, String image) {
    double height = MediaQuery.of(context).size.height * 0.18;
    double width = MediaQuery.of(context).size.width * 0.35;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
