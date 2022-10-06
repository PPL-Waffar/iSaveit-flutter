import 'package:flutter/material.dart';
import 'package:isaveit/page/navbar.dart';
import 'package:isaveit/page/pocket/edit_pocket.dart';

class Pocket extends StatefulWidget {
  const Pocket({super.key});

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
              .push(MaterialPageRoute(builder: (context) => const SettingView()))),

        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.black,
            onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const EditPocket())),
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

    //empty wallet
    SizedBox(
      child: Image.asset( 'assets/images/empty_wallet.png',
      width: 250, height: 250),
    )
        ],
      ),
      ),
    );    
  }
}
    