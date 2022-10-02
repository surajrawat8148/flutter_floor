// dao/person_dao.dart

import 'package:floor/floor.dart';

import 'user_entity.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User')
  Stream<List<User>> findAllUser();

  @Query('SELECT * FROM User WHERE id = :id')
  Stream<User?> findUserById(int id);

  @insert
  Future<void> insertUser(User user);

  @update
  Future<void> updateUser(User user);

  // @Query(
  //     "UPDATE User SET mobile = :mobile, name = :name, surname =:surname WHERE id = :id")
  // Future<void> updateUser();

  @delete
  Future<void> deleteUser(User user);
}
