import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:students/functions/one_student.dart';
import 'package:students/functions/value_listen.dart';
import 'package:students/home.dart';

class Edit extends StatefulWidget {
  final Student values;
  int index;
  Edit({super.key, required this.values, required this.index});

  @override
  State<Edit> createState() => _EditState(values: values, index: index);
}

class _EditState extends State<Edit> {
 
  final Student values;
  int index;
  _EditState({required this.values, required this.index});

  final formkey = GlobalKey<FormState>();

  ImagePicker picker = ImagePicker();

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
                key: formkey,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 130,
                      backgroundImage: editImageFile != null
                          ? FileImage(File(editImageFile!.path))
                          : FileImage(File(values.photo)),
                    ),
                    ElevatedButton.icon(
                        onPressed: () async {
                          var image = await picker.pickImage(
                              source: ImageSource.gallery);
                          if (image != null) {
                            setState(() {
                              editImageFile = File(image.path);
                              // imageFile = imageFile;
                            });
                          } else {
                            editImageFile = values.photo as File;
                          }
                        },
                        icon: const Icon(Icons.add_a_photo),
                        label: const Text('Add Image')),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22, 3, 22, 3),
                      child: TextFormField(
                        // initialValue: 'hai',
                        controller: _nameControllor..text = values.name,
                        style: const TextStyle(fontSize: 22),
                        decoration: InputDecoration(
                            hintText: 'Your Name',
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
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
                              borderSide: const BorderSide(color: Colors.white),
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
                              borderSide: const BorderSide(color: Colors.white),
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
                        controller: _domainControllor..text = values.domain,
                        style: const TextStyle(fontSize: 22),
                        decoration: InputDecoration(
                            hintText: 'Your Domain',
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
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
                        controller: _phoneControllor..text = values.phone,
                        style: const TextStyle(fontSize: 22),
                        decoration: InputDecoration(
                            hintText: ' Your Phone Number',
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
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
                          if (formkey.currentState!.validate()) {
                            editCheckingValues(values.id!);
                            //  (editImage==null)
                            // checkingValues();
                            // editCheckingValues(widget.values.id!);
                            // print(widget.values.id);

                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => const MyHome(),
                                ),
                                (route) => false);
                            return;
                          }

                          // checkingValues();
                        },
                        icon: const Icon(Icons.save_alt),
                        label: const Text('Save'))
                  ],
                ),
              ),
            )),
          )),
    );
  }

  editCheckingValues(int id) {
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
        id: id);

   Operations.updatestudent(id, studentData);
  }
}
