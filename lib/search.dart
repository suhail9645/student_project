import 'dart:io';
import 'package:flutter/material.dart';

import 'package:students/profile_page/information.dart';

import 'model/one_student.dart';
import 'model/value_listen.dart';

class PageSearch extends SearchDelegate {
  final List<Student> student;
  PageSearch({required this.student});
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
    return ListView.builder(
      itemBuilder: (ctx, index) {
        final data = student[index];
        if (data.name.toLowerCase().contains(query.toLowerCase().trim())) {
          return Column(
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) {
                        return Information(
                          values: data,
                        );
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
      itemCount: student.length,
    );
  }
}
