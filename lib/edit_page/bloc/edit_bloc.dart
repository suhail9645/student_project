import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';


import '../../model/one_student.dart';

part 'edit_event.dart';
part 'edit_state.dart';

class EditBloc extends Bloc<EditEvent, EditState> {
  EditBloc() : super(EditInitial()) {
    on<EditEvent>((event, emit) {});
  }
}

class EditImageBloc extends Bloc<EditImageEvent, EditImageState> {
  final File image;
  EditImageBloc(this.image) : super(EditImageState(image: image)) {
    on<EditImageEvent>(editImageEvent);
  }

  FutureOr<void> editImageEvent(
      EditImageEvent event, Emitter<EditImageState> emit) async {
    ImagePicker picker = ImagePicker();
    File? imageFile;
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile = File(image.path);
    }
    emit(EditImageState(image: imageFile!));
  }
}

class EditStudentBloc extends Bloc<EditStudentEvent, EditStudentState> {
  EditStudentBloc() : super(EditStudentState()) {
    on<EditStudentEvent>(editStudentEvent);
  }

  FutureOr<void> editStudentEvent(
      EditStudentEvent event, Emitter<EditStudentState> emit)async {
      await event.updateStudent();
        emit(EditStudentState());
      }
}
