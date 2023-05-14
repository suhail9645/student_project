import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:students/home/home.dart';
import '../core/text_form_core.dart';
import '../model/one_student.dart';
import '../widget/text_form_field.dart';
import 'bloc/add_page_bloc.dart';

class MyProfile extends StatefulWidget {
 const MyProfile({
    super.key,
  });

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  File? imageFile;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AddPageBloc addPageBloc = AddPageBloc();
    addPageBloc.add(InitialEvent());
    return BlocConsumer<AddPageBloc, AddPageState>(
      bloc: addPageBloc,
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
                      ElevatedButton.icon(
                          onPressed: () async {
                            addPageBloc.add(AddProfileImage());
                          },
                          icon: const Icon(Icons.add_a_photo),
                          label: const Text('Add Image')),
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
                      ElevatedButton.icon(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (imageFile != null) {
                                addPageBloc.add(AddStudentAndPopIntoHome(
                                    student: checkingValues()));
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
    final name = controllerList[0].text;
    final age = controllerList[1].text;
    final qualification = controllerList[2].text;
    final domain =  controllerList[3].text;
    final phone =  controllerList[4].text;
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

