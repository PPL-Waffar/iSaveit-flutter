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
        body:
        SingleChildScrollView(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Create Planned Payment', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  TextFormField(
                    key: const Key("addPaymentName"),
                    cursorWidth: 50,
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                        labelText: 'Payment Name',
                        hintText: 'Enter your payment name here'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    key: const Key("addExpense"),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                        labelText: 'Expense',
                        hintText: 'Rp 0'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    key: const Key("addDate"),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                        labelText: 'Date',
                        hintText: 'DD/MM/YYYY'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                            DropdownButtonFormField<String>(
                                key: const Key("addPaymentType"),
                                style: TextStyle(height: 0),
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                        borderSide: BorderSide(
                                            width: 1.0, color: Color(0xFFDBDBDB)
                                        )
                                    ),
                                    labelText: 'Type of Payment',
                                    hintText: 'Enter your payment',
                                    filled: true,
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
                  const SizedBox(height: 24),
                  TextFormField(
                    key: const Key("addCategory"),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                        labelText: 'Category',
                        hintText: 'Entertainment, food'),
                    keyboardType: TextInputType.number,
                  ),
                            const SizedBox(height: 24),
                            submitpayment(),
                            const SizedBox(height: 24),
                            cancelpayment()

                ]
            )
        ),
    //     SingleChildScrollView(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: <Widget>[
    //           SizedBox(height: 0.5,),
    //           expense(),
    //           const SizedBox(height: 32),
    //           TextFormField(
    //             key: const Key("addPaymentsName"),
    //             decoration: InputDecoration(
    //               enabledBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(8.0)),
    //                   borderSide: BorderSide(
    //                       width: 1.0, color: Color(0xFFDBDBDB)
    //                   )
    //               ),
    //               labelText: 'Payment Name',
    //               hintText: 'Enter your payment',
    //               filled: true,
    //             ),
    // ),
    //           const SizedBox(height: 24),
    //           TextFormField(
    //             key: const Key("addExpense"),
    //             style: TextStyle(height: 0),
    //             decoration: InputDecoration(
    //               enabledBorder: OutlineInputBorder(
    //                   borderRadius: BorderRadius.all(Radius.circular(8.0)),
    //                   borderSide: BorderSide(
    //                       width: 1.0, color: Color(0xFFDBDBDB)
    //                   )
    //               ),
    //                 labelText: 'Expense',
    //                 hintText: 'Rp 0',
    //                 filled: true,
    //             ),
    //           ),
    //           const SizedBox(height: 24),
    //           TextFormField(
    //             key: const Key("addDate"),
    //             style: TextStyle(height: 0),
    //             decoration: InputDecoration(
    //                 enabledBorder: OutlineInputBorder(
    //                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
    //                     borderSide: BorderSide(
    //                         width: 1.0, color: Color(0xFFDBDBDB)
    //                     )
    //                 ),
    //                 labelText: 'Date',
    //                 hintText: 'DD/MM/YYYY',
    //                 filled: true,
    //             ),
    //           ),
    //           const SizedBox(height: 24),
    //           DropdownButtonFormField<String>(
    //               key: const Key("addPaymentType"),
    //               style: TextStyle(height: 0),
    //               decoration: InputDecoration(
    //                   enabledBorder: OutlineInputBorder(
    //                       borderRadius: BorderRadius.all(Radius.circular(8.0)),
    //                       borderSide: BorderSide(
    //                           width: 1.0, color: Color(0xFFDBDBDB)
    //                       )
    //                   ),
    //                   labelText: 'Type of Payment',
    //                   hintText: 'Enter your payment',
    //                   filled: true,
    //               ),
    //               value: _adminType,
    //               onChanged: (String? value) => {_adminType = value!},
    //               items: const [
    //                 DropdownMenuItem<String>(
    //                   child: Text("Debit"),
    //                   value: "Debit",
    //                 ),
    //                 DropdownMenuItem(
    //                   child: Text("Cash"),
    //                   value: "Cash",
    //                 ),
    //                 DropdownMenuItem(
    //                   child: Text("E-money"),
    //                   value: "E-money",
    //                 ),
    //               ]),
    //           const SizedBox(height: 24),
    //           TextFormField(
    //             key: const Key("addCategory"),
    //             style: TextStyle(height: 0),
    //             decoration: InputDecoration(
    //               enabledBorder: OutlineInputBorder(
    //                 borderRadius: BorderRadius.all(Radius.circular(8.0)),
    //                 borderSide: BorderSide(
    //                   width: 1.0, color: Color(0xFFDBDBDB)
    //                 )
    //               ),
    //                 labelText: 'Category',
    //                 hintText: 'Groceries, Food, Entertainment',
    //                 filled: true,
    //             ),
    //           ),
    //           const SizedBox(height: 24),
    //           submitpayment(),
    //           const SizedBox(height: 24),
    //           cancelpayment()
    // ],
    //       )
    // )
    );
  }
}
class expense extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(15),
          width: 260,
          height: 60,
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

