// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data_cach.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDataCachAdapter extends TypeAdapter<UserDataCach> {
  @override
  final int typeId = 10;

  @override
  UserDataCach read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDataCach(
      id: fields[0] as int,
      name: fields[1] as String,
      email: fields[2] as String,
      gender: fields[3] as String?,
      birthDate: fields[4] as String?,
      accessToken: fields[5] as String,
      photo: fields[6] as String?,
      phone: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserDataCach obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.birthDate)
      ..writeByte(5)
      ..write(obj.accessToken)
      ..writeByte(6)
      ..write(obj.photo)
      ..writeByte(7)
      ..write(obj.phone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataCachAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
