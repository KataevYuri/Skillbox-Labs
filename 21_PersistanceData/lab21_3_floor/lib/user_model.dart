import 'package:floor/floor.dart';

@entity
class User {
  @primaryKey
  final int id;

  final String firstName;
  final String lastName;
  final int age;
  final String tel;

  User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.age,
      required this.tel});
}
