import 'package:flutter/material.dart';
import 'package:isaveit/models/user.dart';
import 'package:isaveit/page/navbar.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:dropdownfield/dropdownfield.dart';


Future<Map<String, dynamic>> sendNewUser(
    String payname, String payamount, String paydate, String paytype, User user) async {
  // const url = 'http://127.0.0.1:8000/payment/flu-add-payment/';
  const url = 'https://isaveit-staging.herokuapp.com/payment/flu-add-payment/';

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
  final _formKey = GlobalKey<FormState>();

  TextEditingController dateinput = TextEditingController();
  String paytype= "debit card";
  // String _pocketType = "Groceries";
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }
  TextEditingController payname = TextEditingController();
  TextEditingController payamount = TextEditingController();
  TextEditingController paydate = TextEditingController();

  Map<String, dynamic>? fetchedResult;
  bool? isSuccessful;

  @override
  Widget build(BuildContext context){
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
        body:
        SingleChildScrollView(
          child: Form(
              key: _formKey,
              // padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Create your planned payment', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 32),
                    const Text('Payment Name', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: payname,
                      key: const Key("addPaymentName"),
                      cursorWidth: 50,
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                          hintText: 'Enter your payment'),
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 32),

                    const Text('Expense', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: payamount,
                      key: const Key("addExpense"),
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                          hintText: 'Rp 0'),
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 32),

                    const Text('Date', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    Container(
                        padding: const EdgeInsets.only(),
                        child:Center(
                            child:TextField(
                              key: const Key("transactionDate"),
                              controller: dateinput,
                              cursorWidth: 50,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.calendar_today),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                                  hintText: 'YYYY-MM'),
                              readOnly: true,  //set it true, so that user will not able to edit text
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context, initialDate: DateTime.now(),
                                    firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101)
                                );
                                if(pickedDate != null ){
                                  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                  setState(() {
                                    dateinput.text = formattedDate; //set output date to TextField value.
                                  });
                                }else{
                                }
                              },
                            ))),
                    const SizedBox(height: 24),
                    const Text('Type of Payment', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.only(),
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
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                      borderSide:
                                      BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                                  hintText: 'Enter your payment method',
                                  filled: true,
                                ),
                                onChanged: (String? value) => {paytype = value!},
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
                    // const SizedBox(height: 24),
                    // const Text('Pocket', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                    // const SizedBox(height: 8),
                    // Padding(
                    //   padding: const EdgeInsets.only(),
                    //   child: Row(
                    //     children: [
                    //       Expanded(
                    //         child: DropdownButtonFormField<String>(
                    //             key: const Key("addPocketName"),
                    //             style: const TextStyle(height: 0),
                    //             decoration: const InputDecoration(
                    //               fillColor: Color(0XFFF9F9F9),
                    //               enabledBorder: OutlineInputBorder(
                    //                   borderRadius:
                    //                   BorderRadius.all(Radius.circular(8.0)),
                    //                   borderSide:
                    //                   BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                    //               hintText: 'Enter your pocket',
                    //               filled: true,
                    //             ),
                    //             value: _pocketType,
                    //             onChanged: (String? value) => {_pocketType = value!},
                    //             items: const [
                    //               DropdownMenuItem<String>(
                    //                 value: "Groceries",
                    //                 child: Text(
                    //                   "Groceries",
                    //                   style: TextStyle(
                    //                     color: Colors.black,
                    //                   ),
                    //                 ),
                    //               ),
                    //               DropdownMenuItem(
                    //                   value: "Health",
                    //                   child: Text(
                    //                     "Health",
                    //                     style: TextStyle(
                    //                       color: Colors.black,
                    //                     ),
                    //                   )),
                    //               DropdownMenuItem(
                    //                   value: "Food And Beverages",
                    //                   child: Text(
                    //                     "Food And Beverages",
                    //                     style: TextStyle(
                    //                       color: Colors.black,
                    //                     ),
                    //                   )),
                    //             ]),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(height: 32),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 20),
                      child: ElevatedButton(
                        key: const Key("createSubmitButton"),
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                            elevation: 0,
                            backgroundColor: const Color(0XFF4054FF),
                            shape:
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(48),)),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            fetchedResult = await sendNewUser(
                                payname.text,
                                payamount.text,
                                paydate.text,
                                paytype,
                                widget.user);
                            isSuccessful = fetchedResult!['isSuccessful'];
                            if (isSuccessful == true) {
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                      Text('Failed to create planned payment')));
                            }
                          }
                        },
                        child: const Text('Create Planned Payment',
                            style: TextStyle(color: Colors.white)
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 20),
                      child: ElevatedButton(
                        key: const Key("createCancelButton"),
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48), backgroundColor: Colors.white70,
                            elevation: 0,
                            // backgroundColor: const Color(0xffb74093),
                            shape:
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(48),)),
                        // style: ElevatedButton.styleFrom(
                        //     primary: Colors.white70,),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SettingView(widget.user)),
                          );
                        },
                        child: const Text('Cancel',
                            style: TextStyle(color: Color(0xFFD3180C))
                        ),
                      ),
                    ),
                  ]
              )
          ),
        )
    );
  }
}