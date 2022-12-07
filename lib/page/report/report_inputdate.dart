// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isaveit/page/report/reportpage.dart';

import '../../models/user.dart';

class ReportTime extends StatefulWidget {
  final User user;

  const ReportTime({super.key, required this.user});
  @override
  _TimeState createState() => _TimeState();
}

class _TimeState extends State<ReportTime> with SingleTickerProviderStateMixin {
  bool pickerIsExpanded = false;
  int _pickerYear = DateTime.now().year;
  DateTime _selectedMonth = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    1,
  );
  late String choosenDate;
  String bulan = DateTime.now().month.toString();
  
  late String tahun;
  dynamic _pickerOpen = false;

  void switchPicker() {
    setState(() {
      _pickerOpen ^= true;
    });
  }

  List<Widget> generateRowOfMonths(from, to) {
    List<Widget> months = [];
    for (int i = from; i <= to; i++) {
      DateTime dateTime = DateTime(_pickerYear, i, 1);
      final backgroundColor = dateTime.isAtSameMomentAs(_selectedMonth)
          ? Theme.of(context)
          : Color(0xff4054FF);
      months.add(
        AnimatedSwitcher(
          duration: kThemeChangeDuration,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: TextButton(
            key: ValueKey(backgroundColor),
            onPressed: () {setState(() {_selectedMonth = dateTime;choosenDate = DateFormat.yMMMM().format(_selectedMonth);bulan = choosenDate.substring(0, choosenDate.indexOf(' '));tahun = choosenDate.substring(choosenDate.indexOf(' '), choosenDate.length);tahun = tahun.substring(1, 5);
              });
            },
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              shape: CircleBorder(),
            ),
            child: Text(
              DateFormat('MMM').format(dateTime),
            ),
          ),
        ),
      );
    }
    return months;
  }

  List<Widget> generateMonths() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: generateRowOfMonths(1, 6),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: generateRowOfMonths(7, 12),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: Theme.of(context).cardColor,
            child: AnimatedSize(
              curve: Curves.easeInOut,
              // ignore: deprecated_member_use
              vsync: this,
              duration: Duration(milliseconds: 300),
              child: SizedBox(
                height: _pickerOpen ? null : 0.0,
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {setState(() { _pickerYear = _pickerYear - 1;
                            });
                          },
                          icon: Icon(Icons.navigate_before_rounded),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              _pickerYear.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {setState(() {_pickerYear = _pickerYear + 1;
                            });
                          },
                          icon: Icon(Icons.navigate_next_rounded),
                        ),
                      ],
                    ),
                    ...generateMonths(),
                    SizedBox(
                      height: 10.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100.0,
          ),
          Text("Please select the month you want to see the report:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
          SizedBox(height: 15,),
          Text(DateFormat.yMMMM().format(_selectedMonth), style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
          SizedBox(height: 10,),
          SizedBox(
            width: 327,
            height: 42,
            child:
          ElevatedButton(
            key: Key('reportDate'),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: Size.fromHeight(48),
              backgroundColor: Color(0xff4054FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48))),
            onPressed: switchPicker,
            child: Text(
              'Select date',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),),
          SizedBox(height: 12,),
          SizedBox(
            width: 327,
            height: 45,
            child:
          ElevatedButton(
            key: Key('submit'),
             style: ElevatedButton.styleFrom(
              elevation: 0,
              minimumSize: Size.fromHeight(48),
              backgroundColor: Color(0xffDFE2FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48))),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ReportView(widget.user, bulan))),

            child: Text(
              'Submit',
              style: TextStyle(
                color: Color(0xff4054FF),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),),
        ],
      ),
    );
  }
}
