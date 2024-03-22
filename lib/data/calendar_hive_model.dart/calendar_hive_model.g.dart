// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalendarHiveModelAdapter extends TypeAdapter<CalendarHiveModel> {
  @override
  final int typeId = 2;

  @override
  CalendarHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalendarHiveModel(
      date: fields[0] as String,
      title: fields[1] as String,
      time: fields[2] as String,
      isChecked: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CalendarHiveModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.isChecked);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
