import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'features/authentication/data/repository/auth_repository.dart';
import 'features/authentication/presentation/screens/login_view.dart';
import 'features/home/presentation/screens/home_view.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthRepository().authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            return const LoginView();
          } else {
            return const HomeView();
          }
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

