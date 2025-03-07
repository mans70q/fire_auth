import 'package:fire_auth/data/firebase_auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  FirebaseAuthRepo firebaseAuthRepo = FirebaseAuthRepo();
  User? user;
  AuthCubit() : super(AuthInitial());

  Future<void> _login({required String email, required String password}) async {
    emit(AuthStateLoading());

    try {
      final user = await firebaseAuthRepo.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      emit(AuthStateAuthenticated(user: user));
    } catch (e) {
      emit(AuthStateError(e.toString()));
    }
  }

  Future<void> _register({
    required String email,
    required String password,
  }) async {
    emit(AuthStateLoading());

    try {
      final user = await firebaseAuthRepo.createUserWithEmailAndPassword(
        email,
        password,
      );
      
      emit(AuthStateAuthenticated(user: user));
    } catch (e) {
      emit(AuthStateError(e.toString()));
    }
  }

  Future<void> _signOut() async {
    await firebaseAuthRepo.signOut();
    emit(AuthStateUnauthenticated());
  }
}
