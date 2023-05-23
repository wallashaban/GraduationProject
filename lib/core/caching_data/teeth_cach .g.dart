// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teeth_cach .dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeethCachAdapter extends TypeAdapter<TeethCach> {
  @override
  final int typeId = 3;

  @override
  TeethCach read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeethCach(
      id: fields[0] as int,
      teeth: fields[1] as String,
      appearanceDate: fields[2] as String,
      ageInMonth: fields[3] as String,
      ageInYears: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TeethCach obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.teeth)
      ..writeByte(2)
      ..write(obj.appearanceDate)
      ..writeByte(3)
      ..write(obj.ageInMonth)
      ..writeByte(4)
      ..write(obj.ageInYears);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeethCachAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
