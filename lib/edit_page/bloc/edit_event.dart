part of 'edit_bloc.dart';

@immutable
abstract class EditEvent {}

class EditImageEvent extends EditEvent {}

class EditStudentEvent extends EditEvent {
  final Student studentData;
  EditStudentEvent({required this.studentData});
  Future<void> updateStudent() async {
    final studentDB = await Hive.openBox<Student>('school');
    await studentDB.put(studentData.id, studentData);
  }
}
