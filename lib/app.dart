import 'package:flutter/material.dart';
import 'package:voltran_test/view/homepage.dart';
import 'view/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        primarySwatch: Colors.blue,
      ),
      //with GetX
      home: HomePage(),

      ///
      ///without GetX
      ///home: Home(),
    );
  }
}
