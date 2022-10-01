import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'plannedpayment/plannedpayment.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          directPlannedPayment()
        ]
    );
  }
}

class directPlannedPayment extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //create pocket button
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => plannedpayment()),
          );
        },
        child: const Text('Crete Planned Payment'),
      ),
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class HomeView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text("Homepage"),
//       ),
//     );
//   }
// }