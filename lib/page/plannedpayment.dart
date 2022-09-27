import 'package:flutter/material.dart';

class plannedpayment extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
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
              onPressed: () {},
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              expense(),
              const SizedBox(height: 32),

              const SizedBox(height: 24),
              Payment(),
              const SizedBox(height: 24),
              submitpayment(),
            ],)
          ,)
    );

  }
}

class expense extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
            alignment: Alignment.center,
            child: const Center(
              child:
              Text('Create Planned Payment',
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
            Text('Insert your expense here',
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Inter', fontSize: 32, fontWeight: FontWeight.w700)
            ),
          ),
        )

      ],
    );
  }
}


class  Payment extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          paymentform(),
          const SizedBox(width: 20),

        ]
    );
  }
}

class paymentform extends StatelessWidget{
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
              Text('Payment',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 24,
                      fontWeight: FontWeight.w700, color: Color(0xFF4054FF))
              ),
              SizedBox(height: 5),
              //Text for amount of money
              Text('Payment Name',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w500)
              ),
            ]
        )
    );
  }
}

class pp extends StatelessWidget{
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
              Text('Category',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w500)
              ),
            ]
        )
    );
  }
}
//create left align text
class submitpayment extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => plannedpayment()),
          );
        },
          child: const Text('Submit',
              style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)
          ),
      ),

    );
  }
}
