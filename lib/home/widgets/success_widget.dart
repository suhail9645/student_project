import 'dart:io';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

import '../bloc/home_bloc_bloc.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    super.key,
    required this.homeBlocBloc,
    required this.successState,
  });

  final HomeBlocBloc homeBlocBloc;
  final HomeSuccess successState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1f1545),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 9, 35, 79),
        title: const Text('HOME'),
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
              onPressed: () {
                homeBlocBloc.add(EventNavigateIntoSearch(
                    students: successState.students));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      final values = successState.students[index];
                      return GFListTile(
                          onTap: () {
                            homeBlocBloc.add(
                                EventNavigateIntoProfilePage(
                                    student:
                                        successState.students[index]));
                          },
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
                          shadow: const BoxShadow(),
                          color:
                              const Color.fromARGB(255, 222, 230, 238),
                          avatar: Image.file(
                            File(values.photo),
                            height: 60,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                          titleText: values.name,
                          icon: IconButton(
                              onPressed: () {
                                //  deleteStudent(index);

                                homeBlocBloc.add(EventDeleteStudent(
                                    id: successState
                                        .students[index].id!));
                              },
                              icon: const Icon(Icons.delete,
                                  color: Colors.red)));
                      
                    },
                    itemCount: successState.students.length)),
            Align(
              alignment: Alignment.bottomRight,
              child: AvatarGlow(
                endRadius: 60,
                glowColor: Colors.pink,
                child: FloatingActionButton(
                 
                  backgroundColor: Colors.pinkAccent,
                  child: const Icon(
                    Icons.add,
                    size: 30,
                  ),
                  onPressed: () {
                    homeBlocBloc.add(EventNavigateIntoAddPage());
                   
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

