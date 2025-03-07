part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class AuthStateUnauthenticated extends AuthState {}

final class AuthStateLoading extends AuthState {}

final class AuthStateError extends AuthState {
  final String message;
  const AuthStateError(this.message);
  @override
  List<Object> get props => [message];
}

final class AuthStateAuthenticated extends AuthState {
  final User user;
  const AuthStateAuthenticated({required this.user});
  @override
  List<Object> get props => [user];
}
