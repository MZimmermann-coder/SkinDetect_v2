import 'package:flutter/material.dart';

import '../util/colors.dart';
import '../util/text_styles.dart';

class MyLesionLooksDifferentInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "My lesion looks different",
            style: kAppbarHeader,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Not every lesion of this type looks exactly the same. Therefore it is still possible that you have this type of lesion even-though the description does not perfectly match your case. This diagnosis is also not definitive as this app is only meant to be used in addition to a dermatologist. For further help refer to your personal dermatologist for a medical diagnosis.",
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
