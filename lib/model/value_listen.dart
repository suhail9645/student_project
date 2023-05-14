import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'one_student.dart';


class Operations {
  static ValueNotifier<List<Student>> studentListNotifier = ValueNotifier([]);

  static addStudent(Student oneStudent) async {
    final studentDB = await Hive.openBox<Student>('school');
    oneStudent.id = await studentDB.add(oneStudent);
    await studentDB.put(oneStudent.id, oneStudent);
    getStudent();
  }

  static Future<List<Student>> getStudent() async {
    final studentDB = await Hive.openBox<Student>('school');
    List<Student> allData = [];
    studentListNotifier.value.clear();
    studentListNotifier.value.addAll(studentDB.values);
    allData.addAll(studentDB.values);
    studentListNotifier.notifyListeners();

    return allData;
  }

  static deleteStudent(int id) async {
    final studentDB = await Hive.openBox<Student>('school');
    studentDB.delete(id);
//  studentDB.deleteAt(id);
    getStudent();
  }

  static updatestudent(int id, Student oneStudent) async {
    final studentDB = await Hive.openBox<Student>('school');
    await studentDB.put(id, oneStudent);
    getStudent();
  }
}
