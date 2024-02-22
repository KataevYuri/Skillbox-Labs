import 'package:hive/hive.dart';

part 'categories.g.dart';

@HiveType(typeId: 0)
class Categories extends HiveObject {
  @HiveField(0)
  String name;
  List<Records>? records;
  Categories(this.name);
}

@HiveType(typeId: 1)
class Records extends HiveObject {
  @HiveField(0)
  String name;
  Records(this.name);
}
