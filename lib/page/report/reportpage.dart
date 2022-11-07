import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ReportView extends StatefulWidget {
  const ReportView({super.key});

  @override
  ReportPage createState() => ReportPage();
}

class ReportPage extends State<ReportView> {
  final CarouselController _controller = CarouselController();



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
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                children: [
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
                const Text('September 2022', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                
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
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
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
            options: CarouselOptions(enlargeCenterPage: true, height: 200),
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
              Padding(padding: EdgeInsets.fromLTRB(50,0,50,0,),
                child: Row(
                  children: [ 
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
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Income\n',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff4054FF))),
                          TextSpan(
                              text: 'Rp 400.000',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
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
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Expense\n',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff4054FF))),
                          TextSpan(
                              text: 'Rp 400.000',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),),
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
              const Text(
                "This month's spending",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 14,
              ),
              Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child:
              Container(
                padding: const EdgeInsets.fromLTRB(15,10,15,0),
                width: 352,
                height: 50,
                
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'Groceries\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          )),
                      TextSpan(
                          text: 'Rp 150.000',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff4CD471))),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 352,
                height: 10,
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: const MySeparator(),
              ),
              Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child:
              Container(
                padding: const EdgeInsets.fromLTRB(15,10,15,0),
                width: 352,
                height: 50,
                
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'Groceries\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          )),
                      TextSpan(
                          text: 'Rp 150.000',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff4CD471))),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 352,
                height: 10,
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: const MySeparator(),
              ),
              Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child:
              Container(
                padding: const EdgeInsets.fromLTRB(15,10,15,0),
                width: 352,
                height: 50,
                
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'Groceries\n',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          )),
                      TextSpan(
                          text: 'Rp 150.000',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff4CD471))),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                width: 352,
                height: 10,
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                child: const MySeparator(),
              ),
            ]),
          )
        ],
      )),
    );
  }
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
    
