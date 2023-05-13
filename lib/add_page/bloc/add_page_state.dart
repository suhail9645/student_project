part of 'add_page_bloc.dart';

@immutable
abstract class AddPageState {}

class AddPageActionState extends AddPageState{}

class PopIntoHomeState extends AddPageActionState{}

class AddPageInitial extends AddPageState {}

class AddImageState extends AddPageState {
  final File image;
  AddImageState({required this.image});
}

