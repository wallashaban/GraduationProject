// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_cach.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TestCachAdapter extends TypeAdapter<TestCach> {
  @override
  final int typeId = 5;

  @override
  TestCach read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TestCach(
      id: fields[0] as int,
      labName: fields[1] as String,
      labFile: fields[2] as String,
      labDate: fields[3] as String,
      type: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TestCach obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.labName)
      ..writeByte(2)
      ..write(obj.labFile)
      ..writeByte(3)
      ..write(obj.labDate)
      ..writeByte(4)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TestCachAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
