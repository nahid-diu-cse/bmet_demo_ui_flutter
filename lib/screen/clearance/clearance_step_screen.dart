import 'package:bmet_ui/res/colors/app_colors.dart';
import 'package:bmet_ui/screen/clearance/bmet_clearance_screen.dart';
import 'package:flutter/material.dart';

class ClearanceStepScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'ক্রিয়ারেস এর ধাপ গুলি',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                _buildStepCard(
                  icon: Icons.account_balance,
                  iconColor: Colors.green,
                  title: 'ব্যাংক হিসাব',
                  description:
                  'আপনার একটি বৈধ ব্যাংক অ্যাকাউন্ট এবং ব্যাংক অ্যাকাউন্টের প্রমাণ প্রয়োজন।',
                  status: 'বাধ্যতামূলক',
                  statusColor: Colors.green,
                ),
                _buildDivider(),
                _buildStepCard(
                  icon: Icons.medical_services,
                  iconColor: Colors.orange,
                  title: 'চিকিৎসা ক্রিয়াকলাপ',
                  description:
                  'আপনাকে অবশ্যই একটি তালিকাভুক্ত চিকিৎসা কেন্দ্রের দ্বারা চিকিৎসাগতভাবে পরীক্ষিত হতে হবে।',
                  status: 'বাধ্যতামূলক',
                  statusColor: Colors.green,
                ),
                _buildDivider(),
                _buildStepCard(
                  icon: Icons.assignment,
                  iconColor: Colors.purple,
                  title: 'পিডিও সার্টিফিকেট',
                  description:
                  'আপনি বাধ্যতামূলক প্রি-ডিপারচার ওরিয়েন্টেশন সম্পন্ন করেছেন।',
                  status: 'বাধ্যতামূলক',
                  statusColor: Colors.green,
                ),
                _buildDivider(),
                _buildStepCard(
                  icon: Icons.description,
                  iconColor: Colors.teal,
                  title: 'চাকরির ডকুমেন্ট',
                  description:
                  'বিদেশে আপনার নিয়োগকর্তার কাছ থেকে আপনার একটি কর্মসংস্থান ডকুমেন্ট প্রয়োজন হতে পারে।',
                  status: 'অপশনাল',
                  statusColor: Colors.orange,
                ),
                _buildDivider(),
                _buildStepCard(
                  icon: Icons.file_copy,
                  iconColor: Colors.red,
                  title: 'কাজের অনুমতি',
                  description:
                  'আপনার গন্তব্য দেশের জন্য আপনার একটি ওয়ার্ক পারমিটের প্রয়োজন হতে পারে।',
                  status: 'অপশনাল',
                  statusColor: Colors.orange,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => BmetClearanceScreen()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.tealColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Center(
                child: Text(
                  'আবেদন প্রক্রিয়া শুরু করুন',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepCard({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String description,
    required String status,
    required Color statusColor,
  }) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: iconColor.withOpacity(0.2),
              child: Icon(icon, color: iconColor, size: 24),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: statusColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Column(
      children: [
        Row(
          children: [
            Spacer(),
            Icon(Icons.arrow_downward, size: 20, color: Colors.grey),
            Spacer(),
          ],
        ),
        SizedBox(height: 8),
      ],
    );
  }
}


