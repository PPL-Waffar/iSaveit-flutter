import 'package:flutter/material.dart';
import 'package:isaveit/models/user.dart';
import '../page/homepage.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key, required User user});

  @override
  // ignore: library_private_types_in_public_api
  _SettingViewState createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  final tabs = [ HomeView(),
    //ReportView(), MoneyView(), NewsView(), ProfileView()
  ];

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
          const BottomNavigationBarItem(
            icon: InkResponse(
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Icon(
                Icons.house_outlined,),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(
              ),
              child: const Icon(Icons.add_chart),
            ),
            label: 'Report',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(

              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.indigoAccent.shade100,
              ),
              child: const Icon(Icons.attach_money_rounded, size: 45, color: Colors.white,),
            ),
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(
              ),
              child: const Icon(Icons.newspaper_outlined),
            ),
            label: 'Read',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.only(
              ),
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
      body: tabs[_currentIndex],
    );
  }
}
