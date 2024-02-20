import 'package:hive/hive.dart';

part 'categories.g.dart';

@HiveType(typeId: 0)
class Categories extends HiveObject {
  @HiveField(0)
  String name;
  Categories(this.name);
}
