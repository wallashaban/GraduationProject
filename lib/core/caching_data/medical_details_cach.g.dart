// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_details_cach.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicalDetailsCachAdapter extends TypeAdapter<MedicalDetailsCach> {
  @override
  final int typeId = 1;

  @override
  MedicalDetailsCach read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicalDetailsCach(
      id: fields[0] as int,
      userId: fields[1] as int,
      bloodType: fields[2] as String,
      allergy: fields[3] as String?,
      skinDisease: fields[4] as String?,
      chronicDisease: fields[5] as String?,
      genticDisease: fields[6] as String?,
      isMedicine: fields[7] as bool?,
      medicineFile: fields[8] as String?,
      isGenticDisease: fields[9] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MedicalDetailsCach obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.bloodType)
      ..writeByte(3)
      ..write(obj.allergy)
      ..writeByte(4)
      ..write(obj.skinDisease)
      ..writeByte(5)
      ..write(obj.chronicDisease)
      ..writeByte(6)
      ..write(obj.genticDisease)
      ..writeByte(7)
      ..write(obj.isMedicine)
      ..writeByte(8)
      ..write(obj.medicineFile)
      ..writeByte(9)
      ..write(obj.isGenticDisease);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicalDetailsCachAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
