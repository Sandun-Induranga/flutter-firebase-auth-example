import 'package:flutter/material.dart';

import '../../data/repository/auth_repository.dart';
import 'login_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String error = '';

  @override
  Widget build(BuildContext context) {

    Future<void> signUp() async {
      try {
        setState(() {
          isLoading = true;
        });
        await AuthRepository().signUpWithEmailAndPassword(
          emailController.text,
          passwordController.text,
        );
        setState(() {
          isLoading = false;
        });
      } catch (e) {
        setState(() {
          isLoading = false;
          error = e.toString();
        });
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
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  await signUp();
                },
                child: isLoading
                    ? const Text('Submitting...')
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
