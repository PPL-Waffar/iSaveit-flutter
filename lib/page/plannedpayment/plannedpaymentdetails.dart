import 'package:flutter/material.dart';
import 'editplannedpayment.dart';

// class plannedpaymentdetails extends StatefulWidget{
//   @override
//   State<plannedpaymentdetails> createState() => _plannedpaymentdetailsState();
// }
class plannedpaymentdetails extends StatelessWidget {
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
                  MaterialPageRoute(builder: (context) => editplannedpayment()),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 0.5,),
                editexpense(),
                const SizedBox(height: 32),
                paymentname(),
                const SizedBox(height: 32),
                expensename(),
                const SizedBox(height: 32),
                dateDetails(),
                const SizedBox(height: 32),
                paymentType(),
                const SizedBox(height: 32),
                pocketCategory(),
                const SizedBox(height: 24),
                editsubmitpayment(),
                // const SizedBox(height: 24),
                // deletesubmitpayment(),
                // const SizedBox(height: 24),
                // editcancelpayment()
              ],
            )
        ));
  }
}
class paymentname extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Payment Name', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Container(
            width: 343,
            child: const TextField(
              style:  TextStyle(height: 0),
              decoration:  InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(
                        width: 1.0, color: Color(0xFFDBDBDB))),
                labelText: 'Spotify',
              ),
            ),
          )
        ]
    );
  }
}
class expensename extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Expense', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Container(
            width: 343,
            child: const TextField(
              style:  TextStyle(height: 0),
              decoration:  InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(
                        width: 1.0, color: Color(0xFFDBDBDB))),
                labelText: 'Rp 64.000',
              ),
            ),
          )
        ]
    );
  }
}
class dateDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Date', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Container(
            width: 343,
            child: const TextField(
              style:  TextStyle(height: 0),
              decoration:  InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(
                        width: 1.0, color: Color(0xFFDBDBDB))),
                labelText: '22/09/2022',
              ),
            ),
          )
        ]
    );
  }
}
class paymentType extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Type of Payment', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Container(
            width: 343,
            child: const TextField(
              style:  TextStyle(height: 0),
              decoration:  InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(
                        width: 1.0, color: Color(0xFFDBDBDB))),
                labelText: 'Cash',
              ),
            ),
          )
        ]
    );
  }
}
class pocketCategory extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Pocket', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Container(
            width: 343,
            child: const TextField(
              style:  TextStyle(height: 0),
              decoration:  InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(
                        width: 1.0, color: Color(0xFFDBDBDB))),
                labelText: 'Entertainment',
              ),
            ),
          )
        ]
    );
  }
}
class editexpense extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        // Container(
        //     alignment: Alignment.center,
        //     child: const Center(
        //       child:
        //       Text('Edit Planned Payments',
        //           textAlign: TextAlign.center,
        //           style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w500)
        //       ),
        //     )
        // ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(15),
          width: 230,
          height: 60,
          // decoration: BoxDecoration(
          //   color: const Color(0xFFDFE2FF),
          //   borderRadius: BorderRadius.circular(8),
          // ),
          child:SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                alignment: Alignment.center,
                child:
                const Text('Your Planned Payment',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)
                ),
              ),
          ),
        ),
      ],
    );
  }
}
class  editPayment extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // paymentform(),
          const SizedBox(width: 20),

        ]
    );
  }
}
//create submit button
class editsubmitpayment extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
            elevation: 0,
            backgroundColor: const Color(0xFFFFFF),
            shape:
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => plannedpaymentdetails()),
          );
        },
        child: const Text('Edit Planned Payment',
            style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)
        ),
      ),
    );
  }
}
class deletesubmitpayment extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
            elevation: 0,
            backgroundColor: const Color(0xFFDFE2FF),
            shape:
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => plannedpaymentdetails()),
          );
        },
        child: const Text('Delete Planned Payment',
            style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Colors.red)
        ),
      ),
    );
  }
}
class editcancelpayment extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
            elevation: 0,
            primary: Colors.grey,
            // backgroundColor: const Color(0xffb74093),
            shape:
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),)),
        // style: ElevatedButton.styleFrom(
        //     primary: Colors.white70,),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => plannedpaymentdetails()),
          );
        },
        child: const Text('Cancel',
            style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFFDFE2FF))
        ),
      ),
    );
  }
}