import 'package:flutter/material.dart';
import 'package:skindetect/util/colors.dart';

class Button extends StatefulWidget {
  const Button(
      {super.key, required this.label, required this.onTap, this.withShadow});

  final String label;
  final void Function() onTap;
  final bool? withShadow;

  @override
  State<Button> createState() => ButtonState();
}

class ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 40,
        padding: EdgeInsets.symmetric(horizontal: 25),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: kBlack,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: widget.withShadow != null && widget.withShadow!
                ? [
                    BoxShadow(
                      color: kBlackShadow,
                      offset: Offset(0, 2),
                      blurRadius: 5,
                      blurStyle: BlurStyle.normal,
                      spreadRadius: 1,
                    )
                  ]
                : []),
        child: Text(widget.label,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 16)),
      ),
    );
  }
}
