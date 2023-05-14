part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocEvent {}

class HomeInitialEvent extends HomeBlocEvent {}

class EventNavigateIntoSearch extends HomeBlocEvent {}

class EventNavigateIntoAddPage extends HomeBlocEvent {}

class EventNavigateIntoProfilePage extends HomeBlocEvent {
  final Student student;
  EventNavigateIntoProfilePage({required this.student});
}

class EventDeleteStudent extends HomeBlocEvent {
  final int id;
  EventDeleteStudent({required this.id});
  Future<Box<Student>> deleteStudent() async {
    final studentDB = await Hive.openBox<Student>('school');
    studentDB.delete(id);
    return studentDB;
  }
}
