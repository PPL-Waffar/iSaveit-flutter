// ignore_for_file: duplicate_import, no_leading_underscores_for_local_identifiers, avoid_print, unused_field, annotate_overrides, prefer_ _ ructors, duplicate_ignore, use_build_context_synchronously, prefer_ _literals_to_create_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

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

Future<Map<String, dynamic>> allBalance(User user) async {
  String url =
      'http://localhost:8000/pocket/all-balance/?session_id=${user.sessionId}';

  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  Map<String, dynamic> body = {'session_id': user.sessionId};

  final responsed = await http.post(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(body),
  );
  List<dynamic> totalbalance = jsonDecode(responsed.body);

  // await Future.delayed(Duration(seconds: 10));
  if (responsed.statusCode == 200) {
    return {"isSuccessful": true, "data": totalbalance, "error": null};
  } else {
    return {
      "isSuccessful": false,
      "data": totalbalance,
      "error": "An error has occurred"
    };
  }
}

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
  Map<String, dynamic> responseBalance = {};
  List<dynamic> allbalance = [];
  bool _isLoading = false;

@override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 3), (timer) async {
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
    responseBalance = await allBalance(widget.user);
    if (responseBalance["isSuccessful"]) {}
    allbalance = responseBalance["data"];
  }

  TextEditingController transactionDate = TextEditingController();

  TextEditingController transactionName = TextEditingController();
  TextEditingController transactionAmount = TextEditingController();
  Map<String, dynamic>? fetchedResult;
  bool? isSuccessful;

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 150,
          backgroundColor: Colors.white,
          leading: 
            Padding(
              padding: EdgeInsets.only( top: 10),
              child: Row(
                children :[ 
                  IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SettingView(widget.user)))),
              Text('Input Transaction',
                  style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black))]
            ),
        ),),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 32),
                Container(
                    alignment: Alignment.center,
                    child:   Center(
                      child: Text('My Balance',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w500)),
                    )),
                SizedBox(height: 10),
                Container(
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(allbalance[0],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 32,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),

                SizedBox(height: 32),

                Container(
                  margin:   EdgeInsets.only(left: 20, right: 20),
                  child:   Divider(
                    color: Color(0xFFDBDBDB),
                    height: 20,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                ),

                 SizedBox(height: 32),
                 Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Payment Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                 SizedBox(height: 8),
                Padding(
                  padding:   EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          key:   Key("transactionName"),
                          controller: transactionName,
                          decoration:   InputDecoration(
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

                 SizedBox(height: 32),

                 Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Amount',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                 SizedBox(height: 8),
                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: transactionAmount,
                          key:  Key("transactionAmount"),
                          decoration:  InputDecoration(
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

                 SizedBox(height: 32),

                 Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Date',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                 SizedBox(height: 8),
                //Date Picker
                Container(
                    padding:  EdgeInsets.only(left: 30, right: 30),
                    child: Center(
                        child: TextField(
                      key:  Key("transactionDate"),
                      controller: transactionDate,
                      decoration:  InputDecoration(
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

                 SizedBox(height: 32),

                 Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Type of Transaction',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                 SizedBox(height: 8),
                Padding(
                  padding:  EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                            key:  ValueKey("transactionType"),
                            decoration:  InputDecoration(
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
                            items: [
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

                 SizedBox(height: 32),

                 Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Type of Payment',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                 SizedBox(height: 8),
                Padding(
                  padding:  EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                            key:  ValueKey("PaymentType"),
                            style:  TextStyle(height: 0),
                            decoration:  InputDecoration(
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
                            items:  [
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

                  SizedBox(height: 32),

                  Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    'Pocket',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                  SizedBox(height: 8),
                Padding(
                  padding:   EdgeInsets.only(left: 30, right: 30),
                  child: DropdownButtonFormField(
                    style:   TextStyle(height: 0),
                    decoration:   InputDecoration(
                      fillColor: Color(0XFFF9F9F9),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide:
                              BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                      hintText: 'Enter your pocket name',
                      filled: true,
                    ),
                    key:   ValueKey("PocketType"),
                    items: allpocket.map((item) {
                      return DropdownMenuItem(
                        // ignore: sort_child_properties_last
                        child: Text(item['pocket_name'],
                            // ignore: prefer_ _ ructors
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
                
                  SizedBox(height: 32),

                Container(
                  alignment: Alignment.center,
                  margin:   EdgeInsets.only(left: 30, right: 30),
                  child: ElevatedButton(
                    key:   Key("inputTransactionButton"),
                    style: ElevatedButton.styleFrom(
                        minimumSize:   Size.fromHeight(48),
                        elevation: 0,
                        backgroundColor:   Color(0XFF4054FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(48),
                        )),
                    onPressed: () async {
                      {fetchedResult = await sendNewUser(transactionName.text,transactionAmount.text,transactionDate.text,paymentType,transacType,_valPocket!,widget.user);
                        isSuccessful = fetchedResult!['isSuccessful'];
                        if (isSuccessful!) {// ignore: use_build_context_synchronously
                          Navigator.push(context,MaterialPageRoute(builder: (context) => SettingView(widget.user)),);} 
                          else {ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Transaction Failed'),),
                          );}}},
                    child:   Text('Input Transaction'),
                  ),
                ),
              
                Container(
                  alignment: Alignment.center,
                  margin:   EdgeInsets.only(left: 30, right: 30),
                child: TextButton(
                      key:   Key("cancelTransaction"),
                      onPressed: () {Navigator.pop(context);},
                      child:   Text(
                        'Cancel',
                        style: TextStyle(color: Color(0xFFD3180C)),
                      ),
                    )),
                  SizedBox(height: 32),
              ],
            ),
          ),
        ));
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
