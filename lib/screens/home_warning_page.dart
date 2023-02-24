import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naki_flutter/components/button.dart';
import 'package:naki_flutter/components/scaffold_with_nav.dart';
import 'package:naki_flutter/util/colors.dart';

class HomeWarningPage extends StatelessWidget {
  HomeWarningPage() {
    color.toGreen();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(color: kGreen),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(Icons.warning_sharp, size: 100),
        const SizedBox(height: 10),
        Text(
            "The following result is only a prediction based on our Neural Network. This app does not replace a regular dermatologist. The prediction may be wrong.",
            textAlign: TextAlign.justify,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: kBlack,
                height: 1.3)),
        const SizedBox(height: 40),
        SizedBox(
            width: double.infinity,
            child: Button(
                label: "I understand",
                onTap: () => {context.pushReplacement("/home/diagnose")})),
      ]),
    );
  }
}
