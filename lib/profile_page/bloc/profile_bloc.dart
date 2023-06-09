import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<NavigateIntoEditPage>(navigateIntoEditPage);
  }

  FutureOr<void> navigateIntoEditPage(NavigateIntoEditPage event, Emitter<ProfileState> emit) {
    emit(NavigateIntoEditPagestate());
  }
}
