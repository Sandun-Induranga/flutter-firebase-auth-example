import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_example/features/authentication/data/repository/auth_repository.dart';
import 'package:flutter_firebase_auth_example/features/authentication/presentation/screens/sign_up_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    bool isLoading = false;
    String error = '';

    Future<void> login() async {
      try {
        isLoading = true;
        await AuthRepository().signInWithEmailAndPassword(
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
          title: const Center(child: Text('Login')),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Text('Login to your account'),
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
                  await login();
                },
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : const Text('Login'),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpView(),
                    ),
                  );
                },
                child: const Text('Create an account'),
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
