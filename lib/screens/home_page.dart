import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naki_flutter/components/button.dart';
import 'package:naki_flutter/components/scaffold_with_nav.dart';
import 'package:naki_flutter/screens/diagnose_page.dart';
import 'package:naki_flutter/util/colors.dart';
import 'package:tflite/tflite.dart';

final ImagePicker _picker = ImagePicker();

class HomePage extends StatelessWidget {
  HomePage() {
    color.toGreen();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                transform: Matrix4.translationValues(-15.0, 0, 0.0),
                child: Image(
                  image: AssetImage("assets/images/logo_transparent.png"),
                  alignment: Alignment.center,
                  height: 50,
                  width: 160,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 35),
              Row(children: [
                Expanded(
                    child: Text("Scan your skin now!",
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.bold))),
                Icon(Icons.search, size: 70)
              ]),
              const SizedBox(height: 35),
              SizedBox(
                  width: 250,
                  child: Text(
                    "More than 1.5 million people are diagnosed with skin cancer every year. Early detection is essential. - Scan your suspicious areas now.",
                    style: TextStyle(fontSize: 15, color: kBlack, height: 1.6),
                  )),
              const SizedBox(height: 150),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Button(
                      label: "Use existing Scan",
                      onTap: () =>
                          abstractHandler(context, ImageSource.gallery)),
                  const SizedBox(height: 20),
                  Button(
                      label: "Take a Scan",
                      onTap: () =>
                          abstractHandler(context, ImageSource.camera)),
                ],
              )
            ],
          )),
    );
  }
}

void routeToWarningScreen(BuildContext context) {
  context.push("/home/warning");
}

void abstractHandler(BuildContext context, ImageSource imageSource) {
  _picker.pickImage(source: imageSource).then((image) {
    if (image != null) {
      Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 1,
        numResults: 1,
      ).then((prediction) {
        routeToWarningScreen(context);
        if (prediction != null) {
          dynamic finalPrediction = prediction.first;
          image.readAsBytes().then((value) => predictionBloc.setPrediction(
              finalPrediction["label"],
              finalPrediction["confidence"],
              image.path,
              value));
        }
      });
    }
  });
}
