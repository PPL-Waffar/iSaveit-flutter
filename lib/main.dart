import 'package:flutter/material.dart';
import '../page/homepage.dart';
import '../page/newsletter.dart';
import '../page/profile.dart';
import '../page/report.dart';
import '../page/transaction.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SettingView(),
    );
  }
}

class SettingView extends StatefulWidget {
  @override
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  final tabs = [HomeView(), ReportView(), MoneyView(), NewsView(), ProfileView()];

  int _currentIndex = 0;

  @override
  void initState() {
    setState(() {});
    super.initState();
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
          BottomNavigationBarItem(
            icon: InkResponse(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Container(
                child: Icon(
                  Icons.house_outlined,),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.only(
              ),
              child: Icon(Icons.add_chart),
            ),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.only(

              ),
              child: Icon(Icons.attach_money_rounded, size: 45, color: Colors.white,),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.indigoAccent.shade100,
                ),
            ),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.only(
              ),
              child: Icon(Icons.newspaper_outlined),
            ),
            label: 'Read',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.only(
              ),
              child: Icon(Icons.account_box_outlined),
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
      body: tabs[_currentIndex],
    );
  }
}




