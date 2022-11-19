// ignore_for_file: duplicate_import, no_leading_underscores_for_local_identifiers, avoid_print, unused_field, annotate_overrides, prefer_const_constructors, duplicate_ignore, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isaveit/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import "package:flutter/material.dart";
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:isaveit/page/navbar.dart';

Future<Map<String, dynamic>> sendNewUser(
    String transactionName,
    String transactionAmount,
    String transactionDate,
    String transacType,
    String paymentType,
    String _valPocket,
    User user) async {
  const url = 'http://localhost:8000/transaction/input-transaction/';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'input_transaction_payment_name': transactionName,
        'input_transaction_amount': transactionAmount,
        'input_transaction_date': transactionDate,
        'input_transaction_transaction_type': transacType,
        'input_transaction_payment_type': paymentType,
        'input_transaction_pocket': _valPocket,
        'session_id': user.sessionId,
      }),
    );
    Map<String, dynamic> result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return result;
    } else {
      print(response);
      return <String, dynamic>{'error': 'Web service is offline'};
    }
  } catch (error) {
    return {'isSuccessful': false, 'error': ''};
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

// ignore: must_be_immutable
class CreateTransaction extends StatefulWidget {
  User user;
  CreateTransaction(this.user, {super.key});
  @override
  CreateTransactionPage createState() => CreateTransactionPage();
}

class CreateTransactionPage extends State<CreateTransaction> {
  final _formKey = GlobalKey<FormState>();
  List allpocket = [];
  String? _valPocket;
  String paymentType = "debit card";
  // String _pocketType = "Groceries";
  String transacType = "Income";
  Map<String, dynamic> response = {};
  late Timer _timer;

  void initState() {
    super.initState();
    transactionDate.text = "";

    _timer = Timer.periodic(Duration(seconds: 2), (timer) async {
      await _intializeData();
      if (mounted) {
        setState(() {});
      }
    });
  }

  Future<void> _intializeData() async {
    response = await fetchGroups(widget.user);
    if (response["isSuccessful"]) {
      allpocket = response["data"];
    }
  }

  TextEditingController transactionDate = TextEditingController();

  TextEditingController transactionName = TextEditingController();
  TextEditingController transactionAmount = TextEditingController();
  Map<String, dynamic>? fetchedResult;
  bool? isSuccessful;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 150,
          backgroundColor: Colors.white,
          leading: Padding(padding: EdgeInsets.only(left: 20, top:10),
              child: Text('Input Transaction',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black))),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 32),
                Container(
                    alignment: Alignment.center,
                    child: const Center(
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
                  child: const Center(
                    child: Text('Rp 5.000.000',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 32,
                            fontWeight: FontWeight.w700)),
                  ),
                ),

                const SizedBox(
                  height: 32,
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

                const SizedBox(height: 32),
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Payment Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          key: const Key("transactionName"),
                          controller: transactionName,
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide(
                                      width: 1.0, color: Color(0xFFDBDBDB))),
                              hintText: 'Purchase stationaries'),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Amount',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: transactionAmount,
                          key: const Key("transactionAmount"),
                          decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide(
                                      width: 1.0, color: Color(0xFFDBDBDB))),
                              hintText: 'Rp 0'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                //Date Picker
                Container(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Center(
                        child: TextField(
                      key: const Key("transactionDate"),
                      controller: transactionDate,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.calendar_today),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(
                                  width: 1.0, color: Color(0xFFDBDBDB))),
                          hintText:
                              'YYYY-MM-dd'), //editing controller of this TextField

                      readOnly:
                          true, //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                                2000), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2101));

                        if (pickedDate != null) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          setState(() {
                            transactionDate.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                    ))),

                const SizedBox(height: 32),

                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Type of Transaction',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                            key: const ValueKey("transactionType"),
                            decoration: const InputDecoration(
                              fillColor: Color(0XFFF9F9F9),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide(
                                      width: 1.0, color: Color(0xFFDBDBDB))),
                              hintText: 'Enter your payment method',
                              filled: true,
                            ),
                            value: transacType,
                            onChanged: (String? value) =>
                                {transacType = value!},
                            items: const [
                              DropdownMenuItem<String>(
                                value: "Income",
                                child: Text(
                                  "Income",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                  value: "Expense",
                                  child: Text(
                                    "Expense",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  )),
                            ]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Type of Payment',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                            key: const ValueKey("PaymentType"),
                            style: const TextStyle(height: 0),
                            decoration: const InputDecoration(
                              fillColor: Color(0XFFF9F9F9),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide(
                                      width: 1.0, color: Color(0xFFDBDBDB))),
                              hintText: 'Enter your payment method',
                              filled: true,
                            ),
                            value: paymentType,
                            onChanged: (String? value) =>
                                {paymentType = value!},
                            items: const [
                              DropdownMenuItem<String>(
                                value: "debit card",
                                child: Text(
                                  "debit card",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                  value: "cash",
                                  child: Text(
                                    "cash",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  )),
                              DropdownMenuItem(
                                  value: "e-wallet",
                                  child: Text(
                                    "e-wallet",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  )),
                            ]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Pocket',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: DropdownButtonFormField(
                    style: const TextStyle(height: 0),
                    decoration: const InputDecoration(
                      fillColor: Color(0XFFF9F9F9),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide:
                              BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                      hintText: 'Enter your pocket name',
                      filled: true,
                    ),
                    key: const ValueKey("PocketType"),
                    items: allpocket.map((item) {
                      return DropdownMenuItem(
                        // ignore: sort_child_properties_last
                        child: Text(item['pocket_name'],
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              color: Colors.black,
                            )),
                        value: item['pocket_name'].toString(),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _valPocket = value;
                      });
                    },
                    value: _valPocket,
                    isExpanded: true,
                  ),
                ),
                
                const SizedBox(height: 32),

                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  child: ElevatedButton(
                    key: const Key("inputTransactionButton"),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                        elevation: 0,
                        backgroundColor: const Color(0XFF4054FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(48),
                        )),
                    onPressed: () async {
                      {
                        fetchedResult = await sendNewUser(
                            transactionName.text,
                            transactionAmount.text,
                            transactionDate.text,
                            paymentType,
                            transacType,
                            _valPocket!,
                            widget.user);
                        isSuccessful = fetchedResult!['isSuccessful'];
                        if (isSuccessful!) {
                          // ignore: use_build_context_synchronously
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingView(widget.user)),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Transaction Failed'),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text('Input Transaction'),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: Center(
                    child: TextButton(
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
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ));
  }
}
