import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundInputField extends StatelessWidget {
  RoundInputField({required this.initVal,required this.labelTxt,super.key});
  String initVal="";
  String labelTxt='';

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initVal,
      decoration: InputDecoration(
        labelText: labelTxt,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(color: Colors.teal[800]), // Label color
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal.shade200, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal[800]!, width: 2.0),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.teal[800]), // Match initial value color to label color
      onChanged: (value) {
        // Handle changes
      },
    );
  }
}
