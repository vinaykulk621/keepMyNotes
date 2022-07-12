import 'package:flutter/material.dart';
import './screens/./login_sign_in.dart';

void main() {
  Paint.enableDithering = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,   //remove debug banner
      home: Login(),
    );
  }
}

