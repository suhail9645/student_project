import 'dart:io';
import 'package:flutter/material.dart';
import 'package:students/edit_page.dart';
import 'package:students/functions/one_student.dart';

class Information extends StatelessWidget {
  final Student values;
  int index;
  Information({super.key, required this.values, required this.index});

  @override
  Widget build(BuildContext context) {
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
            ElevatedButton(
                style: const ButtonStyle(),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Edit(
                      values: values,
                     
                    ),
                  ));
                },
                child: const Text('EDIT'))
          ],
        )),
      )),
    );
  }
}
