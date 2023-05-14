part of 'home_bloc_bloc.dart';

@immutable
abstract class HomeBlocState {}

class HomeBlocInitial extends HomeBlocState {}

class HomeActionState extends HomeBlocState {}

class HomeLoading extends HomeBlocState {}

class HomeSuccess extends HomeBlocState {
  final List<Student> students;
  HomeSuccess({required this.students});
}

class HomeNavigateIntoSearch extends HomeActionState {
  final List<Student>students;
  HomeNavigateIntoSearch({required this.students});
}

class HomeNavigateIntoAddPage extends HomeActionState {}

class HomeNavigateIntoProfilePage extends HomeActionState {
  final Student student;
  HomeNavigateIntoProfilePage({required this.student});
}
