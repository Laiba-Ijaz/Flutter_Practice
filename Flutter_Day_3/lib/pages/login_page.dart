import 'package:flutter/material.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String login = 'Login';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Practice'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Welcome to $login Page',
        style: const TextStyle(
          color: Colors.deepPurple,
          fontSize: 22,
          fontWeight: FontWeight.w300,
          wordSpacing: 5,
          letterSpacing: 4
        ),),
      ),
    );
  }
}
