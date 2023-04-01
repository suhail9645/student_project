import 'dart:io';
import 'package:flutter/material.dart';
import 'package:students/functions/one_student.dart';
import 'package:students/functions/value_listen.dart';
import 'package:students/information.dart';

class PageSearch extends SearchDelegate {
  final operate = Operations();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        color: const Color.fromARGB(255, 0, 0, 0),
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      color: const Color.fromARGB(255, 0, 0, 0),
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Operations.studentListNotifier,
      builder:
          ((BuildContext context, List<Student> studentList, Widget? child) {
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final data = studentList[index];
            if (data.name.toLowerCase().contains(query.toLowerCase().trim())) {
              return Column(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) {
                            return Information(values: data, index: index);
                          }),
                        ),
                      );
                    },
                    title: Text(data.name),
                    leading: CircleAvatar(
                      backgroundImage: FileImage(File(data.photo)),
                    ),
                  ),
                  const Divider()
                ],
              );
            } else {
              return Container();
            }
          },
          itemCount: studentList.length,
        );
      }),
    );
  }
}
