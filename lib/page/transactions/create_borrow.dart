import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isaveit/models/user.dart';
import 'package:isaveit/page/navbar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map<String, dynamic>> sendNewUser(
    String expensename, String expenseamount, String expensedate, String paymentType, String expenseperson,
    // String expensechoice, String expensepocket,
    User user) async {
  const url = 'http://127.0.0.1:8000/payment/flu-add-payment/';
  // const url = 'https://isaveit-staging.herokuapp.com/payment/flu-add-payment/';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'expense_name': expensename,
        'expense_amount': expenseamount,
        'expense_date': expensedate,
        'expense_type': paymentType,
        'expense_person': expenseperson,
        // 'expense_payment_choice': expensechoice,
        // 'expense_pocket': expensepocket,
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
class CreateBorrow extends StatefulWidget {
  User user;
  CreateBorrow(this.user, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  CreateBorrowPage createState() => CreateBorrowPage();
}

class CreateBorrowPage extends State<CreateBorrow> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController dateinput = TextEditingController();
  String paymentType = "debit card";
  // String _pocketType = "Groceries";
  // String _borrowType = "Debt";
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }
  TextEditingController expensename = TextEditingController();
  TextEditingController expenseamount = TextEditingController();
  TextEditingController expensedate = TextEditingController();
  TextEditingController expenseperson = TextEditingController();

  Map<String, dynamic>? fetchedResult;
  bool? isSuccessful;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:
        SingleChildScrollView(
        child: Form(
        key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),

                  //Edit pocket title
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child:
                    const Text('Borrow Transactions 🤝🏼',
                        style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)
                    ),
                  ),

                  const SizedBox(height: 32),

                  //Balance for borrow
                  SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              child: const Center(
                                child:
                                Text('My Balance',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w500)
                                ),
                              )
                          ),
                          const SizedBox(height: 10),
                          Container(
                            alignment: Alignment.center,
                            child: const Center(
                              child:
                              Text('Rp 200.000',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontFamily: 'Inter', fontSize: 32, fontWeight: FontWeight.w700)
                              ),
                            ),
                          )
                        ],
                      )
                  ),

                  const SizedBox(height: 32),

                  //divider
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

                  //pocket name
                  SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 0.5,),
                            const SizedBox(height: 32),
                            const Text('Payment Name', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: expensename,
                              key: const Key("addPaymentName"),
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                                  hintText: 'Enter your payment here'),
                              keyboardType: TextInputType.name,
                            ),

                            const SizedBox(height: 24),

                            const Text('Amount', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: expenseamount,
                              key: const Key("addAmount"),
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                                  hintText: 'Rp 0'),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 24),
                            const Text('Date', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            Container(
                                padding: const EdgeInsets.only(),
                                child:Center(
                                    child:TextField(
                                      key: const Key("addDate"),
                                      controller: dateinput,
                                      cursorWidth: 50,
                                      decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.calendar_today),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                              borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                                          hintText: 'YYYY-MM-DD'),
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
                            // const Text('Type of Borrowing', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                            // const SizedBox(height: 8),
                            // Padding(
                            //   padding: const EdgeInsets.only(),
                            //   child: Row(
                            //     children: [
                            //       Expanded(
                            //         child: DropdownButtonFormField<String>(
                            //             key: const Key("addBorrowingType"),
                            //             style: const TextStyle(height: 0),
                            //             decoration: const InputDecoration(
                            //               fillColor: Color(0XFFF9F9F9),
                            //               enabledBorder: OutlineInputBorder(
                            //                   borderRadius:
                            //                   BorderRadius.all(Radius.circular(8.0)),
                            //                   borderSide:
                            //                   BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                            //               hintText: 'Debt',
                            //               filled: true,
                            //             ),
                            //             value: _borrowType,
                            //             onChanged: (String? value) => {_borrowType = value!},
                            //             items: const [
                            //               DropdownMenuItem<String>(
                            //                 value: "Debt",
                            //                 child: Text(
                            //                   "Debt",
                            //                   style: TextStyle(
                            //                     color: Colors.black,
                            //                   ),
                            //                 ),
                            //               ),
                            //               DropdownMenuItem(
                            //                   value: "Lend money",
                            //                   child: Text(
                            //                     "Lend money",
                            //                     style: TextStyle(
                            //                       color: Colors.black,
                            //                     ),
                            //                   )),
                            //             ]),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // const SizedBox(height: 24),
                            const Text('Borrower name', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            TextFormField(
                              controller: expenseperson,
                              key: const Key("addBorrowerName"),
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                                  hintText: 'Enter the borrower name here'),
                              keyboardType: TextInputType.number,
                            ),
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
                                        value: paymentType,
                                        onChanged: (String? value) => {paymentType = value!},
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
                            const SizedBox(height: 24),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(left: 20),
                              child: ElevatedButton(
                                key: const Key("createInputTransactions"),
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
                                        expensename.text,
                                        expenseamount.text,
                                        expensedate.text,
                                        paymentType,
                                        expenseperson.text,
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
                                              Text('Failed to input transactions')));
                                    }
                                  }
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => SettingView(widget.user)),
                                  // );
                                },
                                child: const Text('Input Transactions',
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
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => const HomeView()),
                                  // );
                                },
                                child: const Text('Cancel',
                                    style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFFD3180C))
                                ),
                              ),
                            )
                          ]
                      )
                  ),
                ]
            )
        )
    ));
  }
}