import 'package:bmet_ui/res/colors/app_colors.dart';
import 'package:bmet_ui/res/components/build_progress_indicator.dart';
import 'package:bmet_ui/res/components/round_button.dart';
import 'package:bmet_ui/res/components/show_properties.dart';
import 'package:bmet_ui/screen/bmet_registration/personal_info/personal_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart'; // for date picker formatting

class BMITFormScreen extends StatefulWidget {
  const BMITFormScreen({super.key});

  @override
  _BMITFormScreenState createState() => _BMITFormScreenState();
}

class _BMITFormScreenState extends State<BMITFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passportController = TextEditingController();
  final TextEditingController _dateController1 = TextEditingController();
  final TextEditingController _dateController2 = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showRegistrationPopup();
    });
  }

  void _showPassportDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        'পাসপোর্ট স্ক্যান করুন',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'ফ্রেমের মধ্যে আপনার পাসপোর্টের তথ্য সম্পন্ন পাতা ধরে রাখুন এবং ছবি তুলুন',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Image.asset(
                        'assets/images/passport_image.jpg',
                        // Add an appropriate passport placeholder image in your assets
                        height: 150,
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        icon: Icon(Icons.photo_library),
                        label: Text('গ্যালারি'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Add logic for gallery pick here
                        },
                      ),
                      ElevatedButton.icon(
                        icon: Icon(Icons.camera_alt),
                        label: Text('ক্যামেরা'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          // Add logic for camera here
                        },
                      ),
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.tealColor,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'পরবর্তী',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        );
      },
    );
  }


  void showApplicationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    FontAwesomeIcons.page4,
                    color: Colors.grey,
                    size: 60,
                  ),
                  SizedBox(height: 20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.description, size: 40, color: Colors.green),
                      SizedBox(width: 10),
                      Text(
                        'আবেদন শুরু করুন',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  bulletPoint('৫ মিনিটে সম্পূর্ণ করুন'),
                  bulletPoint('চাকরি খুঁজুন'),
                  bulletPoint(
                      'সরকারি চাকরি নির্ধারণ করার জন্য বিয়টি তথ্য ভালোভাবে আপনাকে জানতে দিন'),
                  bulletPoint(
                      'বিএম ও টি রেজিস্ট্রেশন এর মাধ্যমে নিবন্ধনকারীরা প্রার্থী আপ্লিকেশন রেজিস্ট্রেশন ও আবেদনকার পাবে'),
                  SizedBox(height: 20),
                  const Text(
                    'মাত্র ১০০০ টাকা প্রদান করে মাধ্যমে রেজিস্ট্রেশন প্রক্রিয়াটি সম্পূর্ণ করুন। রেজিস্ট্রেশন প্রক্রিয়া সফল করার জন্য আপনার পাসপোর্ট থাকা আবশ্যক।',
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        _showPassportDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.tealColor,
                        padding:
                            EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'পাসপোর্ট স্ক্যান করুন',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 24),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }

  void _showRegistrationPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.assignment_outlined,
                        size: 60,
                        color: Colors.teal,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'বিএমআইটি রেজিস্ট্রেশন',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'বিদেশে চাকরি নিয়ে যেতে সরকারি তথ্য ভান্ডার বিএমআইটি-তে রেজিস্ট্রেশন করা বাধ্যতামূলক। সহজ কিছু ধাপ পারিয়ে করুন সফলভাবে আপনার বিএমআইটি রেজিস্ট্রেশন।',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                SizedBox(height: 10),
                Text(
                  '• বিএমআইটি তথ্য ভান্ডার রেজিস্ট্রেশন কোন চাকরির নিশ্চয়তা নয়!',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'আপনি কোন দেশে যেতে ইচ্ছুক?',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade600,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Image.network(
                            //   'https://upload.wikimedia.org/wikipedia/commons/6/66/Flag_of_Malaysia.svg',
                            //   width: 20,
                            //   height: 20,
                            // ),
                            SizedBox(width: 10),
                            Text(
                              'মালয়েশিয়া',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey.shade700,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.public, color: Colors.white),
                            SizedBox(width: 10),
                            Text(
                              'অন্যন্য দেশ',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      showApplicationDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal.shade700,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'পরবর্তী',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null)
      setState(() {
        controller.text = DateFormat('dd-MM-yyyy').format(picked);
      });
  }

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'বিএমইটি ফর্ম',
          style: TextStyle(color: Colors.black,fontSize: 18),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    BuildProgressIndicator(text: "0", percent: .05),
                    ShowProperties(title: "বিএমইটি ফর্ম", colorB: Colors.teal,colorT: Colors.white,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            _buildTextField(width, "আপনার নাম", "Nabil Khan"),
                            SizedBox(height: 16),
                            const Text("পাসপোর্ট নম্বর",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87)),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildTextField(width, "পাসপোর্ট", "A123****"),
                                ),
                                IconButton(
                                  icon: Icon(Icons.camera_alt, color: Colors.teal.shade700),
                                  onPressed: () {
                                    // Implement camera feature here
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            _buildTextField(width, "পাসপোর্ট ইস্যু তারিখ", "DD-MM-YYYY"),
                            SizedBox(height: 16),
                            _buildTextField(width, "পাসপোর্ট মেয়াদ শেষ হওয়ার তারিখ", "DD-MM-YYYY"),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildTextField(width, "জাতীয় পরিচয়পত্র নম্বর", "জাতীয় পরিচয়পত্র নম্বর")
                                ),
                                IconButton(
                                  icon: Icon(Icons.camera_alt, color: Colors.teal.shade700),
                                  onPressed: () {
                                    // Implement camera feature here
                                  },
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            _buildTextField(width, "জন্ম তারিখ", "DD-MM-YYYY"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          RoundButton(title: "জমা দিন",width: width, onPress: () {
            if (_formKey.currentState!.validate()) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('তথ্য সফলভাবে জমা হয়েছে')),
              );
            }
            Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalInfoScreen()));
          },),
        ],
      ),
    );
  }

  Widget _buildTextField(double width,String label, String hint, {bool showInfo = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            if (showInfo)
              Container(
                width: width * .25,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.tealColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  ),
                  child: const Text('এটা কি?',
                      style:
                      TextStyle(color: Colors.white, fontSize: 12)),
                ),
              ),
          ],
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color:AppColor.tealColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColor.tealColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColor.tealColor, width: 2),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
