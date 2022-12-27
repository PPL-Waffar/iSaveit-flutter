// ignore_for_file: unused_field, no_leading_underscores_for_local_identifiers, prefer_const_constructors, duplicate_ignore, annotate_overrides

import 'package:flutter/material.dart';
import 'package:isaveit/models/user.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
// import 'package:dropdownfield/dropdownfield.dart';

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

Future<Map<String, dynamic>> sendNewUser(String payname, String payamount,
    String paydate, String paytype, String _valPocket, User user) async {
  // const url = 'http://127.0.0.1:8000/payment/flu-add-payment/';
  const url = 'http://localhost:8000/payment/flu-add-payment/';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'input_payname': payname,
        'input_payamount': payamount,
        'input_paydate': paydate,
        'input_paymentchoice': paytype,
        'input_paycategories': _valPocket,
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

//ignore: must_be_immutable
class PlannedPayment extends StatefulWidget {
  User user;
  PlannedPayment(this.user, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreatePlannedPayment createState() => _CreatePlannedPayment();
}

class _CreatePlannedPayment extends State<PlannedPayment> {
  // String _adminType = "Debit";
  List allpocket = [];
  String? _valPocket;
  final _formKey = GlobalKey<FormState>();
  late Timer _timer;
  TextEditingController dateinput = TextEditingController();
  String paytype = "debit card";
  Map<String, dynamic> response = {};
  // String _pocketType = "Groceries";
  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 2), (timer) async {
      await _intializeData();
      if (mounted) {
        setState(() {});
      }

    }
    
    );
    dateinput.text = ""; //set the initial value of text field
    super.initState();
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
  }

  TextEditingController payname = TextEditingController();
  TextEditingController payamount = TextEditingController();
  TextEditingController paydate = TextEditingController();

  Map<String, dynamic>? fetchedResult;
  bool? isSuccessful;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        
        body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              // padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 100),

                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      alignment: Alignment.topLeft,
                      child: const Text('💳 Create Planned Payment',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                    ),

                    const SizedBox(height: 32),

                    Padding(padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text('Payment Name',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w700))),

                     SizedBox(height: 8),
                    Padding(padding: EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      controller: payname,
                      key: const Key("addPaymentName"),
                      
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(
                                  width: 1.0, color: Color(0xFFDBDBDB))),
                          hintText: 'Enter your payment'),
                      keyboardType: TextInputType.number,
                    )),

                    const SizedBox(height: 32),

                    Padding(padding: EdgeInsets.only(left: 30, right: 30),
                    child: Text('Expense',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w700))),
                    const SizedBox(height: 8),

                    Padding(padding: EdgeInsets.only(left: 30, right: 30),
                    child:
                    TextFormField(
                      controller: payamount,
                      key: const Key("addExpense"),
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(
                                  width: 1.0, color: Color(0xFFDBDBDB))),
                          hintText: 'Rp 0'),
                      keyboardType: TextInputType.number,
                    )),

                    const SizedBox(height: 32),

                    Padding(padding: EdgeInsets.only(left: 30, right: 30),
                    child:
                    const Text('Date',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w700))),
                    const SizedBox(height: 8),


                    Padding(padding: EdgeInsets.only(left: 30, right: 30),
                    child:
                    Container(
                        padding: const EdgeInsets.only(),
                        child: Center(
                            child: TextField(
                          key: const Key("transactionDate"),
                          controller: dateinput,
                          cursorWidth: 50,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.calendar_today),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  borderSide: BorderSide(
                                      width: 1.0, color: Color(0xFFDBDBDB))),
                              hintText: 'YYYY-MM'),
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
                                dateinput.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {}
                          },
                        )))),

                    const SizedBox(height: 24),


                    Padding(padding: EdgeInsets.only(left: 30, right: 30),
                    child:
                    const Text('Type of Payment',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w700))),

                    const SizedBox(height: 8),
                    
                    Padding(padding: EdgeInsets.only(left: 30, right: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: DropdownButtonFormField<String>(
                                key: const Key("addPaymentType"),
                                style: const TextStyle(height: 0),
                                value: paytype,
                                decoration: const InputDecoration(
                                  fillColor: Color(0XFFF9F9F9),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          width: 1.0,
                                          color: Color(0xFFDBDBDB))),
                                  hintText: 'Enter your payment method',
                                  filled: true,
                                ),
                                onChanged: (String? value) =>
                                    {paytype = value!},
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
                    const SizedBox(height: 24),

                    Padding(padding: EdgeInsets.only(left: 30, right: 30),
                    child:
                     Text('Type of Pocket',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w700))),
                    const SizedBox(height: 8),

                    Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: DropdownButtonFormField(
                        style: const TextStyle(height: 0),
                        decoration: const InputDecoration(
                          fillColor: Color(0XFFF9F9F9),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(
                                  width: 1.0, color: Color(0xFFDBDBDB))),
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
                        key: const Key("createSubmitButton"),
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                            elevation: 0,
                            backgroundColor: const Color(0XFF4054FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(48),
                            )),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            fetchedResult = await sendNewUser(
                                payname.text,
                                payamount.text,
                                paydate.text,
                                paytype,
                                _valPocket!,
                                widget.user);
                            isSuccessful = fetchedResult!['isSuccessful'];
                            if (isSuccessful == true) {
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Failed to create planned payment')));
                            }
                          }
                        },
                        child: const Text('Create Planned Payment',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),

                    const SizedBox(height: 16),
                    
                    Container(
                      alignment: Alignment.center,
                      child: TextButton(
                          key: const Key("createCancelButton"),
                          onPressed: () {Navigator.pop(context);},
                          child: const Text('Cancel',
                              style: TextStyle(color: Color(0xFFD3180C))),
                        ),
                    ),
                  ])),
        ));
  }
}
