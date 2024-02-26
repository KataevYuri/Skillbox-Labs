import 'package:floor/floor.dart';

import 'user_model.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Future<List<User>> finalAllUsers();

  @Query('SELECT * FROM User WHERE id = :id')
  Stream<User?> findUserById(int id);

  @insert
  Future<void> insertUser(User user);
}
