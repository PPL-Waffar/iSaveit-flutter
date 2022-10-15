// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:isaveit/page/navbar.dart';
import 'package:isaveit/page/pocket/edit_pocket.dart';

import '../../models/user.dart';

class Pocket extends StatefulWidget {
  final User user;
  const Pocket(this.user, {super.key});

  @override
  PocketPage createState() => PocketPage();
}


class PocketPage extends State<Pocket> {

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) =>  SettingView(widget.user)))),

        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.black,
            onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) =>  EditPocket(widget.user))),
          ),
        ],  
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: const Center(
                child: 
                Text('Grocery Balance',
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
    ),
    // height gap
    const SizedBox(height: 32),

    //divider line
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

    const SizedBox(height: 24),

    //display budget and expense card
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          width: 164,
          height: 90,
          decoration: BoxDecoration(
          color: const Color(0xFFDFE2FF),
          borderRadius: BorderRadius.circular(8),
          ),
          child:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                //Text for budget
                Text('Budget',
                style: TextStyle(fontFamily: 'Inter', fontSize: 24, 
                  fontWeight: FontWeight.w700, color: Color(0xFF4054FF))
                ),
                SizedBox(height: 5),
                //Text for amount of money
                Text('Rp 200.000',
                style: TextStyle(fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w500)
                ),
              ]
            )
        ),
        ),
        const SizedBox(width: 20),
        Container(
          padding: const EdgeInsets.all(15),
          width: 164,
          height: 90,
          decoration: BoxDecoration(
            color: const Color(0xFFDFE2FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child:SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                //Text for budget
                Text('Expense',
                style: TextStyle(fontFamily: 'Inter', fontSize: 24, 
                  fontWeight: FontWeight.w700, color: Color(0xFF4054FF))
                ),
                SizedBox(height: 5),
                //Text for amount of money
                Text('Rp 40.000',
                style: TextStyle(fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w500)
                ),
              ]
            )
          )
        )
      ]
    ),

    const SizedBox(height: 24),


    //divider line
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

    const SizedBox(height: 24),

    //transaction text
    Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 20),
      child: const Text('Grocery transactions',
      style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)
      ),
    ),

    const SizedBox(height: 24),
    
    Container(),
    //empty wallet
    // SizedBox(
    //   child: Image.asset( 'assets/images/empty_wallet.png',
    //   width: 250, height: 250),
    // )
    SizedBox(
      child: Row(children: [
        Flexible(
          child: new Container(
            height: 46,
            width: 200,
          padding: new EdgeInsets.only(left: 20.0),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
              TextSpan(text: 'Belanja September minggu kedua\n',style: TextStyle(fontSize: 14.0,fontFamily: 'Roboto',color: Color(0xFF212121),fontWeight: FontWeight.bold,)), 
              TextSpan(text: 'Debit card', style: TextStyle(fontSize: 12, color: Color(0xff979C9E), fontWeight: FontWeight.w700))
              ]
            ),
          ),
          ),
        ),
        Container(
          height: 46,
          width: 200,
          padding: const EdgeInsets.fromLTRB(90, 0, 17, 0),
          child: const Text('-Rp 120.000', style: TextStyle(color: Colors.red, fontSize: 14, fontWeight: FontWeight.w500)),
        ),
        ]
      ),
    ),
    SizedBox(height: 14,),
    Container(
      padding: const EdgeInsets.fromLTRB(17, 0, 16, 0),
      child: const MySeparator(),
    ),
    SizedBox(height: 24,),
     SizedBox(
      child: Row(children: [
        Flexible(
          child: new Container(
            height: 46,
            width: 200,
          padding: new EdgeInsets.only(left: 20.0),
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
              TextSpan(text: 'Patungan Potluck\n',style: TextStyle(fontSize: 14.0,fontFamily: 'Roboto',color: Color(0xFF212121),fontWeight: FontWeight.bold,)), 
              TextSpan(text: 'Credit card', style: TextStyle(fontSize: 12, color: Color(0xff979C9E), fontWeight: FontWeight.w700))
              ]
            ),
          ),
          ),
        ),
        Container(
          height: 46,
          width: 200,
          padding: const EdgeInsets.fromLTRB(90, 0, 17, 0),
          child: const Text('+Rp 120.000', style: TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.w500)),
        ),
        ]
      ),
    ),
    Container(
      padding: const EdgeInsets.fromLTRB(17, 0, 16, 0),
      child: const MySeparator(),
    ),
    

        ],
      ),
      ),
    );    
  }
}


class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: const DecoratedBox(
                decoration: BoxDecoration(color: Color(0xffCDCFD0)),
              ),
            );
          }),
        );
      },
    );
  }
}
    