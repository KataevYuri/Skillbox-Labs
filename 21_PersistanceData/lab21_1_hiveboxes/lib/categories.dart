// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive/hive.dart';

part 'categories.g.dart';

@HiveType(typeId: 0)
class Categories extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  HiveList<Record>? records;

  Categories({
    required this.name,
  });
}

@HiveType(typeId: 1)
class Record extends HiveObject {
  @HiveField(0)
  String name;
  Record(this.name);
}
