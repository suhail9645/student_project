import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:students/home/bloc/home_bloc_bloc.dart';
import 'package:students/home/widgets/success_widget.dart';
import 'package:students/profile_page/information.dart';
import 'package:students/add_page/add_page.dart';
import 'package:students/search.dart';
import 'package:getwidget/getwidget.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'widgets/loading_widget.dart';
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
                  ),),);
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoading:
            return const LoadingWidget();
          case HomeSuccess:
            final successState = state as HomeSuccess;
            return SuccessWidget(homeBlocBloc: homeBlocBloc, successState: successState);
          default:
            return const SizedBox();
        }
      },
    );
  }
}

