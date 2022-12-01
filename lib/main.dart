// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:isaveit/page/authentication/login_page.dart';
import 'package:isaveit/page/feedback/feedback_details.dart';
import 'package:isaveit/page/feedback/read_feedback.dart';



void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ReadFeedback(),
      
    );
  }
}