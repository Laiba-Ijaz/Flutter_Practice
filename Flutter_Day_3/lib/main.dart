import 'package:flutter/material.dart';
import 'package:flutter_day_three/pages/home_page.dart';
import 'package:flutter_day_three/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        // brightness: Brightness.dark
      ),
      home: const HomePage(),
      //routes
      routes: {
        '/login':(context)=>const LoginPage()
      },
    );
  }
}
