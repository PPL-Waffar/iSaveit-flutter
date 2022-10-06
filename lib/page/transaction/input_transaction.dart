import 'package:flutter/material.dart';
import '../navbar.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class Transaction extends StatefulWidget {
  const Transaction({super.key});
  @override
  CreateTransaction createState() => CreateTransaction();
}

class CreateTransaction extends State<Transaction> {
  String _paymentType = "Debit";
  String _pocketType = "Groceries";
  String _transacType = "Transfer";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 150,
        leading: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Input Transaction',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),
            Center(
                child: Column(children: const <Widget>[
              Text(
                'My Balance',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                'Rp 5.000.000',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ])),
            const SizedBox(
              height: 10,
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
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Payment Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      key: const Key("addPaymentName"),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your payment'),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Text(
                'Amount',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      key: const Key("addAmount"),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your payment'),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Text(
                'Date',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      key: const Key("addDate"),
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                          ),
                          hintText: 'DD-MM-YY'),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Text(
                'Type of Transaction',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
                 Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                        key: const Key("addPaymentType"),
                        style: const TextStyle(height: 0),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide:
                                  BorderSide(width: 1.0, color: Colors.black)),
                          hintText: 'Enter your payment method',
                          filled: true,
                        ),
                        value: _transacType,
                        onChanged: (String? value) => {_transacType = value!},
                        items: const [
                          DropdownMenuItem<String>(
                            value: "Transfer",
                            child: Text(
                              "Transfer",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                              value: "CreditCard",
                              child: Text(
                                "Credit Card",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )),
                          DropdownMenuItem(
                              value: "Debit",
                              child: Text(
                                "Debit",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )),
                        ]),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Text(
                'Type of Payment',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                        key: const Key("addPaymentType"),
                        style: const TextStyle(height: 0),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide:
                                  BorderSide(width: 1.0, color: Colors.black)),
                          hintText: 'Enter your payment method',
                          filled: true,
                        ),
                        value: _paymentType,
                        onChanged: (String? value) => {_paymentType = value!},
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
            const Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Text(
                'Pocket',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                        key: const Key("addPocketName"),
                        style: const TextStyle(height: 0),
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                              borderSide:
                                  BorderSide(width: 1.0, color: Colors.black)),
                          hintText: 'Enter your pocket',
                          filled: true,
                        ),
                        value: _pocketType,
                        onChanged: (String? value) => {_pocketType = value!},
                        items: const [
                          DropdownMenuItem<String>(
                            value: "Groceries",
                            child: Text(
                              "Groceries",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                              value: "Health",
                              child: Text(
                                "Health",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )),
                          DropdownMenuItem(
                              value: "Food And Beverages",
                              child: Text(
                                "Food And Beverages",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )),
                        ]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Container(
                height: 52,
                width: 327,
                padding: const EdgeInsets.fromLTRB(70, 16, 70, 16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xff4054FF)),
                child: ElevatedButton(
                  key: const Key("createTransaction"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                    elevation: 0,
                    backgroundColor: const Color(0XFF4054FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingView()));
                  },
                  child: const Text(
                    'Input Transaction',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
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
          ],
        ),
      ),
    );
  }
}
