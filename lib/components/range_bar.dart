import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../util/colors.dart';
import '../util/triangle_clipper.dart';

class RangeBar extends StatelessWidget {
  const RangeBar(
      {super.key, required this.percent, required this.label, this.color});

  final double percent;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
        borderType: BorderType.RRect,
        color: kDarkGray,
        strokeWidth: 1,
        borderPadding: EdgeInsets.all(1.5),
        dashPattern: [4],
        radius: Radius.circular(15),
        child: Container(
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                          decoration: BoxDecoration(
                              color: color ?? kGreen,
                              borderRadius: BorderRadius.circular(13)),
                          child: Center(
                              child: Text(label,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14))))),
                  const SizedBox(width: 10),
                  Expanded(
                      flex: 7,
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment(-1.0 + percent * 2, 0.5),
                              child: ClipPath(
                                clipper: TriangleClipper(),
                                child: Container(
                                  color: color ?? kGreen,
                                  height: 20,
                                  width: 20,
                                ),
                              )),
                          const SizedBox(height: 1),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Container(
                              height: 3,
                              decoration: BoxDecoration(color: kDarkGray),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Low",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: kBlack,
                                    )),
                                Text("High",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: kBlack,
                                    ))
                              ],
                            ),
                          )
                        ],
                      )
                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: kGreen,
                      //       borderRadius:
                      //           BorderRadius.circular(
                      //               8)),
                      // )
                      )
                ],
              ),
            )));
  }
}
