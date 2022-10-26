import 'package:flutter/material.dart';
import 'package:flutter_day_three/pages/cart_page.dart';
import 'package:flutter_day_three/pages/home_page.dart';
import 'package:flutter_day_three/pages/login.dart';
import 'package:flutter_day_three/pages/login_page.dart';
import 'package:flutter_day_three/utils/routes.dart';
import 'package:flutter_day_three/widgets/theme.dart';
import 'package:google_fonts/google_fonts.dart';

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
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.homeRoute,
      //could be used instead of initial Route ====> home: const HomePage(),
      //routes
      routes: {
        MyRoutes.homeRoute:(context)=> const HomePage(),
        MyRoutes.loginRoute:(context)=>const LoginPage(),
        MyRoutes.dayFour:(context)=> const LoginScreen(),
        MyRoutes.cartRoute:(context)=>const CartPage()
      },
    );
  }
}
