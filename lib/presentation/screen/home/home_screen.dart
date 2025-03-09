import '../../../cubits/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../cubits/auth_cubit/auth_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().fetchProfile();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthCubit>().signOut();
              // Navigator.pushReplacementNamed(context, AppConst.loginRoute);
            },
            icon: const Icon(Icons.output_rounded),
          ),
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded) {
            return Center(
              child: Column(
                children: [
                  Text(state.user.name ?? ''),
                  Text(state.user.email),
                  Text(state.user.uid),
                ],
              ),
            );
          } else if (state is ProfileError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text("Something went wrong!"));
          }
        },
      ),
    );
  }
}
