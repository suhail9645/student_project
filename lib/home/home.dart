import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students/home/bloc/home_bloc_bloc.dart';
import 'package:students/profile_page/information.dart';
import 'package:students/add_page/add_page.dart';
import 'package:students/search.dart';
import 'package:getwidget/getwidget.dart';
import 'package:avatar_glow/avatar_glow.dart';
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
          showSearch(
              context: context, delegate: PageSearch(student: state.students));
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
          default:
            return const SizedBox();
        }
      },
    );
  }
}
