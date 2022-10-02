// entity/person.dart

import 'package:floor/floor.dart';

@entity
class User {
  @PrimaryKey(autoGenerate: true)
  final int? id;

  late final String? mobile;
  late final String? name;
  late final String? surname;

  User({
    this.id,
    this.name,
    this.surname,
    this.mobile,
  });
}
