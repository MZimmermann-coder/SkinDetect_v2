import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';

class Prediction {
  const Prediction(
      {required this.label,
      required this.confidence,
      required this.imgPath,
      required this.binaryImg});

  final String label;
  final double confidence;
  final String imgPath;
  final Uint8List binaryImg;
}

class PredictionCubit extends Cubit<Prediction> {
  PredictionCubit()
      : super(Prediction(
            label: "Unknown",
            confidence: 0.0,
            imgPath: "",
            binaryImg: Uint8List(0)));

  setPrediction(String label, double confidence, String imgPath,
          Uint8List binaryImg) =>
      emit(Prediction(
          label: label,
          confidence: confidence,
          imgPath: imgPath,
          binaryImg: binaryImg));
}
