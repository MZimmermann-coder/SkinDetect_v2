import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tflite/tflite.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


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

  //encryption of the hive storage
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();
  var containsEncryptionKey = await secureStorage.containsKey(key: 'encryptionKey');
  if (!containsEncryptionKey) {
    var key = Hive.generateSecureKey();
    await secureStorage.write(key: 'encryptionKey', value: base64UrlEncode(key));
  }
  var encryptionKey = base64Url.decode((await secureStorage.read(key: 'encryptionKey'))!);

  //open the hive storage
  historyBox = await Hive.openBox<Diagnosis>(history, encryptionCipher: HiveAesCipher(encryptionKey));

  runApp(const NaKiFlutter());
}

class NaKiFlutter extends StatelessWidget {
  const NaKiFlutter({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: nakiRouter,
      theme: ThemeData(textTheme: GoogleFonts.robotoTextTheme()),
    );
  }
}
