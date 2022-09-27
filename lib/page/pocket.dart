import 'package:flutter/material.dart';
import 'package:isaveit/page/editPocket.dart';

class pocket extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( 
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        //add edit button on the right top corner
        leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop()),
        
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.black,
            onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => editPocket())),
          ),
        ],  
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            balance(),
            const SizedBox(height: 32),
            divider(),
            const SizedBox(height: 24),
            BudgetExpenseColumn(),
            const SizedBox(height: 24),
            divider(),
            transactionTitle(),
            emptyWallet()
        ],)
      ,)
);

  }
}

class balance extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Column(
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
    );
  }
}

//create divider
class divider extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: const Divider(
        color: Color(0xFFDBDBDB),
        height: 20,
        thickness: 1,
        indent: 0,
        endIndent: 0,
      ),
    );
  }
}

class  BudgetExpenseColumn extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
              budget(),
              const SizedBox(width: 20),
              expense()
        ]
    );
  }
}

class budget extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(15),
      width: 164,
      height: 90,
      decoration: BoxDecoration(
        color: const Color(0xFFDFE2FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child:
        Column(
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
    );
  }
}

class expense extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Container(
      padding: const EdgeInsets.all(15),
      width: 164,
      height: 90,
      decoration: BoxDecoration(
        color: const Color(0xFFDFE2FF),
        borderRadius: BorderRadius.circular(8),
      ),
      child:
        Column(
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
    );
  }
}
//create left align text
class transactionTitle extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(left: 20),
      child: const Text('Grocery transactions',
      style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)
      ),
    );
  }
}

class emptyWallet extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Container(
      //insert image
      child: Image.asset('assets/images/empty_wallet.png',
      width: 250, height: 250),
    );
  }
}