// ignore_for_file: prefer_const_constructors, unnecessary_new, unused_field, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:isaveit/page/navbar.dart';
import 'package:isaveit/page/pocket/edit_pocket.dart';
import 'package:isaveit/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<Map<String, dynamic>> fetchGroups(User user, String pocketname) async {
  String url =
      'https://isaveit-backend.herokuapp.com/transaction/view-transaction/?session_id=${user.sessionId}&input_pocketname=$pocketname';

  try {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, dynamic> body = {
      'session_id': user.sessionId,
      'input_pocketname': pocketname
    };

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

Future<Map<String, dynamic>> fetchPocket(User user, String pocketname) async {
  String url =
      'https://isaveit-backend.herokuapp.com/pocket/all-expense/?session_id=${user.sessionId}&input_pocketname=$pocketname';

  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  Map<String, dynamic> body = {'session_id': user.sessionId};

  final response3 = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(body),
  );

  List<dynamic> extractedData2 = jsonDecode(response3.body);
  // await Future.delayed(Duration(seconds: 10));
  if (response3.statusCode == 200) {
    return {"isSuccessful": true, "data": extractedData2, "error": null};
  } else {
    return {
      "isSuccessful": false,
      "data": extractedData2,
      "error": "An error has occurred"
    };
  }
}

class Pocket extends StatefulWidget {
  final User user;
  final String pocketname;
  final String pocketbudget;
  final String pocketdefault;
  const Pocket(
      this.user, this.pocketname, this.pocketbudget, this.pocketdefault,
      {super.key});

  @override
  PocketPage createState() => PocketPage();
}

class PocketPage extends State<Pocket> {
  List<dynamic> allpocket = [];
  Map<String, dynamic> response = {};
  Map<String, dynamic> response3 = {};
  List<dynamic> allbalance = [];

  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 3), (timer) async {
      await _intializeData();
    });
  }

  Future<void> _intializeData() async {
    response = await fetchGroups(widget.user, widget.pocketname);
    if (response["isSuccessful"]) {
      allpocket = response["data"];
    }
    response3 = await fetchPocket(widget.user, widget.pocketname);
    if (response3["isSuccessful"]) {
      allbalance = response3["data"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SettingView(widget.user)))),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.black,
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditPocket(widget.user, widget.pocketname,
                    widget.pocketbudget, widget.pocketdefault))),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FutureBuilder(
                future: _intializeData(),
                builder: (context, snapshot) {
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                child: Center(
                                  child: Text('${widget.pocketname} Balance',
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
                                child: Text(widget.pocketbudget,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700)),
                              ),
                            )
                          ],
                        ),
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
                        const SizedBox(height: 24),

                        //display budget and expense card
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                width: 164,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFDFE2FF),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: SingleChildScrollView(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                      //Text for budget
                                      Text('Budget',
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFF4054FF))),
                                      SizedBox(height: 5),
                                      //Text for amount of money
                                      Text(widget.pocketdefault,
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500)),
                                    ])),
                              ),
                              const SizedBox(width: 20),
                              Container(
                                  padding: const EdgeInsets.all(15),
                                  width: 164,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFDFE2FF),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SingleChildScrollView(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                        //Text for budget
                                        Text('Expense',
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 24,
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF4054FF))),
                                        SizedBox(height: 5),
                                        //Text for amount of money
                                        Text(allbalance[0],
                                            style: TextStyle(
                                                fontFamily: 'Inter',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500)),
                                      ])))
                            ]),
                      ]);
                }),
            // height gap

            //divider line

            const SizedBox(height: 24),

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

            const SizedBox(height: 24),

            //transaction text
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 20),
              child: const Text('Grocery transactions',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w700)),
            ),

            const SizedBox(height: 24),

            FutureBuilder(
                future: _intializeData(),
                builder: (context, snapshot) {
                  return Column(children: [
                    if (allpocket.length == 0)
                      SizedBox(
                        child: Image.asset('assets/images/empty_wallet.png',
                            width: 250, height: 250),
                      )
                    else
                      for (int i = 0; i < allpocket.length; i++)

                        // ignore: prefer_is_empt

                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          child: SizedBox(
                            child: Row(children: [
                              Flexible(
                                child: new Container(
                                  height: 46,
                                  width: 200,
                                  padding: new EdgeInsets.only(left: 20.0),
                                  child: RichText(
                                    text: TextSpan(
                                        style:
                                            DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: allpocket[i][
                                                      "transaction_payment_name"] +
                                                  '\n',
                                              style: TextStyle(
                                                fontSize: 14.0,
                                                fontFamily: 'Roboto',
                                                color: Color(0xFF212121),
                                                fontWeight: FontWeight.bold,
                                              )),
                                          TextSpan(
                                              text: allpocket[i][
                                                  "transaction_transaction_type"],
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff979C9E),
                                                  fontWeight: FontWeight.w700))
                                        ]),
                                  ),
                                ),
                              ),
                              if (allpocket[i]["transaction_payment_type"] ==
                                  "Expense")
                                Container(
                                  height: 46,
                                  width: 200,
                                  padding:
                                      const EdgeInsets.fromLTRB(90, 0, 17, 0),
                                  child: Text(
                                      allpocket[i]["transaction_amount"],
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                )
                              else
                                Container(
                                  height: 46,
                                  width: 200,
                                  padding:
                                      const EdgeInsets.fromLTRB(90, 0, 17, 0),
                                  child: Text(
                                      allpocket[i]["transaction_amount"],
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                ),
                            ]),
                          ),
                        ),
                  ]);
                }),

            // SizedBox(
            //   height: 14,
            // ),
            // Container(
            //   padding: const EdgeInsets.fromLTRB(17, 0, 16, 0),
            //   child: const MySeparator(),
            // ),
            // SizedBox(
            //   height: 24,
            // ),
            // SizedBox(
            //   child: Row(children: [
            //     // Flexible(
            //     //   child: new Container(
            //     //     height: 46,
            //     //     width: 200,
            //     //     padding: new EdgeInsets.only(left: 20.0),
            //     //     child: RichText(
            //     //       text: TextSpan(
            //     //           style: DefaultTextStyle.of(context).style,
            //     //           children: const <TextSpan>[
            //     //             TextSpan(
            //     //                 text: 'Patungan Potluck\n',
            //     //                 style: TextStyle(
            //     //                   fontSize: 14.0,
            //     //                   fontFamily: 'Roboto',
            //     //                   color: Color(0xFF212121),
            //     //                   fontWeight: FontWeight.bold,
            //     //                 )),
            //     //             TextSpan(
            //     //                 text: 'Credit card',
            //     //                 style: TextStyle(
            //     //                     fontSize: 12,
            //     //                     color: Color(0xff979C9E),
            //     //                     fontWeight: FontWeight.w700))
            //     //           ]),
            //     //     ),
            //     //   ),
            //     // ),
            //     Container(
            //       height: 46,
            //       width: 200,
            //       padding: const EdgeInsets.fromLTRB(90, 0, 17, 0),
            //       child: const Text('+Rp 120.000',
            //           style: TextStyle(
            //               color: Colors.green,
            //               fontSize: 14,
            //               fontWeight: FontWeight.w500)),
            //     ),
            //   ]),
            // ),
            Container(
              padding: const EdgeInsets.fromLTRB(17, 0, 16, 0),
              child: const MySeparator(),
            ),
          ],
        ),
      ),
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
