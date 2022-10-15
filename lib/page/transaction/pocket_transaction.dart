
import 'package:flutter/material.dart';

class PocketTransaction extends StatefulWidget {
  const PocketTransaction({super.key});
  @override
  ViewTransaction createState() => ViewTransaction();
}

class ViewTransaction extends State<PocketTransaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {}),
              //=> Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) =>  SettingView()))),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.black,
              onPressed: () {}
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        )));
  }
}
