// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:isaveit/page/newsletter/newsletter_list.dart';
import 'package:isaveit/page/newsletter/newsletter_tips.dart';
import 'package:isaveit/page/newsletter/newsletter_today.dart';

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
    screens = [
      NewsletterList(),
      NewsletterTips(),
      NewsletterToday()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 1,
            centerTitle: false,
            backgroundColor: Colors.white,
            title: 
            Padding(padding: EdgeInsets.only(left: 30), child:
            Text(
              '🗞️ Newsletter',
              style: TextStyle(color: Colors.black,fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
            ),),
            // title: const Text('Flutter Tabs', style: TextStyle(color: Colors.black)),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(padding: EdgeInsets.only(left: 30, right: 30),
                child: TabBar(
                  padding: const EdgeInsets.only(bottom: 10.0),
                    isScrollable: true,
                    unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.normal),
                    unselectedLabelColor: Colors.black,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color:Color(0xffE7E7FF),
                      // labelColor: Color(0xff4054FF),
                    ),
                    // indicatorSize: TabBarIndicatorSize.label,
                    // indicatorColor: Color(0xffE7E7FF)
                    labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                    tabs: [
                                            
                      Container(
                            width: 132,
                            height: 32,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32)),
                            child: Center(
                            child: Text("All Articles", textAlign:TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff4054FF)),)
                      )),
                      Container(
                            width: 132,
                            height: 32,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32)),
                            child: Center(
                            child: Text("Tips", textAlign:TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff4054FF)),)
                      )),
                      Container(
                            width: 132,
                            height: 32,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32)),
                            child: Center(
                            child: Text("Today's News", textAlign:TextAlign.center, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff4054FF)),)
                      )),
                      
                    ],
                    onTap: (index) {setState(() {_currentIndex = index;});},
      ),
                ),)
              ),
            ),
            body: screens[_currentIndex],

          ),
          
        )
        ;

  }
}
