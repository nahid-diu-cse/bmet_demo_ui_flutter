import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowProperties extends StatelessWidget {
  ShowProperties({required this.title,required this.colorB,required this.colorT,super.key});
  String title;
  Color colorB;
  Color colorT;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: colorB.withOpacity(0.4),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: colorT
            ),
          ),
          Icon(Icons.blur_circular,color: colorT,)
        ],
      ),
    );
  }
}
