import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_example/features/authentication/data/repository/auth_repository.dart';
import 'package:flutter_firebase_auth_example/features/authentication/presentation/screens/sign_up_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  String error = '';

  @override
  Widget build(BuildContext context) {

    Future<void> login() async {
      try {
        setState(() {
          isLoading = true;
          error = '';
        });
        await AuthRepository().signInWithEmailAndPassword(
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
                    ? const Text('Submitting...')
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
