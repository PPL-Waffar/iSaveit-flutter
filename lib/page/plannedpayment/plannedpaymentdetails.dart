import 'package:flutter/material.dart';
import 'editplannedpayment.dart';

class Plannedpaymentdetails extends StatelessWidget {
  const Plannedpaymentdetails({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop()),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Editplannedpayment()),
                );
              },
            ),
          ],
        ),
        body:
        SingleChildScrollView(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Your Planned Payment Details!', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 32),
                  const Text('Payment Name', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  TextFormField(
                    key: const Key("addPaymentName"),
                    cursorWidth: 50,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                        hintText: 'Spotify'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  const Text('Expense', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  TextFormField(
                    key: const Key("addExpense"),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                        hintText: 'Rp 64.000'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  const Text('Date', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Container(
                      padding: const EdgeInsets.only(),
                      child:Center(
                          child:TextField(
                            key: const Key("transactionDate"),
                            cursorWidth: 50,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.calendar_today),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                                hintText: '2022-10-03'), //editing controller of this TextField
                            readOnly: true,  //set it true, so that user will not able to edit text
                            onTap: () async {
                            },
                          ))),
                  const SizedBox(height: 24),
                  const Text('Type of Payment', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  TextFormField(
                    key: const Key("paymentType"),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                        hintText: 'Debit'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  const Text('Pocket', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  TextFormField(
                    key: const Key("pocketType"),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                        hintText: 'Food'),
                    keyboardType: TextInputType.number,
                  ),
                ]
            )
        ),
    );
  }
}