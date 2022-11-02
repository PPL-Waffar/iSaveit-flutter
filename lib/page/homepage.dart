// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:isaveit/page/plannedpayment/plannedpayment.dart';
import 'package:isaveit/page/plannedpayment/plannedpaymentdetails.dart';
import 'package:isaveit/page/pocket/create_pocket.dart';
import 'package:isaveit/models/user.dart';
import 'package:isaveit/page/pocket/pocket_details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

// import '../page//profile.dart';

//----------------------------------------//

Future<Map<String, dynamic>> fetchPlanned(User user) async {
  String url =
      'http://localhost:8000/payment/flu-get-payment/?session_id=${user.sessionId}';

  try {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, dynamic> body = {'session_id': user.sessionId};

    final response6 = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    List<dynamic> planneddata = jsonDecode(response6.body);
    // await Future.delayed(Duration(seconds: 10));
    if (response6.statusCode == 200) {
      return {"isSuccessful": true, "data": planneddata, "error": null};
    } else {
      return {
        "isSuccessful": false,
        "data": planneddata,
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

Future<Map<String, dynamic>> fetchGroups(User user) async {
  String url =
      'http://localhost:8000/pocket/get-pocket/?session_id=${user.sessionId}';

  try {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, dynamic> body = {'session_id': user.sessionId};

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    List<dynamic> extractedData = jsonDecode(response.body);
    // await Future.delayed(Duration(seconds: 10));
    if (response.statusCode == 200) {
      return {"isSuccessful": true, "data": extractedData, "error": null};
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

Future<Map<String, dynamic>> getUserInfo(User user) async {
  String url2 =
      'http://localhost:8000/user/user-info/?session_id=${user.sessionId}';

  try {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, dynamic> body = {'session_id': user.sessionId};

    final response2 = await http.post(
      Uri.parse(url2),
      headers: headers,
      body: jsonEncode(body),
    );

    Map<String, dynamic> extractedData2 = jsonDecode(response2.body);

    // await Future.delayed(Duration(seconds: 10));
    if (response2.statusCode == 200) {
      return {"isSuccessful": true, "data": extractedData2, "error": null};
    } else {
      return {
        "isSuccessful": false,
        "data": extractedData2,
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

class HomeView extends StatefulWidget {
  final User user;
  const HomeView(this.user, {super.key});

  @override
  State<HomeView> createState() => HomePage();
}

class HomePage extends State<HomeView> {
  bool _isLoading = false;
  List<dynamic> allpocket = [];
  Map<String, dynamic> response = {};
  // ignore: unused_field
  late Timer _timer;
  Map<String, dynamic> response3 = {};
  Map<String, dynamic> thedata = {};
  List<dynamic> allplanned = [];
  Map<String, dynamic> response4 = {};

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 4), (timer) async {
      await _intializeData();
      if (mounted) {
        _isLoading = true;
        setState(() => _isLoading = true);
      }
    });
  }

  Future<void> _intializeData() async {
    response = await fetchGroups(widget.user);
    if (response["isSuccessful"]) {
      allpocket = response["data"];
    }
    response3 = await getUserInfo(widget.user);
    if (response3["isSuccessful"]) {
      thedata = response3["data"];
    }
    response4 = await fetchPlanned(widget.user);
    if (response4["isSuccessful"]) {
      allplanned = response4["data"];
    }
  }

  @override
  Widget build(BuildContext context) {
    FutureBuilder(
        future: getUserInfo(widget.user),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(thedata["name"]);
          } else {
            return CircularProgressIndicator();
          }
        });

    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Welcome Back \n ${thedata["name"]}",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                          title: const Text('Add'),
                          actions: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.indigo), // <-- ElevatedButton
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreatePocket(widget.user)));
                              },
                              child: const Text('New Pocket'),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.indigo), // <-- ElevatedButton
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PlannedPayment(widget.user)));
                              },
                              child: const Text(
                                'Planned Payment',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            TextButton(
                              // <-- TextButton
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ]),
                    ),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 40,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Text(
                'My balance ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                'Rp 5.000.000',
                style: TextStyle(
                  fontSize: 25,
                ),
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
                height: 15,
              ),
              FutureBuilder(
                  future: fetchPlanned(widget.user),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CarouselSlider.builder(
                          itemCount: allplanned.length,
                          options: CarouselOptions(
                            height: 110.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            viewportFraction: 0.8,
                          ),
                          itemBuilder: (context, index, realIndex) {
                            return SizedBox(
                              height: 30,
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlanPayment(
                                              widget.user,
                                              allplanned[index]["pay_name"])))
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffDFE2FF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                child: RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: allplanned[index]["pay_name"] +
                                              '\n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 19,
                                              color: Color(0xff4054FF))),
                                      TextSpan(
                                          text: allplanned[index]
                                                  ["pay_amount"] +
                                              '\n',
                                          style: TextStyle(fontSize: 18)),
                                      TextSpan(
                                          text: 'Date            Type\n',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff4054FF),
                                            fontWeight: FontWeight.bold,
                                          )),
                                      TextSpan(
                                          text: allplanned[index]["pay_date"] +
                                              '    ' +
                                              allplanned[index]
                                                  ["pay_categories"],
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Color(0xff4054FF),
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'My Pocket',
                style: TextStyle(
                  fontSize: 18,
                ),
                textDirection: TextDirection.ltr,
              ),
              FutureBuilder(
                  future: _intializeData(),
                  builder: (context, snapshot) {
                    return Container(
                        child: Column(children: [
                      for (int i = 0; i < allpocket.length; i++)
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: SizedBox(
                            height: 72,
                            width: 343,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffDFE2FF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Pocket(
                                            widget.user,
                                            allpocket[i]["pocket_name"],
                                            allpocket[i]["pocket_budget"])))
                              },
                              child: RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: allpocket[i]["pocket_name"] + '\n',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    TextSpan(
                                        text: allpocket[i]["pocket_budget"],
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    ]));
                  })
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
          body: Center(
            child: Text("Loading", style:TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
          )// this will show when loading is false
          );
    }
  }
}
