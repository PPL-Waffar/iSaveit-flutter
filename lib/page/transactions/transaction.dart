// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:isaveit/page/transactions/transaction_form.dart';
import 'package:isaveit/models/user.dart';

// ignore: must_be_immutable
class Transaction extends StatefulWidget {
  User user;
  Transaction(this.user, {super.key});

  @override
  TransactionPage createState() => TransactionPage();
}

class TransactionPage extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 280,
          ),
          AlertDialog(
            title: Center(
              child: Text(
              'Input',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
            ),),
            actions: <Widget>[
              Center(
                child: Column(
                  children: [
                    SizedBox(
                        height: 52,
                        width: 430,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: const Size.fromHeight(48),
                              backgroundColor: Color(0xff4054FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(48),
                              )),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CreateTransaction(widget.user)));
                          },
                          child: Row(children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.wallet_outlined,
                              size: 24,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  'Input Transaction',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ))
                          ]),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 52,
                      width: 430,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            minimumSize: const Size.fromHeight(48),
                            backgroundColor: Color(0xffDFE2FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(48),
                            )),
                        onPressed: () {},
                        child: Row(children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.card_travel,
                            size: 24,
                            color: Color(0xff4054FF),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: Text(
                                'Borrow Transaction',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff4054FF)),
                              ))
                        ]),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
