// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, sort_child_properties_last, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:isaveit/page/newsletter/newsletter_list.dart';
// ignore: must_be_immutable
class NavbarView extends StatefulWidget {
  NavbarView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavbarViewState createState() => _NavbarViewState();
}

class _NavbarViewState extends State<NavbarView> {
  late final List screens;
  //ReportView(), MoneyView(), NewsView(), ProfileView()

  int _currentIndex = 0;

  @override
  void initState() {
    setState(() {});
    super.initState();
    screens = [NewsletterList(),];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 150,
          centerTitle: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              '🗞️ Newsletter',
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
          ),
          // title: const Text('Flutter Tabs', style: TextStyle(color: Colors.black))
        ),
        body: screens[_currentIndex],
      ),
    );
  }
}
