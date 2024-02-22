// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoriesAdapter extends TypeAdapter<Categories> {
  @override
  final int typeId = 0;

  @override
  Categories read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Categories(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Categories obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoriesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecordsAdapter extends TypeAdapter<Records> {
  @override
  final int typeId = 1;

  @override
  Records read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Records(
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Records obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecordsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
