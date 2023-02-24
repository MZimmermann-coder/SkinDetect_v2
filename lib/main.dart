import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tflite/tflite.dart';

import 'config/router.dart';
import 'data_model/diagnosis.dart';

const history = "history";
late Box<Diagnosis> historyBox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Tflite.loadModel(
    model: "assets/model.tflite",
    labels: "assets/labels.txt",
    numThreads: 1, // defaults to 1
  );
  await Hive.initFlutter();
  Hive.registerAdapter(DiagnosisAdapter());
  historyBox = await Hive.openBox<Diagnosis>(history);

  runApp(const NaKiFlutter());
}

class NaKiFlutter extends StatelessWidget {
  const NaKiFlutter({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: nakiRouter,
      theme: ThemeData(textTheme: GoogleFonts.robotoTextTheme()),
    );
  }
}
