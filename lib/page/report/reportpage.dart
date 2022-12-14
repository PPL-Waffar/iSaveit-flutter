// ignore_for_file: unused_field, prefer_const_constructors, unused_local_variable, annotate_overrides, unnecessary_new

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:isaveit/page/navbar.dart';
import 'package:isaveit/page/report/downloadreport.dart';
import 'package:isaveit/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math' as math;

Future<Map<String, dynamic>> fetchGroups(User user) async {
  String url =
      'http://localhost:8000/financialreport/view-financial-report/?session_id=${user.sessionId}';

  try {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, dynamic> body = {
      'session_id': user.sessionId,
    };
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );
    Map<String, dynamic> extractedData = jsonDecode(response.body);
    Map<String, dynamic> extractedData2 =
        jsonDecode(extractedData['expense_list']);
    if (response.statusCode == 200) {
      return {
        "isSuccessful": true,
        "data": extractedData,
        "error": null,
        "data2": extractedData2
      };
    } else {
      return {
        "isSuccessful": false,
        "data": extractedData,
        "error": "An error has occurred"
      };
    }
  } catch (error) {
    return {
      "isSuccessful": false,
      "data": [],
      "error": "Our web service is down."
    };
  }
}

class ReportView extends StatefulWidget {
  final User user;
  final String bulan;
  const ReportView(this.user, this.bulan, {super.key});

  @override
  ReportPage createState() => ReportPage();
}

class ReportPage extends State<ReportView> {
  late Timer _timer;
  bool _isLoading = false;
  Map<String, dynamic> databaru = {};
  getResponse() async {
    Map<String, dynamic> response = await fetchGroups(widget.user);
    setState(() {
      databaru = response["data2"];
    });
  }

  final CarouselController _controller = CarouselController();

  Map<String, dynamic> response = {};
  Map<String, dynamic> thedata = {};
  Map<String, dynamic> thedata2 = {};
  Map<String, dynamic> hasil = {};

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) async {
      await _intializeData();
      if (mounted) {
        _isLoading = true;
        setState(() => _isLoading = true);
      }
    });
  }

  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Future<void> _intializeData() async {
    response = await fetchGroups(
      widget.user,
    );
    if (response["isSuccessful"]) {
      thedata = response["data"];
      thedata2 = response["data2"];
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      String bulanBaru = widget.bulan;
      final ChartIndexedValueMapper<String>? dataLabelMapper;
      var bulan = bulanBaru;
      if (bulan == 'January') {
        bulanBaru = '01';
      } else if (bulan == 'February') {
        bulanBaru = '02';
      } else if (bulan == 'March') {
        bulanBaru = '03';
      } else if (bulan == 'April') {
        bulanBaru = '04';
      } else if (bulan == 'May') {
        bulanBaru = '05';
      } else if (bulan == 'June') {
        bulan = '06';
      } else if (bulan == 'July') {
        bulanBaru = '07';
      } else if (bulan == 'August') {
        bulanBaru = '08';
      } else if (bulan == 'September') {
        bulanBaru = '09';
      } else if (bulan == 'October') {
        bulanBaru = '10';
      } else if (bulan == 'November') {
        bulanBaru = '11';
      } else if (bulan == 'December') {
        bulanBaru = '12';
      }
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leadingWidth: 150,
            leading:  Row(
              children: [ 
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SettingView(widget.user)))),
                Text(
                'My Spendings',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ]),
          ),
          body: SingleChildScrollView(
            child: FutureBuilder(
                future: _intializeData(),
                builder: (context, snapshot) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: const Text(
                          'Overview',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                          SfCircularChart(
                            // title: ChartTitle(text: if, textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                            series: <CircularSeries>[
                            PieSeries<ChartModel, String>(
                              
                                dataSource: [
                                  for (var i = 0;
                                      i < thedata2[bulanBaru].length;
                                      i++)
                                    ChartModel(
                                        title: thedata2[bulanBaru][i]
                                            ['expense_name'],
                                        percentage: thedata2[bulanBaru][i]
                                            ['expense_nilai'],
                                        color: Color(
                                                (math.Random().nextDouble() *
                                                        0xFFFFFF)
                                                    .toInt())
                                            .withOpacity(1.0)),
                                ],
                                xValueMapper: (ChartModel data, _) =>
                                    data.title,
                                yValueMapper: (ChartModel data, _) =>
                                    data.percentage,
                                dataLabelMapper: (ChartModel data, _) =>
                                    data.title,
                                radius: '85%',
                                dataLabelSettings: DataLabelSettings(
                                    isVisible: true,
                                    labelPosition:
                                        ChartDataLabelPosition.outside,
                                    connectorLineSettings:
                                        ConnectorLineSettings(
                                            // Type of the connector line
                                            type: ConnectorType.curve))),
                          ]),  
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                        child: Column(children: [
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: const Divider(
                              color: Color(0xFFDBDBDB),
                              height: 20,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xffDFE2FF),
                                ),
                                padding: const EdgeInsets.all(10),
                                width: 164,
                                height: 68,
                                child: RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      const TextSpan(
                                          text: 'Income\n',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff4054FF))),
                                      TextSpan(
                                          text: thedata["total_expense"],
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 7,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xffDFE2FF),
                                ),
                                width: 164,
                                height: 68,
                                child: RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      const TextSpan(
                                          text: 'Expense\n',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xff4054FF))),
                                      TextSpan(
                                          text: thedata["total_income"],
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: const Divider(
                              color: Color(0xFFDBDBDB),
                              height: 20,
                              thickness: 1,
                              indent: 0,
                              endIndent: 0,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: const [
                              Text("This month's spending"),
                              SizedBox(
                                width: 16,
                              ),
                              DownloadReport()
                            ],
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          for (var i = 0; i < thedata2[bulanBaru].length; i++)
                            Column(
                              children: [
                                Row(children: [
                                  Flexible(
                                    child:  Container(
                                      height: 46,
                                      width: 200,
                                      padding: new EdgeInsets.only(left: 20.0),
                                      child: RichText(
                                        text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text:thedata2[bulanBaru][i]
                                                     ["expense_name"] ,
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontFamily: 'Roboto',
                                                color: Color(0xFF212121),
                                                fontWeight: FontWeight.bold,
                                              )),
                                         
                                        ]),
                                  ),
                                ),
                              ),
                              Container(
                                  height: 46,
                                  width: 200,
                                  padding:
                                      const EdgeInsets.fromLTRB(90, 0, 17, 0),
                                  child: Text(
                                      thedata2[bulanBaru][i]
                                                ["expense_amount"],
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                ),
                                 
                                const SizedBox(
                                  height: 5,
                                ),
                                
                              ],
                            ),
                        MySeparator(),
                        SizedBox(height: 10,)
                        ]
                        ),
                    ],
                  )
                      )
                    ]
                );
                      
                }),
          ));
    } else {
      return const Scaffold(
          body: Center(
        child: Text(
          "Loading",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ) // this will show when loading is false
          );
    }
  }
}

class ChartModel {
  ChartModel({
    required this.title,
    required this.percentage,
    required this.color,
  });
  final String title;
  final dynamic percentage;
  final Color color;
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: const DecoratedBox(
                decoration: BoxDecoration(color: Color(0xffCDCFD0)),
              ),
            );
          }),
        );
      },
    );
  }
}
