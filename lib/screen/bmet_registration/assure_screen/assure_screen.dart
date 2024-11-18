import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomPopup extends StatelessWidget {
  const CustomPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 16,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            const Icon(
              FontAwesomeIcons.peopleArrows,
              size: 60,
              color: Colors.teal,
            ),
            const SizedBox(height: 16),
            // Title
            const Text(
              "বিদেশে কর্মসংস্থান এর জন্য প্রবাসী কল্যাণ প্রতিটি ধাপে আপনার সঙ্গেই থাকবে",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
            // Description List
            const Column(
              children: [
                ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.green),
                  title: Text(
                    "বিএমইটিতে আবেদন প্রক্রিয়া শুরু করুন ও বিদেশে চাকরির সন্ধান করুন ",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.green),
                  title: Text(
                    "বিদেশে চাকরি পাওয়ার সম্ভাবনা বাড়াতে বিভিন্ন ধরণের ট্রেনিং কোর্স এখন আপনার হাতের নাগালে",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.check_circle, color: Colors.green),
                  title: Text(
                    "প্রবাসে থাকাকালীন সময়ে যেকোনো ধরনের সাহায্য ও সহায়তা এখন আপনার হাতের মুঠোয়",
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Confirmation Button
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                "ঠিক আছে",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
