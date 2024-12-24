import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_example/features/authentication/presentation/screens/login_view.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Auth Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginView(),
    );
  }
}

