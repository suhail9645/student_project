import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:students/functions/one_student.dart';
import 'package:students/functions/value_listen.dart';
import 'package:students/home/home.dart';

import 'bloc/add_page_bloc.dart';

// ignore: must_be_immutable
class MyProfile extends StatelessWidget {
   MyProfile({super.key, });
  
  final _nameControllor = TextEditingController();

  final _ageControllor = TextEditingController();

  final _qualificationControllor = TextEditingController();

  final _domainControllor = TextEditingController();

  final _phoneControllor = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  ImagePicker picker = ImagePicker();

  File? image;

  File? imageFile;

  bool imageValidation = true;

  @override
  Widget build(BuildContext context) {
    AddPageBloc addPageBloc = AddPageBloc();
    return BlocConsumer<AddPageBloc, AddPageState>(
      bloc: addPageBloc,
      // buildWhen: (previous, current) => current is !AddPageActionState,
      // listenWhen:(previous, current) => current is AddPageActionState,
      listener: (context, state) {
        if (state is AddImageState) {
          imageFile = state.image;
        } else if (state is PopIntoHomeState) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const MyHome(),
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
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
                  key: _formKey,
                  child: Column(
                    children: [
                      CircleAvatar(
                          radius: 130,
                          backgroundImage: imageFile != null
                              ? FileImage(File(imageFile!.path))
                              : const AssetImage('assets/person_image.jfif')
                                  as ImageProvider),
                      Visibility(
                        visible: imageFile == null,
                        child: const Text('Please Add Photo'),
                      ),
                      ElevatedButton.icon(
                          onPressed: () async {
                            addPageBloc.add(AddProfileImage());
                          },
                          icon: const Icon(Icons.add_a_photo),
                          label: const Text('Add Image')),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(22, 10, 22, 10),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: _nameControllor,
                          style: const TextStyle(fontSize: 22),
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 15, 10, 15),
                              label: const Text('Name',
                                  style: TextStyle(color: Colors.black)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                        padding: const EdgeInsets.fromLTRB(22, 10, 22, 10),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          cursorColor: Colors.black,
                          controller: _ageControllor,
                          style: const TextStyle(fontSize: 22),
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 15, 10, 15),
                              label: const Text('Age',
                                  style: TextStyle(color: Colors.black)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                        padding: const EdgeInsets.fromLTRB(22, 10, 22, 10),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: _qualificationControllor,
                          style: const TextStyle(fontSize: 22),
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 15, 10, 15),
                              label: const Text('Qualification',
                                  style: TextStyle(color: Colors.black)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                        padding: const EdgeInsets.fromLTRB(22, 10, 22, 10),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          controller: _domainControllor,
                          style: const TextStyle(fontSize: 22),
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 15, 10, 15),
                              label: const Text('Domain',
                                  style: TextStyle(color: Colors.black)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                        padding: const EdgeInsets.fromLTRB(22, 10, 22, 10),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.black,
                          controller: _phoneControllor,
                          style: const TextStyle(fontSize: 22),
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(10, 15, 10, 15),
                              label: const Text('Number',
                                  style: TextStyle(color: Colors.black)),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
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
                      ElevatedButton.icon(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (imageFile != null) {
                                
                                addPageBloc.add(AddStudentAndPopIntoHome(student: checkingValues()));
                                // Navigator.of(context).pop();
                                return;
                              }
                            }
                          },
                          icon: const Icon(Icons.save_alt),
                          label: const Text('Save'))
                    ],
                  ),
                ),
              )),
            ),
          ),
        );
      },
    );
  }

 Student checkingValues() {
    final name = _nameControllor.text;
    final age = _ageControllor.text;
    final qualification = _qualificationControllor.text;
    final domain = _domainControllor.text;
    final phone = _phoneControllor.text;
    final photo = imageFile!.path;
    final studentData = Student(
        name: name,
        age: age,
        qualification: qualification,
        domain: domain,
        phone: phone,
        photo: photo);
    return studentData;
  }
}
