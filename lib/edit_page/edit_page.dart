import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students/core/text_form_core.dart';
import 'package:students/edit_page/bloc/edit_bloc.dart';
import 'package:students/home/home.dart';
import 'package:students/widget/text_form_field.dart';

import '../model/one_student.dart';

class Edit extends StatelessWidget {
  final Student values;

   Edit({
    super.key,
    required this.values,
  });

  final formkey = GlobalKey<FormState>();

  File? editImageFile;

  @override
  Widget build(BuildContext context) {
    EditBloc editBloc=EditBloc();
    EditImageBloc editImageBloc = EditImageBloc(File(values.photo));
    EditStudentBloc editStudentBloc = EditStudentBloc();
    editBloc.add(EditPageIitialEvent(student: values));
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => editImageBloc,
        ),
        BlocProvider(
          create: (context) => editStudentBloc,
        )
      ],
      child: Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green, Color.fromARGB(255, 29, 221, 163)],
              ),
            ),
            child: SingleChildScrollView(
              child: SafeArea(
                  child: Center(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      BlocBuilder<EditImageBloc, EditImageState>(
                        builder: (context, state) {
                          editImageFile = state.image;
                          return CircleAvatar(
                            radius: 130,
                            backgroundImage: FileImage(state.image),
                          );
                        },
                      ),
                      ElevatedButton.icon(
                          onPressed: () async {
                            editImageBloc.add(EditImageEvent());
                          },
                          icon: const Icon(Icons.add_a_photo),
                          label: const Text('Edit Image')),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return TextFormFieldWidget(index: index);
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      BlocConsumer<EditStudentBloc, EditStudentState>(
                        bloc: editStudentBloc,
                        listener: (context, state) {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const MyHome(),
                              ),
                              (route) => false);
                        },
                        builder: (context, state) {
                          return ElevatedButton.icon(
                              onPressed: () {
                                if (formkey.currentState!.validate()) {
                                  editStudentBloc.add(EditStudentEvent(
                                      studentData: editCheckingValues()));
                                  return;
                                }
                              },
                              icon: const Icon(Icons.save_alt),
                              label: const Text('Update'));
                        },
                      )
                    ],
                  ),
                ),
              )),
            )),
      ),
    );
  }

  Student editCheckingValues() {
    final name = controllerList[0].text;
    final age = controllerList[1].text;
    final qualification = controllerList[2].text;
    final domain = controllerList[3].text;
    final phone = controllerList[4].text;
    final photo = editImageFile!.path;
    final studentData = Student(
        name: name,
        age: age,
        qualification: qualification,
        domain: domain,
        phone: phone,
        photo: photo,
        id: values.id);

    return studentData;
  }
}
