import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_example/features/authentication/data/repository/auth_repository.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home')),
      ),
      body: Column(
        children: [
          const Text('Welcome to the home screen!'),
          ElevatedButton(
            onPressed: () {
              AuthRepository().signOut();
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
