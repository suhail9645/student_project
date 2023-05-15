import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import '../../model/one_student.dart';
part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<EventNavigateIntoAddPage>(eventNavigateIntoAddPage);
    on<EventNavigateIntoSearch>(eventNavigateIntoSearch);
    on<EventNavigateIntoProfilePage>(eventNavigateIntoProfilePage);
    on<EventDeleteStudent>(eventDeleteStudent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeBlocState> emit) async {
    emit(HomeLoading());
    final studentDB = await Hive.openBox<Student>('school');
    List<Student> allData = [];
    allData.addAll(studentDB.values);
    await Future.delayed(const Duration(seconds: 2));
    emit(HomeSuccess(students: allData));
  }

  FutureOr<void> eventNavigateIntoAddPage(
      EventNavigateIntoAddPage event, Emitter<HomeBlocState> emit) {
    emit(HomeNavigateIntoAddPage());
  }

  FutureOr<void> eventNavigateIntoSearch(
      EventNavigateIntoSearch event, Emitter<HomeBlocState> emit) {
    emit(HomeNavigateIntoSearch(students: event.students));
  }

  FutureOr<void> eventNavigateIntoProfilePage(
      EventNavigateIntoProfilePage event, Emitter<HomeBlocState> emit) {
        emit(HomeNavigateIntoProfilePage(student: event.student));
      }

  FutureOr<void> eventDeleteStudent(EventDeleteStudent event, Emitter<HomeBlocState> emit)async {
  final studentDb= await event.deleteStudent();
  List<Student> allData = [];
  allData.addAll(studentDb.values);
  emit(HomeSuccess(students: allData));
  
  }
}
