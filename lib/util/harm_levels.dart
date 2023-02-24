import 'package:flutter/material.dart';
import 'package:naki_flutter/util/colors.dart';

Map<String, String> harmLevels = {
  "akiec": "Medium Risk",
  "bkl": "Harmless",
  "mel": "High Risk",
  "df": "Harmless",
  "nv": "Harmless",
  "bcc": "High Risk",
  "vasc": "Harmless"
};

Map<String, Color> harmColors = {
  "Medium Risk": kBlue,
  "Harmless": Colors.white,
  "High Risk": kGreen,
};

Map<String, String> harmLabels = {
  "akiec": "Actinic Keratoses",
  "bkl": "Benign Keratosis",
  "mel": "Melanoma",
  "df": "Dermatofibroma",
  "nv": "Melanocytic Nevus",
  "bcc": "Basal Cell Carcinoma",
  "vasc": "Vascular Lesions"
};
