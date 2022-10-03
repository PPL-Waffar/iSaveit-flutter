import 'package:flutter/material.dart';
// import 'package:dropdownfield/dropdownfield.dart';

class plannedpayment extends StatefulWidget{
  const plannedpayment({Key? key}) : super(key: key);
  @override
  _plannedpaymentState createState() => _plannedpaymentState();
}
class _plannedpaymentState extends State<plannedpayment> {
  final _formKey = GlobalKey<FormState>();
  String _adminType = "Debit";
  String? _duplicatepayment;
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
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 0.5,),
              expense(),
              const SizedBox(height: 32),
              TextFormField(
                key: const Key("addPaymentName"),
                decoration: InputDecoration(
                  labelText: 'Payment Name',
                  hintText: 'Enter your payment',
                  filled: true,
                  fillColor: Colors.blue.withOpacity(0.2),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)
                  )
                ),
    ),
              const SizedBox(height: 24),
              TextFormField(
                key: const Key("addExpense"),
                decoration: InputDecoration(
                    labelText: 'Expense',
                    hintText: 'Rp 0',
                    filled: true,
                    fillColor: Colors.blue.withOpacity(0.2),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                key: const Key("addDate"),
                decoration: InputDecoration(
                    labelText: 'Date',
                    hintText: 'DD/MM/YYYY',
                    filled: true,
                    fillColor: Colors.blue.withOpacity(0.2),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              const SizedBox(height: 24),
              DropdownButtonFormField<String>(
                  key: const Key("addPaymentType"),
                  decoration: InputDecoration(
                      labelText: 'Type of Payment',
                      hintText: 'Enter your payment',
                      filled: true,
                      fillColor: Colors.blue.withOpacity(0.2),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  value: _adminType,
                  onChanged: (String? value) => {_adminType = value!},
                  items: const [
                    DropdownMenuItem<String>(
                      child: Text("Debit"),
                      value: "Debit",
                    ),
                    DropdownMenuItem(
                      child: Text("Cash"),
                      value: "Cash",
                    ),
                    DropdownMenuItem(
                      child: Text("E-money"),
                      value: "E-money",
                    ),
                  ]),
              // TextFormField(
              //   decoration: InputDecoration(
              //       labelText: 'Types of Payment',
              //       hintText: 'Cash, Debit, or E-money',
              //       filled: true,
              //       fillColor: Colors.blue.withOpacity(0.2),
              //       border: OutlineInputBorder(
              //           borderSide: BorderSide.none,
              //           borderRadius: BorderRadius.circular(10)
              //       )
              //   ),
              // ),
              const SizedBox(height: 24),
              TextFormField(
                key: const Key("addCategory"),
                decoration: InputDecoration(
                    labelText: 'Category',
                    hintText: 'Groceries, Food, Entertainment',
                    filled: true,
                    fillColor: Colors.blue.withOpacity(0.2),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
              ),
              const SizedBox(height: 24),
              submitpayment(),
              const SizedBox(height: 24),
              cancelpayment()
    ],
          )
    ));
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
          padding: const EdgeInsets.all(15),
          width: 260,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFDFE2FF),
            borderRadius: BorderRadius.circular(8),
          ),
          child:SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    //Text for budget
                    Text('Insert your expense here!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontFamily: 'Inter', fontSize: 20,
                            fontWeight: FontWeight.w700, color: Color(0xFF4054FF))
                    ),
                    SizedBox(height: 10),
                    //Text for amount of money
                  ]
              )
          ),
        ),
        //   alignment: Alignment.center,
        //   child: const Center(
        //     child:
        //     Text('Insert your expense here',
        //         textAlign: TextAlign.center,
        //         style: TextStyle(fontFamily: 'Inter', fontSize: 32, fontWeight: FontWeight.w700)
        //     ),s
        //   ),
        // )
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
          // paymentform(),
          const SizedBox(width: 20),

        ]
    );
  }
}
//create submit button
class submitpayment extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20),
      child: ElevatedButton(
        key: const Key("createSubmitButton"),
        style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
    elevation: 0,
    backgroundColor: const Color(0XFF4054FF),
    shape:
    RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(48),)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => plannedpayment()),
          );
        },
          child: const Text('Create Planned Payment',
              style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)
          ),
      ),
    );
  }
}
class cancelpayment extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20),
      child: ElevatedButton(
        key: const Key("createCancelButton"),
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
            elevation: 0,
            primary: Colors.white70,
            // backgroundColor: const Color(0xffb74093),
            shape:
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),)),
        // style: ElevatedButton.styleFrom(
        //     primary: Colors.white70,),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => plannedpayment()),
          );
        },
        child: const Text('Cancel',
            style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFFD3180C))
        ),
      ),
    );
  }
}

