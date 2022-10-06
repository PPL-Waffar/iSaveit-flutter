import 'package:flutter/material.dart';
import 'package:isaveit/page/homepage.dart';
import 'package:isaveit/page/plannedpayment/plannedpayment.dart';
// import 'package:isaveit/page/homepage.dart';
// import 'package:isaveit/page/pocket/pocket_details.dart';

class CreateBorrow extends StatefulWidget {
  const CreateBorrow({super.key});

  @override
  CreateBorrowPage createState() => CreateBorrowPage();
}

class CreateBorrowPage extends State<CreateBorrow> {
  String _adminType = "Debit";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),

                  //Edit pocket title
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child:
                    const Text('Borrow Transactions',
                        style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)
                    ),
                  ),

                  const SizedBox(height: 32),

                  //Balance for borrow
                  SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              child: const Center(
                                child:
                                Text('My Balance',
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
                      )
                  ),

                  const SizedBox(height: 32),

                  //divider
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

                  const SizedBox(height: 32),

                  //pocket name
                  SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 0.5,),
                            const SizedBox(height: 32),
                            const Text('Payment Name', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            TextFormField(
                              key: const Key("addPaymentName"),
                              cursorWidth: 50,
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                                  hintText: 'Enter your payment here'),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 24),
                            const Text('Amount', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            TextFormField(
                              key: const Key("addAmount"),
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                                  hintText: 'Rp 0'),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 24),
                            const Text('Date', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            TextFormField(
                              key: const Key("addDate"),
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                                  hintText: 'DD/MM/YYYY'),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 24),
                            const Text('Type of Borrowing', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            TextFormField(
                              key: const Key("addBorrowingType"),
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                                  hintText: 'Type "In debt" or "Lending money"'),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 24),
                            const Text('Borrower name', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            TextFormField(
                              key: const Key("addBorrowerName"),
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                                  hintText: 'Enter their name here'),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 24),
                            const Text('Type of Payment', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            DropdownButtonFormField<String>(
                                key: const Key("addPaymentType"),
                                style: const TextStyle(height: 0),
                                decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      borderSide: BorderSide(
                                          width: 1.0, color: Color(0xFFDBDBDB)
                                      )
                                  ),
                                  hintText: 'Enter your payment method',
                                  filled: true,
                                ),
                                value: _adminType,
                                onChanged: (String? value) => {_adminType = value!},
                                items: const [
                                  DropdownMenuItem<String>(
                                    value: "Debit",
                                    child: Text("Debit"),
                                  ),
                                  DropdownMenuItem(
                                    value: "Cash",
                                    child: Text("Cash"),
                                  ),
                                  DropdownMenuItem(
                                    value: "E-money",
                                    child: Text("E-money"),
                                  ),
                                ]),
                            const SizedBox(height: 24),
                            const Text('Pocket', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            TextFormField(
                              key: const Key("addPocketCategory"),
                              decoration: const InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                      borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                                  hintText: 'Entertainment, food'),
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(height: 24),
                            const InputTransactions(),
                            const SizedBox(height: 24),
                            const Cancelpayment()
                          ]
                      )
                  ),
                ]
            )
        )
    );
  }
}
class InputTransactions extends StatelessWidget{
  const InputTransactions({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20),
      child: ElevatedButton(
        key: const Key("createInputTransactions"),
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
            MaterialPageRoute(builder: (context) => const Plannedpayment()),
          );
        },
        child: const Text('Input Transactions',
            style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)
        ),
      ),
    );
  }
}
class Cancelpayment extends StatelessWidget{
  const Cancelpayment({super.key});

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20),
      child: ElevatedButton(
        key: const Key("createCancelButton"),
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48), backgroundColor: Colors.white70,
            elevation: 0,
            // backgroundColor: const Color(0xffb74093),
            shape:
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),)),
        // style: ElevatedButton.styleFrom(
        //     primary: Colors.white70,),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeView()),
          );
        },
        child: const Text('Cancel',
            style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFFD3180C))
        ),
      ),
    );
  }
}