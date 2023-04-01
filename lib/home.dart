import 'dart:io';
import 'package:flutter/material.dart';
import 'package:students/functions/one_student.dart';
import 'package:students/functions/value_listen.dart';
import 'package:students/information.dart';
import 'package:students/profile.dart';
import 'package:students/search.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  // List<String> valueSearch = [];
  

  @override
  Widget build(BuildContext context) {
    Operations.getStudent();
    return Scaffold(
      backgroundColor: const Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 9, 35, 79),
        title: const Text('HOME'),
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: PageSearch());
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ValueListenableBuilder(
                    valueListenable: Operations.studentListNotifier,
                    builder: (context, List<Student> studentList, child) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            final values = studentList[index];
                            // valueSearch.add(values.name);
                            // fullValue=values;

                            return ListTile(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      Information(values: values, index: index),
                                ));
                              },
                              title: Text(
                                values.name,
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              leading: CircleAvatar(
                                radius: 30,
                                backgroundImage: FileImage(File(values.photo)),
                              ),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        //  deleteStudent(index);
                                        Operations.deleteStudent(values.id!);
                                      },
                                      icon: const Icon(Icons.delete,
                                          color: Colors.red))
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const Divider(
                                color: Colors.amberAccent,
                              ),
                          itemCount: studentList.length);
                    })),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.pinkAccent,
                  child:const Icon(
                    Icons.add,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>const MyProfile(),));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
