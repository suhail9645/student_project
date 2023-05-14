import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students/edit_page/bloc/edit_bloc.dart';
import 'package:students/home/home.dart';

import '../model/one_student.dart';

class Edit extends StatelessWidget {
  final Student values;

   Edit({
    super.key,
    required this.values,
  });

  final formkey = GlobalKey<FormState>();

  File? editImage;

  File? editImageFile;

  final _nameControllor = TextEditingController();

  final _ageControllor = TextEditingController();

  final _qualificationControllor = TextEditingController();

  final _domainControllor = TextEditingController();

  final _phoneControllor = TextEditingController();

  // bool editImageValidation = true;
  @override
  Widget build(BuildContext context) {
    EditImageBloc editImageBloc = EditImageBloc(File(values.photo));
    EditStudentBloc editStudentBloc = EditStudentBloc();
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
                          editImageFile=state.image;
                          return CircleAvatar(
                            radius: 130,
                            backgroundImage: FileImage(state.image),
                            // backgroundImage: editImageFile != null
                            //     ? FileImage(File(editImageFile!.path))
                            //     : FileImage(File(widget.values.photo)),
                          );
                        },
                      ),
                      ElevatedButton.icon(
                          onPressed: () async {
                           editImageBloc.add(EditImageEvent());
                          },
                          icon: const Icon(Icons.add_a_photo),
                          label: const Text('Edit Image')),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22, 3, 22, 3),
                        child: TextFormField(
                          controller: _nameControllor
                            ..text = values.name,
                          style: const TextStyle(fontSize: 22),
                          decoration: InputDecoration(
                              hintText: 'Your Name',
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'This Field Is Required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22, 3, 22, 2),
                        child: TextFormField(
                          controller: _ageControllor..text = values.age,
                          style: const TextStyle(fontSize: 22),
                          decoration: InputDecoration(
                              hintText: 'Your Age',
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'This Field Is Required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22, 3, 22, 2),
                        child: TextFormField(
                          controller: _qualificationControllor
                            ..text = values.qualification,
                          style: const TextStyle(fontSize: 22),
                          decoration: InputDecoration(
                              hintText: 'Your Qualification',
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'This Field Is Required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22, 3, 22, 2),
                        child: TextFormField(
                          controller: _domainControllor
                            ..text = values.domain,
                          style: const TextStyle(fontSize: 22),
                          decoration: InputDecoration(
                              hintText: 'Your Domain',
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'This Field Is Required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22, 3, 22, 2),
                        child: TextFormField(
                          controller: _phoneControllor
                            ..text = values.phone,
                          style: const TextStyle(fontSize: 22),
                          decoration: InputDecoration(
                              hintText: ' Your Phone Number',
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'This Field Is Required';
                            }
                            return null;
                          },
                        ),
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
    final name = _nameControllor.text;
    final age = _ageControllor.text;
    final qualification = _qualificationControllor.text;
    final domain = _domainControllor.text;
    final phone = _phoneControllor.text;
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
