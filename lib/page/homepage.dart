import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'plannedpayment/plannedpayment.dart';
import 'plannedpayment/editplannedpayment.dart';
import 'plannedpayment/plannedpaymentdetails.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          directPlannedPayment(),
          const SizedBox(height: 24),
          editPlannedPayment(),
          const SizedBox(height: 24),
          PlannedPaymentDetails()
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

class editPlannedPayment extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //create pocket button
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => editplannedpayment()),
          );
        },
        child: const Text('Edit Planned Payment'),
      ),
    );
  }
}
class PlannedPaymentDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    //create pocket button
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => plannedpaymentdetails()),
          );
        },
        child: const Text('Payment Details'),
      ),
    );
  }
}