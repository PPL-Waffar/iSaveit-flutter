// ignore_for_file: unused_import, prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:isaveit/page/report/downloadreport.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:intl/intl.dart';
import 'package:isaveit/page/feedback/read_feedback.dart';
import 'package:isaveit/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:isaveit/page/plannedpayment/editplannedpayment.dart';

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
    // await Future.delayed(Duration(seconds: 10));
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
  const ReportView(this.user, {super.key});

  @override
  ReportPage createState() => ReportPage();
}

class ReportPage extends State<ReportView> {
  DateTime date = DateTime.now();
  String date1 = DateFormat('yyyy-MM-dd').format(DateTime.now());
  final CarouselController _controller = CarouselController();
  Map<String, dynamic> response = {};
  Map<String, dynamic> thedata = {};
  Map<String, dynamic> thedata2 = {};
  Map<String, dynamic> hasil = {};

  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  Map<String, double> dataMap1 = {
    "Flutter": 4,
    "React": 4,
    "Xamarin": 4,
    "Ionic": 4,
  };
  @override
  void initState() {
    super.initState();
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
    String bulan2 = date1.substring(5, 7);
    var bulan = date1.substring(5, 7);
    if (bulan == '01') {
      bulan = 'Januari';
    } else if (bulan == '02') {
      bulan = 'Februari';
    } else if (bulan == '03') {
      bulan = 'Maret';
    } else if (bulan == '04') {
      bulan = 'April';
    } else if (bulan == '05') {
      bulan = 'Mei';
    } else if (bulan == '06') {
      bulan = 'Juni';
    } else if (bulan == '07') {
      bulan = 'Juli';
    } else if (bulan == '08') {
      bulan = 'Agustus';
    } else if (bulan == '09') {
      bulan = 'September';
    } else if (bulan == '10') {
      bulan = 'Oktober';
    } else if (bulan == '11') {
      bulan = 'November';
    } else if (bulan == '12') {
      bulan = 'Desember';
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 150,
          leading: const Center(
            child: Text(
              'My Spendings',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
              future: _intializeData(),
              builder: (context, snapshot) {
                return Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Row(children: [
                          ElevatedButton(
                            key: const Key("previousPage"),
                            style: ElevatedButton.styleFrom(
                                elevation: 0, backgroundColor: Colors.white),
                            onPressed: () => _controller.previousPage(),
                            child: const Icon(
                              Icons.arrow_back_sharp,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          Text(
                            bulan,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            width: 70,
                          ),
                          ElevatedButton(
                            key: const Key("nextPage"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              elevation: 0,
                            ),
                            onPressed: () => _controller.nextPage(),
                            child: const Icon(
                              Icons.arrow_forward_sharp,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                        ])),
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
                    CarouselSlider(
                      items: [
                        PieChart(
                          dataMap: dataMap,
                          animationDuration: const Duration(milliseconds: 800),
                          chartLegendSpacing: 32,
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          initialAngleInDegree: 0,
                          chartType: ChartType.ring,
                          ringStrokeWidth: 32,
                          centerText: "HYBRID",
                          legendOptions: const LegendOptions(
                            showLegendsInRow: false,
                            legendPosition: LegendPosition.right,
                            showLegends: true,
                            legendShape: BoxShape.circle,
                            legendTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValueBackground: true,
                            showChartValues: true,
                            showChartValuesInPercentage: false,
                            showChartValuesOutside: false,
                            decimalPlaces: 1,
                          ),
                        ),
                        PieChart(
                          dataMap: dataMap1,
                          animationDuration: const Duration(milliseconds: 800),
                          chartLegendSpacing: 32,
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          initialAngleInDegree: 0,
                          chartType: ChartType.ring,
                          ringStrokeWidth: 32,
                          centerText: "HYBRID",
                          legendOptions: const LegendOptions(
                            showLegendsInRow: false,
                            legendPosition: LegendPosition.right,
                            showLegends: true,
                            legendShape: BoxShape.circle,
                            legendTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValueBackground: true,
                            showChartValues: true,
                            showChartValuesInPercentage: false,
                            showChartValuesOutside: false,
                            decimalPlaces: 1,
                          ),
                        ),
                      ],
                      options:
                          CarouselOptions(enlargeCenterPage: true, height: 200),
                      carouselController: _controller,
                    ),
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
                              width: 40,
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
                              width: 16,
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
                        for (var i = 0; i < thedata2[bulan2].length; i++)
                          Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(14),
                                width: 342,
                                height: 72,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xffDFE2FF),
                                ),
                                child: RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: thedata2[bulan2][i]
                                                  ["expense_name"] +
                                              '\n',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                          )),
                                      TextSpan(
                                          text: thedata2[bulan2][i]
                                              ["expense_amount"],
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff4CD471))),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 14,
                              ),
                            ],
                          )
                      ]),
                    )
                  ],
                );
              }),
        ));
  }
}
