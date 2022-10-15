import 'package:flutter/material.dart';
// import 'package:dropdownfield/dropdownfield.dart';

class Plannedpayment extends StatefulWidget{
  
  const Plannedpayment({super.key});

  @override
  PlannedpaymentState createState() => PlannedpaymentState();
}
class PlannedpaymentState extends State<Plannedpayment> {
  String _adminType = "Debit";
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
                  const Text('Create your planned payment', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
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
                        hintText: 'Enter your payment name here'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 24),
                  const Text('Expense', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  TextFormField(
                    key: const Key("addExpense"),
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
                  const Text('Category', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  TextFormField(
                    key: const Key("addCategory"),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                        hintText: 'Entertainment, food'),
                    keyboardType: TextInputType.number,
                  ),
                            const SizedBox(height: 24),
                            const Submitpayment(),
                            const SizedBox(height: 24),
                            const Cancelpayment()

                ]
            )
        ),
    );
  }
}
//create submit button
class Submitpayment extends StatelessWidget{
  const Submitpayment({super.key});

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
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Plannedpayment(user)),
          // );
        },
          child: const Text('Create Planned Payment',
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
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) =>  SettingView(user)),
          // );
        },
        child: const Text('Cancel',
            style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFFD3180C))
        ),
      ),
    );
  }
}