import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students/functions/one_student.dart';

class Operations {
 static ValueNotifier<List<Student>> studentListNotifier = ValueNotifier([]);

static  addStudent(Student oneStudent) async {
    final studentDB = await Hive.openBox<Student>('school');
    oneStudent.id = await studentDB.add(oneStudent);
    await studentDB.put(oneStudent.id, oneStudent);
    await getStudent();  
    
  }

 static getStudent() async {
    final studentDB = await Hive.openBox<Student>('school');
    studentListNotifier.value.clear();
    studentListNotifier.value.addAll(studentDB.values);
    studentListNotifier.notifyListeners();
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
