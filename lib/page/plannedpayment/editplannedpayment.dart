// ignore_for_file: unused_field, prefer_final_fields, annotate_overrides, unnecessary_null_comparison, prefer_conditional_assignment

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isaveit/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:isaveit/page/navbar.dart';

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
    String paydate, String paytype, User user) async {
  // const url = 'http://127.0.0.1:8000/payment/flu-add-payment/';
  const url = 'http://localhost:8000/payment/flu-update-payment/';

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

// ignore: must_be_immutable
class Editplannedpayment extends StatefulWidget {
  User user;

  Map<String, dynamic> thedata = {};

  Editplannedpayment(this.user, this.thedata, {super.key});
  @override
  State<Editplannedpayment> createState() => EditplannedpaymentState();
}

class EditplannedpaymentState extends State<Editplannedpayment> {
  TextEditingController dateinput = TextEditingController();
  String _paymentType = "Debit";
  String _pocketType = "Groceries";
  Map<String, dynamic> response = {};
  List allpocket = [];
  String? _valPocket;
  late Timer _timer;
  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
      await _intializeData();
      if (mounted) {
        setState(() {});
      }
    });
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

  Map<String, dynamic>? fetchedResult;
  bool? isSuccessful;
  TextEditingController payamount = TextEditingController();
  TextEditingController paydate = TextEditingController();
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
              onPressed: () => Navigator.of(context).pop()),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Edit Your Planned Payment',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 32),
                const Text('Expense',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: payamount,
                  key: const Key("addExpense"),
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide:
                              BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                      hintText: widget.thedata["amount"]),
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
                      controller: dateinput,
                      cursorWidth: 50,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.calendar_today),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(
                                  width: 1.0, color: Color(0xFFDBDBDB))),
                          hintText: widget.thedata[
                              "paydate"]), //editing controller of this TextField
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
                    ))),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Type of Payment',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownButtonFormField<String>(
                            key: const Key("addPaymentType"),
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
                            value: _paymentType,
                            onChanged: (String? value) =>
                                {_paymentType = value!},
                            items: const [
                              DropdownMenuItem<String>(
                                value: "Debit",
                                child: Text(
                                  "Debit",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DropdownMenuItem(
                                  value: "Cash",
                                  child: Text(
                                    "Cash",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  )),
                              DropdownMenuItem(
                                  value: "E-money",
                                  child: Text(
                                    "E-money",
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
                      if (payamount.text == null) {
                        payamount.text = widget.thedata["amount"];
                      }
                      if (dateinput.text == null) {
                        dateinput.text = widget.thedata["paydate"];
                      }
                      if (_paymentType == null) {
                        _paymentType = widget.thedata["payment_type"];
                      }
                      fetchedResult = await sendNewUser(
                          widget.thedata["name"],
                          payamount.text,
                          paydate.text,
                          _paymentType,
                          widget.user);
                      isSuccessful = fetchedResult!['isSuccessful'];
                      if (isSuccessful == true) {
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SettingView(widget.user)));
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Failed to create planned payment')));
                      }
                    },
                    child: const Text('Edit Planned Payment',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: ElevatedButton(
                      key: const Key("deletePlannedPayment"),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                          elevation: 0,
                          backgroundColor: const Color(0xFFDFE2FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48),
                          )),
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Delete Planned Payment'),
                          content: const Text(
                              'Are you sure you want to delete this planned payment?'),
                          actions: <Widget>[
                            TextButton(
                              key: const Key("cancelDeletePlannedPayment"),
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel',
                                  style: TextStyle(color: Color(0xFFD3180C))),
                            ),
                            TextButton(
                              key: const Key("confirmDeletePlannedPayment"),
                              onPressed: () => Navigator.pop(
                                context,
                                'Delete',
                              ),
                              child: const Text('Delete',
                                  style: TextStyle(color: Color(0XFF4054FF))),
                            ),
                          ],
                        ),
                      ),
                      child: const Text('Delete Planned Payment',
                          style: TextStyle(color: Color(0XFF4054FF))),
                    )),
                const SizedBox(height: 24),
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 20),
                    child: TextButton(
                      key: const Key("cancelEditPocket"),
                      onPressed: () {
                        // Navigator.push(
                        // context,
                        // MaterialPageRoute(builder: (context) => const Plannedpaymentdetails()),
                        //  );
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Color(0xFFD3180C)),
                      ),
                    ))
              ],
            )));
  }
}
