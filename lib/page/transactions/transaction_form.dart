
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:isaveit/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';


Future<Map<String, dynamic>> sendNewUser(
    String transactionName, String transactionAmount, String transactionDate, String transacType, String paymentType, User user) async {
  const url = 'http://127.0.0.1:8000/transaction/input-transaction/';

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
class CreateTransaction extends StatefulWidget {
  User user;
  CreateTransaction(this.user, {super.key});
  @override
  CreateTransactionPage createState() => CreateTransactionPage();
}

class CreateTransactionPage extends State<CreateTransaction> {

  final _formKey = GlobalKey<FormState>();
  
  String paymentType = "debit card";
  // String _pocketType = "Groceries";
  String transacType = "Income";

  TextEditingController transactionDate = TextEditingController(); 
    @override
    void initState() {
      transactionDate.text = ""; //set the initial value of text field
      super.initState();
  }

  TextEditingController transactionName = TextEditingController();
  TextEditingController transactionAmount= TextEditingController();
  Map<String, dynamic>? fetchedResult;
  bool? isSuccessful;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFF9F9F9),
        elevation: 0,
        leadingWidth: 500,
        leading: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Input Transaction',
              style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black)
            )),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                    Text('Rp 5.000.000',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Inter', fontSize: 32, fontWeight: FontWeight.w700)
                    ),
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
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      key: const Key("addTransactionName"),
                      controller: transactionName,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
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
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: transactionAmount,
                      key: const Key("addTransactionAmount"),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                          hintText: 'Rp 0'),
                          inputFormatters: <TextInputFormatter>[
                            CurrencyTextInputFormatter(
                              locale: 'id',
                              decimalDigits: 0,
                              symbol: 'Rp ',
                            ),
                          ],
                          keyboardType: TextInputType.number,),
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
            //Date Picker
            Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child:Center( 
             child:TextField(
                key: const Key("addTransactionDate"),
                controller: transactionDate,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                    hintText: 'YYYY-MM-dd'), //editing controller of this TextField
                
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
                         transactionDate.text = formattedDate; //set output date to TextField value. 
                      });
                  }else{
                  }
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
                              borderSide:
                                  BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                          hintText: 'Enter your payment method',
                          filled: true,
                        ),
                        value: transacType,
                        onChanged: (String? value) => {transacType = value!},
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

            const SizedBox(height: 32),


            
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
                  shape: 
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                  ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                              fetchedResult = await sendNewUser(
                                  transactionName.text,
                                  transactionAmount.text,
                                  transactionDate.text,
                                  paymentType,
                                  transacType,
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
                child: const Text('Input Transaction'),
              ),
            ),

            
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: Center(
                child: TextButton(
                  key: const Key("cancelTransaction"),
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
          ],
        ),
      ),
    )
    );
  }
}