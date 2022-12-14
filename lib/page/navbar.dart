import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isaveit/models/user.dart';

import 'package:isaveit/page/profile/profile_detail.dart';
import 'package:isaveit/page/report/report_inputdate.dart';
import '../page/homepage.dart';
import 'newsletter/newsletter_navbar.dart';
import 'transactions/transaction.dart';

// ignore: must_be_immutable
class SettingView extends StatefulWidget {
  User user;
  SettingView(this.user, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  int date1 = int.parse(
      DateFormat('yyyy-MM-dd').format(DateTime.now()).substring(5, 7));
  late final List screens;
  //ReportView(), MoneyView(), NewsView(), ProfileView()
  int _currentIndex = 0;

  @override
  void initState() {
    setState(() {});
    super.initState();
    screens = [
      HomeView(widget.user),
      ReportTime(user: widget.user),
      Transaction(widget.user),
      NavbarView(),
      ProfileView(widget.user)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigoAccent,
        unselectedItemColor: Colors.indigo,
        items: [
          const BottomNavigationBarItem(
            icon: InkResponse(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Icon(
                Icons.house_outlined,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(),
              child: const Icon(Icons.add_chart),
            ),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.indigoAccent.shade100,
              ),
              child: const Icon(
                Icons.attach_money_rounded,
                size: 45,
                color: Colors.white,
              ),
            ),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(),
              child: const Icon(Icons.newspaper_outlined),
            ),
            label: 'Read',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(),
              child: const Icon(Icons.account_box_outlined),
            ),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      body: screens[_currentIndex],
    );
  }
}
