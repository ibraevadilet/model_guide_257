import 'package:hive_flutter/hive_flutter.dart';

part 'calendar_hive_model.g.dart';

@HiveType(typeId: 2)
class CalendarHiveModel extends HiveObject {
  @HiveField(0)
  String date;
  @HiveField(1)
  String title;
  @HiveField(2)
  String time;
  @HiveField(3)
  bool isChecked;

  CalendarHiveModel({
    required this.date,
    required this.title,
    required this.time,
    this.isChecked = false,
  });
}
