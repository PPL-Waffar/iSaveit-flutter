import 'package:flutter/material.dart';
import 'package:isaveit/page/report/downloadreport.dart';

import 'package:pie_chart/pie_chart.dart';

class ReportView extends StatefulWidget {
  const ReportView({super.key});

  @override
  ReportPage createState() => ReportPage();
}

class ReportPage extends State<ReportView> {

  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                  children: [
                    const SizedBox(width: 50,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                      ),
                      onPressed: () {},
                      child: const Icon(Icons.arrow_back_sharp, color: Colors.black,),),
                    const SizedBox(width: 75,),
                    const Text('September 2022', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                    const SizedBox(width: 75,),
                    ElevatedButton(
                      onPressed: () {
                      },
                      child: const Icon(Icons.arrow_forward_sharp, color: Colors.black,),),
                    const SizedBox(width: 50,),
                  ]
              ),

              Container(
                padding: const EdgeInsets.all(16),
                child: const Text('Overview', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),),
              ),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                child: Column(
                    children : [
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
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            color: const Color(0xffDFE2FF),
                            child: Column(
                              children: const [
                                Text('Income', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xff4054FF)),),
                                SizedBox(height: 7,),
                                Text('Rp 400.000', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),)
                              ],
                            ),
                          ),
                          const SizedBox(width: 16,),
                          Column(
                              children: const [
                                Text('Expense', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xff4054FF)),),
                                SizedBox(height: 7,),
                                Text('Rp 500.000', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),)
                              ])
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
                      const SizedBox(height: 10,),
                      Row(
                        children: const [
                          Text("This month's spending"),
                          SizedBox(width: 16,),
                          DownloadReport()
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(14),
                        width: 342,
                        height: 72,
                        child: Column(
                          children: const [
                            Text('Groceries', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),),
                            SizedBox(height: 7,),
                            Text('-Rp 13.000', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xffFF0000)),)
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(14),
                        width: 342,
                        height: 72,
                        child: Column(
                          children: const [
                            Text('Groceries', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),),
                            SizedBox(height: 7,),
                            Text('-Rp 13.000', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xff4CD471)),)
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(14),
                        width: 342,
                        height: 72,
                        child: Column(
                          children: const [
                            Text('Health', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),),
                            SizedBox(height: 7,),
                            Text('-Rp 150.000', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xff4CD471)),)
                          ],
                        ),
                      ),
                    ]
                ),
              )
            ],
          )
      ),
    );
  }
}