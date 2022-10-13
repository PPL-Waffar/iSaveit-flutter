import 'package:flutter/material.dart';

class Transaction extends StatefulWidget {
  const Transaction({super.key});

  @override
  TransactionPage createState() => TransactionPage();
}

class TransactionPage extends State<Transaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :Column(
      mainAxisAlignment: MainAxisAlignment.start,
     children : <Widget>[
      const SizedBox(
        height: 300,
      ),
      AlertDialog(
      title: const Text('Input', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
      actions: <Widget>[
        Container(
          height: 52,
          width: 384,
          decoration:BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xff4054FF),),
          child: Row(
            children: [
              const Icon(Icons.wallet_outlined, size: 24,),
              const SizedBox(width: 40,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff4054FF),
                  elevation: 0,
                ),
              onPressed: () {},
              child: const Text('Input Transaction', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
              ),
            ],
          ),
        ),
        const SizedBox(height: 15,),
        Container(
          height: 52,
          width: 384,
          decoration:BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xffDFE2FF)),
          child: Row(
            children: [
              
              const Icon(Icons.card_travel, size: 24,),
              const SizedBox(width: 40,),
              ElevatedButton(
                 style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffDFE2FF),
                  elevation: 0,
                  
                ),
              onPressed: () {},
              child: const Text('Borrow Transaction', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
              ),
            ],
          ),
        ),
        TextButton(
        // <-- TextButton
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
      ],
    ),
      ]
      ),
    );
  }
}
