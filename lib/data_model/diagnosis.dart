import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'diagnosis.g.dart';

@HiveType(typeId: 0)
class Diagnosis extends HiveObject {
  @HiveField(0)
  late String label;

  @HiveField(1)
  late double confidence;

  @HiveField(2)
  late Uint8List image;

  @HiveField(3)
  late DateTime createdAt;
}
