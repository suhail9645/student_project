import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students/home/bloc/home_bloc_bloc.dart';
import 'package:students/profile_page/information.dart';
import 'package:students/add_page/add_page.dart';
import 'package:students/search.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    HomeBlocBloc homeBlocBloc = HomeBlocBloc();
    homeBlocBloc.add(HomeInitialEvent());

    return BlocConsumer<HomeBlocBloc, HomeBlocState>(
      bloc: homeBlocBloc,
      buildWhen: (previous, current) => current is! HomeActionState,
      listenWhen: (previous, current) => current is HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateIntoSearch) {
          showSearch(context: context, delegate: PageSearch());
        } else if (state is HomeNavigateIntoAddPage) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyProfile(),
          ));
        } else if (state is HomeNavigateIntoProfilePage) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Information(
                    values: state.student,
                  )));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoading:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeSuccess:
            final successState = state as HomeSuccess;
            return Scaffold(
              backgroundColor: const Color(0xFF1f1545),
              appBar: AppBar(
                backgroundColor: const Color.fromARGB(255, 9, 35, 79),
                title: const Text('HOME'),
                leading: const Icon(Icons.menu),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBlocBloc.add(EventNavigateIntoSearch());
                      },
                      icon: const Icon(Icons.search))
                ],
              ),
              body: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              final values = successState.students[index];
                              return ListTile(
                                onTap: () {
                                  homeBlocBloc.add(EventNavigateIntoProfilePage(
                                      student: successState.students[index]));
                                },
                                title: Text(
                                  values.name,
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      FileImage(File(values.photo)),
                                ),
                                trailing: Wrap(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          //  deleteStudent(index);

                                          homeBlocBloc.add(EventDeleteStudent(
                                              id: successState
                                                  .students[index].id!));
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
                            itemCount: successState.students.length)),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.pinkAccent,
                          child: const Icon(
                            Icons.add,
                            size: 30,
                          ),
                          onPressed: () {
                            homeBlocBloc.add(EventNavigateIntoAddPage());
                            // homeBlocBloc.add(HomeInitialEvent());
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
