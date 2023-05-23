// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_disease_cach.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AiDiseaseAdapter extends TypeAdapter<AiDisease> {
  @override
  final int typeId = 2;

  @override
  AiDisease read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AiDisease(
      id: fields[0] as int,
      disease: fields[1] as String,
      createdAt: fields[2] as String,
      photo: fields[3] as String,
      prediction: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AiDisease obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.disease)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.photo)
      ..writeByte(4)
      ..write(obj.prediction);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AiDiseaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
