import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students/edit_page/edit_page.dart';

import 'package:students/profile_page/bloc/profile_bloc.dart';

import '../model/one_student.dart';

class Information extends StatelessWidget {
  final Student values;

  Information({
    super.key,
    required this.values,
  });

  @override
  Widget build(BuildContext context) {
    ProfileBloc profileBloc = ProfileBloc();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          'INFORMATIONS',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.purple, Colors.orange])),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: FileImage(File(values.photo)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 161, 177, 225),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'NAME :',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          values.name,
                          style: const TextStyle(fontSize: 19),
                        )
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 161, 177, 225),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE :',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          values.age,
                          style: const TextStyle(fontSize: 19),
                        )
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 161, 177, 225),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'QULIFICATION :',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          values.qualification,
                          style: const TextStyle(fontSize: 19),
                        )
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 161, 177, 225),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'DOMAIN :',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          values.domain,
                          style: const TextStyle(fontSize: 19),
                        )
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
              child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 161, 177, 225),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'PHONE :',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          values.phone,
                          style: const TextStyle(fontSize: 19),
                        )
                      ],
                    ),
                  )),
            ),
            BlocConsumer<ProfileBloc, ProfileState>(
              bloc: profileBloc,
              listener: (context, state) {
               if(state is NavigateIntoEditPagestate){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Edit(values: values),));
               }
              },
              builder: (context, state) {
                return ElevatedButton(
                    style: const ButtonStyle(),
                    onPressed: () {
                      profileBloc.add(NavigateIntoEditPage());
                    },
                    child: const Text('EDIT'));
              },
            )
          ],
        )),
      )),
    );
  }
}
