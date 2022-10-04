import 'package:flutter/material.dart';
import 'plannedpayment/plannedpayment.dart';
import 'plannedpayment/editplannedpayment.dart';
import 'plannedpayment/plannedpaymentdetails.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          DirectPlannedPayment(),
          SizedBox(height: 24),
          EditPlannedPayment(),
          SizedBox(height: 24),
          PlannedPaymentDetails()
        ]
    );
  }
}
class DirectPlannedPayment extends StatelessWidget{
  const DirectPlannedPayment({super.key});

  @override
  Widget build(BuildContext context){
    //create pocket button
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Plannedpayment()),
          );
        },
        child: const Text('Crete Planned Payment'),
      ),
    );
  }
}

class EditPlannedPayment extends StatelessWidget{
  const EditPlannedPayment({super.key});

  @override
  Widget build(BuildContext context){
    //create pocket button
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Editplannedpayment()),
          );
        },
        child: const Text('Edit Planned Payment'),
      ),
    );
  }
}
class PlannedPaymentDetails extends StatelessWidget{
  const PlannedPaymentDetails({super.key});

  @override
  Widget build(BuildContext context){
    //create pocket button
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Plannedpaymentdetails()),
          );
        },
        child: const Text('Payment Details'),
      ),
    );
  }
}