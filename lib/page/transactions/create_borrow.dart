// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, must_be_immutable, annotate_overrides, use_build_context_synchronously, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isaveit/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../navbar.dart';

Future<Map<String, dynamic>> allBalance(User user) async {
  String url =
      'https://isaveit-backend.herokuapp.com/pocket/all-balance/?session_id=${user.sessionId}';

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
    String borrowName,
    String borrowAmount,
    String borrowDate,
    String borrowType,
    String borrowerName,
    String paymentType,
    String _valPocket,
    User user) async {
  const url = 'https://isaveit-backend.herokuapp.com/expense/add-expense/';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'expense_name': borrowName,
        'expense_amount': borrowAmount,
        'expense_date': borrowDate,
        'expense_type': borrowType,
        'expense_person': borrowerName,
        'expense_payment_choice': paymentType,
        'expense_pocket': _valPocket,
        'session_id': user.sessionId,
      }),
    );
    Map<String, dynamic> result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return result;
    } else {
      return <String, dynamic>{'error': 'Web service is offline'};
    }
  } catch (error) {
    return {'isSuccessful': false, 'error': ''};
  }
}

Future<Map<String, dynamic>> fetchGroups(User user) async {
  String url =
      'https://isaveit-backend.herokuapp.com/pocket/get-pocket/?session_id=${user.sessionId}';

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

class CreateBorrow extends StatefulWidget {
  User user;
  CreateBorrow(this.user, {super.key});

  @override
  CreateBorrowPage createState() => CreateBorrowPage();
}

class CreateBorrowPage extends State<CreateBorrow> {
  final _formKey = GlobalKey<FormState>();
  List allpocket = [];
  bool _isLoading = false;
  Map<String, dynamic> response = {};
  late Timer _timer;
  String borrowType = "Debt";
  String paymentType = "debit card";
  TextEditingController dateinput = TextEditingController();
  Map<String, dynamic> responseBalance = {};
  List<dynamic> allbalance = [];

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

  Map<String, dynamic>? fetchedResult;
  bool? isSuccessful;
  String? _valPocket;
  TextEditingController borrowDate = TextEditingController();
  TextEditingController borrowerName = TextEditingController();
  TextEditingController borrowName = TextEditingController();
  TextEditingController borrowAmount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            leadingWidth: 250,
            backgroundColor: Colors.white,
            leading: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(children: [
                IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => SettingView(widget.user)))),
                Text('Borrow Transaction',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black))
              ]),
            ),
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
                      child: Center(
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
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Divider(
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
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            key: Key("borrowName"),
                            controller: borrowName,
                            decoration: InputDecoration(
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
                            controller: borrowAmount,
                            key: Key("borrowAmount"),
                            decoration: InputDecoration(
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
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Center(
                          child: TextField(
                        key: Key("borrowDate"),
                        controller: borrowDate,
                        decoration: InputDecoration(
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
                              borrowDate.text =
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
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                              key: ValueKey("borrowType"),
                              decoration: InputDecoration(
                                fillColor: Color(0XFFF9F9F9),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        width: 1.0, color: Color(0xFFDBDBDB))),
                                hintText: 'Enter your payment method',
                                filled: true,
                              ),
                              value: borrowType,
                              onChanged: (String? value) =>
                                  {borrowType = value!},
                              items: const [
                                DropdownMenuItem<String>(
                                  value: "Debt",
                                  child: Text(
                                    "Debt",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                    value: "Lend Money",
                                    child: Text(
                                      "Lend Money",
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
                      'Borrower Name',
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
                            key: Key("borrowerName"),
                            controller: borrowerName,
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(
                                        width: 1.0, color: Color(0xFFDBDBDB))),
                                hintText: 'Enter your borrower name'),
                          ),
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
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                              key: ValueKey("PaymentType"),
                              style: TextStyle(height: 0),
                              decoration: InputDecoration(
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
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: DropdownButtonFormField(
                      style: TextStyle(height: 0),
                      decoration: InputDecoration(
                        fillColor: Color(0XFFF9F9F9),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                                width: 1.0, color: Color(0xFFDBDBDB))),
                        hintText: 'Enter your pocket name',
                        filled: true,
                      ),
                      key: ValueKey("PocketType"),
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
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: ElevatedButton(
                      key: Key("inputTransactionButton"),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size.fromHeight(48),
                          elevation: 0,
                          backgroundColor: Color(0XFF4054FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48),
                          )),
                      onPressed: () async {
                        {
                          fetchedResult = await sendNewUser(
                              borrowName.text,
                              borrowAmount.text,
                              borrowDate.text,
                              borrowType,
                              borrowerName.text,
                              paymentType,
                              _valPocket!,
                              widget.user);
                          isSuccessful = fetchedResult!['isSuccessful'];
                          if (isSuccessful!) {
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SettingView(widget.user)),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Transaction Failed'),
                              ),
                            );
                          }
                        }
                      },
                      child: Text('Input Transaction'),
                    ),
                  ),

                  Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 30, right: 30),
                      child: TextButton(
                        key: Key("cancelTransaction"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
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

class InputTransactions extends StatelessWidget {
  const InputTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        key: const Key("createInputTransactions"),
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
            elevation: 0,
            backgroundColor: const Color(0XFF4054FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),
            )),
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => SettingView(widget.user)),
          // );
        },
        child: const Text('Input Transactions',
            style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class Cancelpayment extends StatelessWidget {
  const Cancelpayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
