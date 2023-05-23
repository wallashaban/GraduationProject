// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pres_cach.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PresCachAdapter extends TypeAdapter<PresCach> {
  @override
  final int typeId = 4;

  @override
  PresCach read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PresCach(
      id: fields[0] as int,
      note: fields[1] as String?,
      date: fields[2] as String,
      file: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PresCach obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.note)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.file);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PresCachAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
