part of 'edit_bloc.dart';

@immutable
abstract class EditState {}


class EditInitial extends EditState {}

class EditImageState extends EditState{
  final File image;
  EditImageState({required this.image});
}
class EditStudentState extends EditState{
  
}
