// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'growth_cach.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GrowrhCachAdapter extends TypeAdapter<GrowrhCach> {
  @override
  final int typeId = 6;

  @override
  GrowrhCach read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GrowrhCach(
      id: fields[0] as int,
      height: fields[1] as String,
      weight: fields[2] as String,
      heightStatus: fields[3] as String,
      weightStatus: fields[4] as String,
      measureDate: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, GrowrhCach obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.weight)
      ..writeByte(3)
      ..write(obj.heightStatus)
      ..writeByte(4)
      ..write(obj.weightStatus)
      ..writeByte(5)
      ..write(obj.measureDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GrowrhCachAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
