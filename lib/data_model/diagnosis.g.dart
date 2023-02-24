// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiagnosisAdapter extends TypeAdapter<Diagnosis> {
  @override
  final int typeId = 0;

  @override
  Diagnosis read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Diagnosis()
      ..label = fields[0] as String
      ..confidence = fields[1] as double
      ..image = fields[2] as Uint8List
      ..createdAt = fields[3] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Diagnosis obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.label)
      ..writeByte(1)
      ..write(obj.confidence)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiagnosisAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
