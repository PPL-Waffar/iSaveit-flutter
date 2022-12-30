import 'package:flutter/material.dart';
import 'page/register_page.dart';
import 'package:isaveit/page/plannedpayment/plannedpayment.dart';


void main() => runApp(const MyApp());
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Plannedpayment(),
      
    );
  }
}