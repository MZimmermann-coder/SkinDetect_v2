import 'package:flutter/material.dart';

import '../util/colors.dart';

class FaqRow extends StatelessWidget {
  const FaqRow(
      {super.key,
      required this.onTap,
      required this.green,
      required this.title,
      required this.subtitle});

  final void Function() onTap;
  final bool green;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
        width: double.infinity,
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: [0.015, 0.015],
                colors: [green ? kGreen : kBlue, Colors.white]),
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
                SizedBox(height: 3),
                Text(subtitle,
                    style: TextStyle(
                        fontSize: 12.0,
                        color: Color.fromRGBO(102, 102, 102, 1))),
              ]),
        ),
      ),
    );
  }
}
