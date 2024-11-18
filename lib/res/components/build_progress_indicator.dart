import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BuildProgressIndicator extends StatelessWidget {
  BuildProgressIndicator(
      {super.key,
      required this.text,
      required this.percent});

  final String text;
  double percent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: LinearPercentIndicator(
        padding: EdgeInsets.zero,
        lineHeight: 30,
        percent: percent,
        center: Text("$text%",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        barRadius: Radius.circular(15),
        linearGradient: LinearGradient(
          colors: [Colors.teal.shade300, Colors.teal.shade700],
        ),
        animateFromLastPercent: true,
        animation: true,
      ),
    );
  }
}
