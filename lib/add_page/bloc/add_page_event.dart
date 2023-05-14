part of 'add_page_bloc.dart';

@immutable
abstract class AddPageEvent {}

class AddStudentAndPopIntoHome extends AddPageEvent {
  final Student student;
  AddStudentAndPopIntoHome({required this.student});
  addStudent() async {
    final studentDB = await Hive.openBox<Student>('school');
    student.id = await studentDB.add(student);
    await studentDB.put(student.id, student);
    
  }
}

class AddProfileImage extends AddPageEvent {}

class InitialEvent extends AddPageEvent {}
