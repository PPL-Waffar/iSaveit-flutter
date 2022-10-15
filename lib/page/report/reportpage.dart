import 'package:flutter/material.dart';

class ReportView extends StatefulWidget {
  const ReportView({super.key});

  @override
  ReportPage createState() => ReportPage();
}

class ReportPage extends State<ReportView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 150, 
          leading: const Center(
              child: Text(
            'Your Report',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          ),
      )
    );
  }
}