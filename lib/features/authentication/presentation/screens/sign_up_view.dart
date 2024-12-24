import 'package:flutter/material.dart';

import '../../data/repository/auth_repository.dart';
import 'login_view.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    bool isLoading = false;
    String error = '';

    Future<void> signUp() async {
      try {
        isLoading = true;
        await AuthRepository().signUpWithEmailAndPassword(
          emailController.text,
          passwordController.text,
        );
        isLoading = false;
      } catch (e) {
        isLoading = false;
        error = e.toString();
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Sign Up')),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Text('Create an account'),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  signUp();
                },
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Text('Sign Up'),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                  );
                },
                child: const Text('Already have an account? Login'),
              ),
              if (error.isNotEmpty)
                Text(
                  error,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ));
  }
}
