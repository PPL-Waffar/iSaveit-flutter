import 'package:flutter/material.dart';
import 'package:isaveit/main.dart';
import 'package:isaveit/models/user.dart';
import 'package:isaveit/page/navbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

Future<Map<String, dynamic>> fetchGroups(User user, String plannedname) async {
  String url =
      'http://localhost:8000/payment/flu-view-payment/?session_id=${user.sessionId}&input_pocketname=$plannedname';

  try {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, dynamic> body = {
      'session_id': user.sessionId,
      'input_pocketname': plannedname
    };
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return {"isSuccessful": true, "data": data, "error": null};
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    return {
      "isSuccessful": false,
      "data": [],
      "error": "Our web service is down."
    };
  }
}

class PlanPayment extends StatefulWidget {
  final User user;
  final String plannedname;

  const PlanPayment(this.user, this.plannedname, {super.key});

  @override
  Plannedpaymentdetails createState() => Plannedpaymentdetails();
}

class Plannedpaymentdetails extends State<PlanPayment> {
  Map<String, dynamic> response = {};
  Map<String, dynamic> thedata = {};

  @override
  void initState() {
    super.initState();

  }

  Future<void> _intializeData() async {
    response = await fetchGroups(widget.user, widget.plannedname);
    if (response["isSuccessful"]) {
      thedata = response["data"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingView(widget.user)))),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: FutureBuilder(
              future: _intializeData(),
              builder: (context, snapshot) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Your Planned Payment Details!',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 32),
                      const Text('Payment Name',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 8),
                      TextFormField(
                        key: const Key("addPaymentName"),
                        cursorWidth: 50,
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(
                                    width: 1.0, color: Color(0xFFDBDBDB))),
                            hintText: thedata["name"]),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 24),
                      const Text('Expense',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 8),
                      TextFormField(
                        key: const Key("addExpense"),
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(
                                    width: 1.0, color: Color(0xFFDBDBDB))),
                            hintText: thedata["amount"]),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 24),
                      const Text('Date',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 8),
                      Container(
                          padding: const EdgeInsets.only(),
                          child: Center(
                              child: TextField(
                            key: const Key("transactionDate"),
                            cursorWidth: 50,
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.calendar_today),
                                enabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        width: 1.0, color: Color(0xFFDBDBDB))),
                                hintText: thedata[
                                    "paydate"]), //editing controller of this TextField
                            readOnly:
                                true, //set it true, so that user will not able to edit text
                            onTap: () async {},
                          ))),
                      const SizedBox(height: 24),
                      const Text('Type of Payment',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 8),
                      TextFormField(
                        key: const Key("paymentType"),
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(
                                    width: 1.0, color: Color(0xFFDBDBDB))),
                            hintText: thedata["type"]),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 24),
                      const Text('Pocket',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 8),
                      TextFormField(
                        key: const Key("pocketType"),
                        decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                borderSide: BorderSide(
                                    width: 1.0, color: Color(0xFFDBDBDB))),
                            hintText: thedata["pocket"]),
                        keyboardType: TextInputType.number,
                      ),
                    ]);
              }),
        ));
  }
}
