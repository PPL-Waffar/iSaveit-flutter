import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:dropdownfield/dropdownfield.dart';

class Plannedpayment extends StatefulWidget{
  
  const Plannedpayment({super.key});

  @override
  PlannedpaymentState createState() => PlannedpaymentState();
}
class PlannedpaymentState extends State<Plannedpayment> {
  TextEditingController dateinput = TextEditingController();
  String _paymentType = "Debit";
  String _pocketType = "Groceries";
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }
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
                        hintText: 'Enter your payment'),
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
                  Container(
                      padding: const EdgeInsets.only(),
                      child:Center(
                          child:TextField(
                            key: const Key("transactionDate"),
                            controller: dateinput,
                            cursorWidth: 50,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.calendar_today),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                                hintText: 'YYYY-MM'),
                            readOnly: true,  //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context, initialDate: DateTime.now(),
                                  firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                  lastDate: DateTime(2101)
                              );
                              if(pickedDate != null ){
                                String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                                setState(() {
                                  dateinput.text = formattedDate; //set output date to TextField value.
                                });
                              }else{
                              }
                            },
                          ))),
                  const SizedBox(height: 24),
                  const Text('Type of Payment', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                              key: const Key("addPaymentType"),
                              style: const TextStyle(height: 0),
                              decoration: const InputDecoration(
                                fillColor: Color(0XFFF9F9F9),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                    borderSide:
                                    BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                                hintText: 'Enter your payment method',
                                filled: true,
                              ),
                              value: _paymentType,
                              onChanged: (String? value) => {_paymentType = value!},
                              items: const [
                                DropdownMenuItem<String>(
                                  value: "Debit",
                                  child: Text(
                                    "Debit",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                    value: "Cash",
                                    child: Text(
                                      "Cash",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    )),
                                DropdownMenuItem(
                                    value: "E-money",
                                    child: Text(
                                      "E-money",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    )),
                              ]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text('Pocket', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Row(
                      children: [
                        Expanded(
                          child: DropdownButtonFormField<String>(
                              key: const Key("addPocketName"),
                              style: const TextStyle(height: 0),
                              decoration: const InputDecoration(
                                fillColor: Color(0XFFF9F9F9),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)),
                                    borderSide:
                                    BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                                hintText: 'Enter your pocket',
                                filled: true,
                              ),
                              value: _pocketType,
                              onChanged: (String? value) => {_pocketType = value!},
                              items: const [
                                DropdownMenuItem<String>(
                                  value: "Groceries",
                                  child: Text(
                                    "Groceries",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                DropdownMenuItem(
                                    value: "Health",
                                    child: Text(
                                      "Health",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    )),
                                DropdownMenuItem(
                                    value: "Food And Beverages",
                                    child: Text(
                                      "Food And Beverages",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    )),
                              ]),
                        ),
                      ],
                    ),
                  ),
                            const SizedBox(height: 24),
            Container(
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
                    MaterialPageRoute(builder: (context) => const Plannedpayment()),
                  );
                },
                child: const Text('Create Planned Payment',
                    style: TextStyle(color: Colors.white)
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
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
              //    Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => const HomeView()),
              // );
            },
            child: const Text('Cancel',
                style: TextStyle(color: Color(0xFFD3180C))
            ),
          ),
        ),
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