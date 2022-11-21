import 'package:flutter/material.dart';
// import 'package:isaveit/page/newsletter/newsletter_list.dart';
import 'page/register_page.dart';


void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Register(),
      
    );
  }
}