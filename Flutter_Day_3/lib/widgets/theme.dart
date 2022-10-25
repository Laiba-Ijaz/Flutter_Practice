import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lightTheme(BuildContext context)=>ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    canvasColor: creamColor,
    buttonColor: ,
    floatingActionButtonTheme:  const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF6366F1),
      foregroundColor: Colors.white,
    ),
    colorScheme: Theme.of(context).colorScheme.copyWith(secondary: darkBluishColor),
    primaryTextTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        //textTheme: Theme.of(context).textTheme,
        toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
        titleTextStyle: Theme.of(context).textTheme.headline6,
    ),
  );

  // static ThemeData darkTheme(BuildContext context)=>ThemeData(
  //   primaryTextTheme: GoogleFonts.poppinsTextTheme(),
  //   cardColor: Colors.black,
  //   canvasColor: darkCreamColor,
  //   primarySwatch: Colors.indigo,
  //   floatingActionButtonTheme:
  //   const FloatingActionButtonThemeData(
  //     backgroundColor: Color(0xFF6366F1),
  //     foregroundColor: Colors.white,
  //   ),
  //   colorScheme: Theme.of(context).colorScheme.copyWith(secondary: Colors.white),
  //   appBarTheme: AppBarTheme(
  //     color: Colors.white,
  //     elevation: 0.0,
  //     iconTheme: const IconThemeData(color: Colors.white),
  //     //textTheme: Theme.of(context).textTheme,
  //     toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
  //     titleTextStyle: Theme.of(context).textTheme.headline6,
  //
  //   ),
  // );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    primarySwatch: Colors.indigo,
    cardColor: Colors.black,
    canvasColor: darkCreamColor,
    floatingActionButtonTheme:
      const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF6366F1),
        foregroundColor: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white), toolbarTextStyle: Theme.of(context).textTheme.copyWith(
          headline6:
          context.textTheme.headline6?.copyWith(color: Colors.white),
        ).bodyText2, titleTextStyle: Theme.of(context).textTheme.copyWith(
          headline6:
          context.textTheme.headline6?.copyWith(color: Colors.white),
        ).headline6,
      ),
    colorScheme: Theme.of(context)
        .colorScheme
        .copyWith(secondary: Colors.white,   brightness: Brightness.dark,),

  );




  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor =const Color(0xff403b58);
  static Color lightBluishColor =Vx.purple400;
}