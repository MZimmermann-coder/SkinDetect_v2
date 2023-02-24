import 'package:flutter/material.dart';
import 'package:naki_flutter/components/scaffold_with_nav.dart';
import 'package:naki_flutter/util/colors.dart';
import 'package:naki_flutter/util/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/button.dart';
import '../components/custom_app_bar.dart';
import '../util/faq_info.dart';

class QuesitonDetailPage extends StatelessWidget {
  QuesitonDetailPage({required this.questionId}) {
    color.toGray();
  }

  final String questionId;

  @override
  Widget build(BuildContext context) {
    FAQEntry faqEntry =
        faqInfo.firstWhere((entry) => entry.id == int.parse(questionId));
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(color: kGray),
            child: Column(
              children: [
                CustomAppBar(title: "FAQ"),
                Expanded(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            Center(
                                child: Text(
                              faqEntry.question,
                              textAlign: TextAlign.center,
                              style: kAppbarHeader,
                            )),
                            const SizedBox(height: 40),
                            for (final paragraph in faqEntry.description)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  Text(paragraph,
                                      textAlign: paragraph.startsWith("-")
                                          ? TextAlign.start
                                          : TextAlign.justify,
                                      style: kDescriptionStyle)
                                ],
                              ),
                            const SizedBox(
                              height: 40,
                            )
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
              label: faqEntry.linkLabel ?? "More Information",
              onTap: () async {
                final Uri link = faqEntry.buttonLink != null
                    ? Uri.parse(faqEntry.buttonLink!)
                    : faqLink;
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
