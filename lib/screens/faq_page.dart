import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:naki_flutter/components/scaffold_with_nav.dart';
import 'package:naki_flutter/util/cancer_type_info.dart';
import 'package:naki_flutter/util/faq_info.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/button.dart';
import '../components/faq_row.dart';

final contactLink = Uri.parse(
    "mailto:skindetect@gmail.com?subject=SkinDetect App Support&body=Please write your question here...");

class FaqPage extends StatelessWidget {
  FaqPage() {
    color.toGray();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(22, 30, 22, 0),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Help",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "All you need to know",
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 40),
            Text(
              "FAQ's",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            for (final faqEntry in faqInfo)
              FaqRow(
                  onTap: () async => {
                        if (faqEntry.link == null)
                          context.push("/faq/q/${faqEntry.id}")
                        else if (await canLaunchUrl(Uri.parse(faqEntry.link!)))
                          await launchUrl(Uri.parse(faqEntry.link!))
                        else
                          throw "Could not launch ${faqEntry.link}"
                      },
                  green: false,
                  title: faqEntry.question,
                  subtitle: faqEntry.subtitle),
            const SizedBox(height: 30),
            Text(
              "Types of skin lesions",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            for (final cType in cTypes)
              FaqRow(
                  onTap: () async => context.push("/faq/ct/${cType.id}"),
                  green: true,
                  title: cType.type,
                  subtitle: cType.riskText),
            SizedBox(height: 60),
          ],
        )),
      ),
      Positioned(
        bottom: 20,
        left: 0,
        right: 0,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Button(
            label: "Contact Us",
            onTap: () async {
              launchUrl(contactLink);
            },
            withShadow: true,
          )
        ]),
      )
    ]);
  }
}
