part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final AppUser user;
  const ProfileLoaded({required this.user});
}

final class ProfileError extends ProfileState {
  final String message;
  const ProfileError({required this.message});
}
