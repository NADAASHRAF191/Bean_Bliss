import 'package:coffee_shop/feature/home/views/welcome_view_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Sora"),
      debugShowCheckedModeBanner: false,
      home: WelcomeViewPage(),
    );
  }
}
