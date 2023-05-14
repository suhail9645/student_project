import 'package:hive_flutter/hive_flutter.dart';
part 'one_student.g.dart';

@HiveType(typeId: 1)
class Student {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String age;
  @HiveField(2)
  final String qualification;
  @HiveField(3)
  final String domain;
  @HiveField(4)
  final String phone;
  @HiveField(5)
  final String photo;
  @HiveField(6)
  int? id;
  Student(
      {required this.name,
      required this.age,
      required this.qualification,
      required this.domain,
      required this.phone,
      required this.photo,
      this.id});
}
