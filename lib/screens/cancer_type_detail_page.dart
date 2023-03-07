import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:skindetect/components/range_bar.dart';
import 'package:skindetect/components/scaffold_with_nav.dart';
import 'package:skindetect/util/colors.dart';
import 'package:skindetect/util/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/button.dart';
import '../components/custom_app_bar.dart';
import '../components/my_lesion_looks_different_info.dart';
import '../util/cancer_type_info.dart';
import '../util/faq_info.dart';
import '../util/triangle_clipper.dart';

class CancerTypeDetailPage extends StatelessWidget {
  CancerTypeDetailPage({required this.cancerTypeId}) {
    color.toGray();
  }

  final String cancerTypeId;

  @override
  Widget build(BuildContext context) {
    CancerTypeEntry cTypeEntry =
        cTypes.firstWhere((entry) => entry.id == int.parse(cancerTypeId));
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(color: kGray),
            child: Column(
              children: [
                CustomAppBar(title: "Info"),
                Expanded(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                      child: AspectRatio(
                                          aspectRatio: 1,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image(
                                                image: AssetImage(
                                                    cTypeEntry.picture),
                                                alignment: Alignment.center,
                                                fit: BoxFit.cover,
                                              )))),
                                  const SizedBox(width: 10),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.only(left: 15),
                                    child: Text(cTypeEntry.type,
                                        textAlign: TextAlign.center,
                                        style: kAppbarHeader),
                                  )),
                                ]),
                            const SizedBox(height: 30),
                            RangeBar(percent: cTypeEntry.risk, label: "Risk"),
                            const SizedBox(height: 25),
                            Text("Details", style: kAppbarHeader),
                            const SizedBox(height: 10),
                            Text(cTypeEntry.riskText,
                                style:
                                    TextStyle(color: kDarkGray, fontSize: 16)),
                            const SizedBox(height: 20),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    cTypeEntry.description,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  )
                                ]),
                            const SizedBox(height: 30),
                            MyLesionLooksDifferentInfo(),
                            const SizedBox(
                              height: 40,
                            ),
                          ])),
                )
              ],
            )),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Button(
              label: cTypeEntry.linkLabel ?? "More Information",
              onTap: () async {
                final Uri link = Uri.parse(cTypeEntry.link);
                if (await canLaunchUrl(link)) launchUrl(link);
              },
              withShadow: true,
            )
          ]),
        )
      ],
    );
  }
}
