import 'package:bmet_ui/res/colors/app_colors.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/components/round_button.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../../view_model/controller/login/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginController = Get.put(LoginViewModel());
  bool isEnglishSelected = true;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        automaticallyImplyLeading: false,
        elevation: 0,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/login_appbar_icon.JPG',
                    width: 130,
                  ),
                  Container(
                    padding: const EdgeInsets.all(3.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // Background color
                      borderRadius: BorderRadius.circular(20),
                      // Rounded corners
                      border: Border.all(color: Colors.teal), // Border color
                    ),
                    child: Row(
                      children: [
                        // English Button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isEnglishSelected = true;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                              color: isEnglishSelected
                                  ? AppColor.tealColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "EN",
                              style: TextStyle(
                                color: isEnglishSelected
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        // Bangla Button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isEnglishSelected = false;
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 12),
                            decoration: BoxDecoration(
                              color: !isEnglishSelected
                                  ? AppColor.tealColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "বাং", // Bangla text
                              style: TextStyle(
                                color: !isEnglishSelected
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            const Center(
              child: Text(
                'Mobile number',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200, // Light grey background
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                  child: Row(
                    children: [
                      const CountryCodePicker(
                        initialSelection: "BD",
                        favorite: ['+880', 'BD'],
                        showCountryOnly: false,
                        flagWidth: 15,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                      Transform.translate(
                        offset: const Offset(-15, 0),
                        // Adjust offset to remove gap
                        child: const Icon(
                          Icons.arrow_drop_down, // Down arrow icon
                          size: 16, // Adjust size as needed
                          color:
                              Colors.grey, // Adjust color to match your theme
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Enter your mobile number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        // Set the radius to 5
                        borderSide: BorderSide.none, // No visible border
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        // Set the radius to 5
                        borderSide: BorderSide.none, // No visible border
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        // Set the radius to 5
                        borderSide: BorderSide.none, // No visible border
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.toNamed(RoutesName.homeScreen);
              },
              child: Text(
                'Continue',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                backgroundColor: Colors.grey.shade500, // Set deep grey color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Set radius to 10
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
                Expanded(
                  child: RichText(
                    text: const TextSpan(
                      text: 'By signing up, you agree to our ',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Privacy policy',
                          style: TextStyle(color: Colors.blue),
                        ),
                        TextSpan(
                          text: ' and ',
                        ),
                        TextSpan(
                          text: 'Terms and Conditions.',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            const Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('OR'),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.email_outlined),
                ),
                SizedBox(width: 20),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.g_mobiledata_outlined),
                ),
                SizedBox(width: 20),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.facebook_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
