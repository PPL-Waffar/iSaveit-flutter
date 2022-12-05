// ignore_for_file: prefer_const_constructors, prefer_is_empty, annotate_overrides

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
Future<Map<String, dynamic>> fetchExpense(User user) async {
  String url =
      'http://localhost:8000/expense/get-expense/?session_id=${user.sessionId}';

  try {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, dynamic> body = {'session_id': user.sessionId};

    final response7 = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    List<dynamic> expensedata = jsonDecode(response7.body);
    // await Future.delayed(Duration(seconds: 10));
    if (response7.statusCode == 200) {
      return {"isSuccessful": true, "data": expensedata, "error": null};
    } else {
      return {
        "isSuccessful": false,
        "data": expensedata,
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
      'http://10.0.2.2:8000/user/user-info/?session_id=${user.sessionId}';

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
  Map<String, dynamic> response9 = {};

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 8), (timer) async {
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
    response9 = await fetchExpense(widget.user);
    if (response4["isSuccessful"]) {
      allplanned.addAll(response9["data"]);
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
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            leadingWidth: 150,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    '${thedata["name"]}',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),

            //Add icon for showDialog create pocket and pp
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 35.0,
                ),
                onPressed: () => showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    contentPadding: EdgeInsets.only(top: 10.0),
                    title: Center(
                        child: Text('Add',
                            style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.w700))),
                    insetPadding: EdgeInsets.zero,
                    actions: <Widget>[
                      Center(
                        child: Column(
                          children: [
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      minimumSize: const Size.fromHeight(48),
                                      backgroundColor: Color(0xff4054FF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(48),
                                      )),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CreatePocket(widget.user)));
                                  },
                                  child: Row(

                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: <Widget>[
                                        SizedBox(width: 20),
                                        Icon(
                                          // <-- Icon
                                          Icons.account_balance_wallet_outlined,
                                          size: 24.0,
                                          color: Color(0xffDFE2FF),
                                        ),
                                        SizedBox(width: 15),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Text(
                                              'New Pocket',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                            ))
                                      ]),
                                )),
                            SizedBox(
                              height: 16,
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      minimumSize: const Size.fromHeight(48),
                                      backgroundColor: Color(0xffDFE2FF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(48),
                                      )),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PlannedPayment(widget.user)));
                                  },

                                  // ignore: prefer_const_literals_to_create_immutables
                                  child: Row(children: [
                                    SizedBox(width: 20),
                                    Icon(Icons.wallet,
                                        size: 24.0, color: Color(0xff4054FF)),
                                    SizedBox(width: 8),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Text(
                                          'New Planned Payment',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xff4054FF)),
                                        ))
                                  ]),
                                )),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),

        //My balance information
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 24,
              ),
              //container for my balance
              Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Text('My Balance',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w500)),
                  )),
              const SizedBox(height: 10),

              Container(
                alignment: Alignment.center,
                child: Center(
                  child: Text('Rp 5.000.000',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 32,
                          fontWeight: FontWeight.w700)),
                ),
              ),

              const SizedBox(height: 32),

              //divider line
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

              const SizedBox(height: 16),

              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20),
                child: const Text('💳 My Payments',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),

              const SizedBox(height: 16),

              FutureBuilder(
                  future: fetchPlanned(widget.user),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && allplanned.length > 0) {
                      return CarouselSlider.builder(
                          itemCount: allplanned.length,
                          options: CarouselOptions(
                            height: 120.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            viewportFraction: 1,
                          ),
                          itemBuilder: (context, index, realIndex) {
                            if (allplanned[index]["pay_name"] != null) {
                              return SizedBox(
                                height: 120,
                                width: 210,
                                child: ElevatedButton(
                                    onPressed: () => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PlanPayment(
                                                          widget.user,
                                                          allplanned[index]
                                                              ["pay_name"])))
                                        },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffDFE2FF),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(5, 10, 5, 3),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              allplanned[index]["pay_name"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 19,
                                                  color: Color(0xff4054FF)),
                                            ),
                                            Text(
                                              allplanned[index]["pay_amount"],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Date",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff4054FF),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        )),
                                                    Text(
                                                      allplanned[index]
                                                          ["pay_date"],
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                  height: 15,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Type',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xff4054FF),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                        allplanned[index]
                                                            ["pay_categories"],
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.black))
                                                  ],
                                                )
                                              ],
                                            )
                                          ]),
                                    )),
                              );
                            } else {
                              return SizedBox(
                                height: 120,
                                width: 210,
                                child: ElevatedButton(
                                    onPressed: () => {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PlanPayment(
                                                          widget.user,
                                                          allplanned[index][
                                                              "expense_name"])))
                                        },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xffDFE2FF),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8))),
                                    child: Padding(
                                      padding: EdgeInsets.fromLTRB(5, 10, 5, 3),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              allplanned[index]["expense_name"],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 19,
                                                  color: Color(0xff4054FF)),
                                            ),
                                            Text(
                                              allplanned[index]
                                                  ["expense_amount"],
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Date",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color:
                                                              Color(0xff4054FF),
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        )),
                                                    Text(
                                                      allplanned[index]
                                                          ["expense_date"],
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                  height: 15,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Type',
                                                      style: TextStyle(
                                                        fontSize: 14,
                                                        color:
                                                            Color(0xff4054FF),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                        allplanned[index][
                                                            "expense_category"],
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: Color(
                                                                0xff4054FF)))
                                                  ],
                                                )
                                              ],
                                            )
                                          ]),
                                    )),
                              );
                            }
                          });
                    } else {
                      return SizedBox(
                        child: Image.asset('assets/images/empty_wallet.png',
                            width: 250, height: 250),
                      );
                    }
                  }),

              const SizedBox(height: 32),

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

              const SizedBox(height: 16),

              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 20),
                child: const Text('💰 My Pockets',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
              ),

              FutureBuilder(
                  future: _intializeData(),
                  builder: (context, snapshot) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int i = 0; i < allpocket.length; i++)
                            Padding(
                                padding: EdgeInsets.all(10),
                                child: SizedBox(
                                    height: 72,
                                    width: 343,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xffDFE2FF),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8))),
                                      onPressed: () => {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Pocket(
                                                    widget.user,
                                                    allpocket[i]["pocket_name"],
                                                    allpocket[i]
                                                        ["pocket_budget"])))
                                      },
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 15, 15, 10),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                allpocket[i]["pocket_name"],
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                    color: Color(0xff4054FF)),
                                                textAlign: TextAlign.left,
                                              ),
                                              Text(
                                                allpocket[i]["pocket_budget"],
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                                textAlign: TextAlign.left,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )))
                        ]);
                  })
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
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
