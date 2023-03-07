import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:naki_flutter/blocs/prediction.dart';
import 'package:naki_flutter/components/range_bar.dart';
import 'package:naki_flutter/components/scaffold_with_nav.dart';
import 'package:naki_flutter/data_model/diagnosis.dart';
import 'package:naki_flutter/main.dart';
import 'package:naki_flutter/util/colors.dart';
import 'package:naki_flutter/util/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/button.dart';
import '../components/custom_app_bar.dart';
import '../components/my_lesion_looks_different_info.dart';
import '../util/cancer_type_info.dart';

PredictionCubit predictionBloc = PredictionCubit();

class DiagnosePage extends StatefulWidget {
  DiagnosePage({super.key}) {
    color.toGray();
  }

  @override
  State<DiagnosePage> createState() => _DiagnosePageState();
}

class _DiagnosePageState extends State<DiagnosePage> {
  late Icon currentIcon;

  @override
  void initState() {
    super.initState();
    currentIcon = Icon(
      Icons.save_alt_sharp,
      color: kBlack,
      size: 28,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PredictionCubit, Prediction>(
        bloc: predictionBloc,
        builder: (context, state) {
          CancerTypeEntry cTypeEntry =
              cTypes.firstWhere((entry) => entry.shortLabel == state.label);
          return Stack(
            children: [
              Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(color: kGray),
                  child: Column(
                    children: [
                      CustomAppBar(
                        title: "Diagnosis",
                        trailing: InkWell(
                          onTap: () async {
                            Diagnosis diagnosis = Diagnosis()
                              ..label = state.label
                              ..confidence = state.confidence
                              ..image = state.binaryImg
                              ..createdAt = DateTime.now().toUtc();
                            setState(() {
                              currentIcon = Icon(
                                Icons.check,
                                size: 28,
                                color: kBlack,
                              );
                            });
                            historyBox.add(diagnosis);
                          },
                          child: currentIcon,
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                            child: AspectRatio(
                                                aspectRatio: 1,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    child: Image.memory(
                                                      state.binaryImg,
                                                      alignment:
                                                          Alignment.center,
                                                      fit: BoxFit.cover,
                                                    )))),
                                        const SizedBox(width: 10),
                                        Expanded(
                                            child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Column(children: [
                                            Text(cTypeEntry.type,
                                                textAlign: TextAlign.center,
                                                style: kAppbarHeader),
                                            SizedBox(height: 5),
                                            GestureDetector(
                                                onTap: () => {
                                                      context.push(
                                                          "/faq/ct/${cTypeEntry.id}")
                                                    },
                                                child: Text(
                                                  "Learn more",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: kBlue,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                          ]),
                                        )),
                                      ]),
                                  const SizedBox(height: 30),
                                  RangeBar(
                                    percent: cTypeEntry.risk,
                                    label: "Risk",
                                  ),
                                  const SizedBox(height: 8),
                                  RangeBar(
                                      percent: state.confidence * 0.95,
                                      label: "Certainty",
                                      color: kBlue),
                                  const SizedBox(height: 25),
                                  Text("Details", style: kAppbarHeader),
                                  const SizedBox(height: 10),
                                  Text(cTypeEntry.riskText,
                                      style: TextStyle(
                                          color: kDarkGray, fontSize: 16)),
                                  const SizedBox(height: 20),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(
                                          cTypeEntry.descriptionShort,
                                          textAlign: TextAlign.left,
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
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Button(
                    label: "Find a doctor",
                    onTap: () async {
                      final Uri link =
                          Uri.parse("https://www.doctolib.de/hautarzt");
                      if (await canLaunchUrl(link)) launchUrl(link);
                    },
                    withShadow: true,
                  )
                ]),
              )
            ],
          );
        });
  }
}
