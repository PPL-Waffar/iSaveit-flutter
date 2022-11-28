// ignore_for_file: prefer__ructors, prefer__literals_to_create_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:isaveit/page/navbar.dart';
import 'package:isaveit/page/transactions/transaction_form.dart';
import 'package:isaveit/models/user.dart';

import 'create_borrow.dart';

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
          SizedBox(
            height: 280,
          ),
          AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0))),
            contentPadding: EdgeInsets.only(top: 10.0),
            title: Center(
              child: Text(
                'Input',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            ),
            actions: <Widget>[
              Center(
                child: Column(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 15, right: 15),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              minimumSize: Size.fromHeight(48),
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
                              width: 15,
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
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            minimumSize: Size.fromHeight(48),
                            backgroundColor: Color(0xffDFE2FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(48),
                            )),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CreateBorrow(widget.user)));
                        },
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
                            width: 15,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SettingView(widget.user)));
                      },
                      child: Text(
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
