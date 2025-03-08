import 'package:fire_auth/data/firebase_auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuthRepo _firebaseAuthRepo = FirebaseAuthRepo();

  AuthCubit() : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthStateLoading());

    try {
      var user = await _firebaseAuthRepo.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (user is User) {
        emit(AuthStateAuthenticated(user: user));
        user.sendEmailVerification();
      } else {
        emit(AuthStateError(user.toString()));
        emit(AuthStateUnauthenticated());
      }
    } catch (e) {
      emit(AuthStateError(e.toString()));
      emit(AuthStateUnauthenticated());
    }
  }
  

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(AuthStateLoading());

    try {
      final user = await _firebaseAuthRepo.createUserWithEmailAndPassword(
        email,
        password,
      );

      emit(AuthStateAuthenticated(user: user));
    } catch (e) {
      emit(AuthStateError(e.toString()));
    }
  }

  Future<void> signOut() async {
    await _firebaseAuthRepo.signOut();
    emit(AuthStateUnauthenticated());
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuthRepo.sendPasswordResetEmail(email);
  }

  Future<void> currentUser() async {
    final user = await _firebaseAuthRepo.getCurrentUser();
    print("===========================================$user");
    if (user != null) {
      emit(AuthStateAuthenticated(user: user));
    } else {
      emit(AuthStateUnauthenticated());
    }
  }

  Future<void> verifyEmail() async {
    await _firebaseAuthRepo.verifyEmail();
  }
}
