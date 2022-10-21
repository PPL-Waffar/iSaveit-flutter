import 'package:flutter/material.dart';
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
                    onPressed: () {},
                    child: const Icon(Icons.arrow_forward_sharp, color: Colors.black,),),
                const SizedBox(width: 50,)
                ]
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
            )

            ],)
        
      ),
    );
  }
}