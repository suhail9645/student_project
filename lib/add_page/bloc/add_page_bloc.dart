import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:students/core/text_form_core.dart';


import '../../model/one_student.dart';

part 'add_page_event.dart';
part 'add_page_state.dart';

class AddPageBloc extends Bloc<AddPageEvent, AddPageState> {
  AddPageBloc() : super(AddPageInitial()) {
    on<AddProfileImage>(addProfileImage);
    on<AddStudentAndPopIntoHome>(addStudentAndPopIntoHome);
    on<InitialEvent>(initialEvent);
  }

  FutureOr<void> addProfileImage(
      AddProfileImage event, Emitter<AddPageState> emit) async {
    ImagePicker picker = ImagePicker();
    var image = await picker.pickImage(source: ImageSource.gallery);
    File? imageFile; 
    if(image!=null){
       imageFile=File(image.path);
    }
    emit(AddImageState(image: imageFile!));
    
  }

  FutureOr<void> addStudentAndPopIntoHome(AddStudentAndPopIntoHome event, Emitter<AddPageState> emit)async {
  await event.addStudent();
    emit(PopIntoHomeState());
  }

  FutureOr<void> initialEvent(InitialEvent event, Emitter<AddPageState> emit) {
    for (var element in controllerList) {
      element.clear();
    }
  }
}
