import 'package:fire_auth/data/firebase_fetch_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    try {
      final user = await FirebaseFetchProfile().fetchProfile(
        FirebaseAuth.instance.currentUser!.uid,
      );
      if (user is AppUser) {
      emit(ProfileLoaded(user: user));
      } else {
        emit(ProfileError(message: user.toString()));
      }
    } catch (error) {
      emit(ProfileError(message: error.toString()));
    }
  }
}
