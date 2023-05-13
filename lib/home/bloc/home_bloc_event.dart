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
