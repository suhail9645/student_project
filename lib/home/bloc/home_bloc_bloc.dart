import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:students/functions/value_listen.dart';
import '../../functions/one_student.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<EventNavigateIntoAddPage>(eventNavigateIntoAddPage);
    on<EventNavigateIntoSearch>(eventNavigateIntoSearch);
    on<EventNavigateIntoProfilePage>(eventNavigateIntoProfilePage);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeBlocState> emit) async {
    emit(HomeLoading());
    final studentDB = await Hive.openBox<Student>('school');
    List<Student> allData = [];
    allData.addAll(studentDB.values);
    emit(HomeSuccess(students: allData));
  }

  FutureOr<void> eventNavigateIntoAddPage(
      EventNavigateIntoAddPage event, Emitter<HomeBlocState> emit) {
    emit(HomeNavigateIntoAddPage());
  }

  FutureOr<void> eventNavigateIntoSearch(
      EventNavigateIntoSearch event, Emitter<HomeBlocState> emit) {
    emit(HomeNavigateIntoSearch());
  }

  FutureOr<void> eventNavigateIntoProfilePage(
      EventNavigateIntoProfilePage event, Emitter<HomeBlocState> emit) {
        emit(HomeNavigateIntoProfilePage(student: event.student));
      }
}
