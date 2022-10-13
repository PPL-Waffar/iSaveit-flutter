
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../navbar.dart';

class CreateTransaction extends StatefulWidget {
  const CreateTransaction({super.key});
  @override
  CreateTransactionPage createState() => CreateTransactionPage();
}

class CreateTransactionPage extends State<CreateTransaction> {
  
  String _paymentType = "Debit";
  String _pocketType = "Groceries";
  String _transacType = "Income";

  TextEditingController dateinput = TextEditingController(); 
    @override
    void initState() {
      dateinput.text = ""; //set the initial value of text field
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFF9F9F9),
        elevation: 0,
        leadingWidth: 500,
        leading: const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Input Transaction',
              style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black)
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
                    Text('Rp 5.000.000',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Inter', fontSize: 32, fontWeight: FontWeight.w700)
                    ),
                  ),
                ),

            const SizedBox(
              height: 32,
            ),
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
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                'Payment Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      key: const Key("transactionName"),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                          hintText: 'Purchase stationaries'),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                'Amount',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      key: const Key("transactionAmount"),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                          hintText: 'Rp 0'),
                          keyboardType: TextInputType.number,),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),

            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                'Date',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            //Date Picker
            Container(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child:Center( 
             child:TextField(
                key: const Key("transactionDate"),
                controller: dateinput,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                    hintText: 'YYYY-MM-dd'), //editing controller of this TextField
                
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
            
            const SizedBox(height: 32),

            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                'Type of Transaction',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
                 Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                        key: const ValueKey("TransacType"),
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
                        value: _transacType,
                        onChanged: (String? value) => {_transacType = value!},
                        items: const [
                          DropdownMenuItem<String>(
                            value: "Income",
                            child: Text(
                              "Income",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                              value: "Expense",
                              child: Text(
                                "Expense",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              )),
                          
                        ]),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),

            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                'Type of Payment',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                        key: const ValueKey("PaymentType"),
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

            const SizedBox(height: 32),

            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                'Pocket',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                        key: const ValueKey("PocketName"),
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
            
            const SizedBox(height: 32),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: ElevatedButton(
                key: const Key("inputTransactionButton"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  elevation: 0,
                  backgroundColor: const Color(0XFF4054FF),
                  shape: 
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    )
                  ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingView()),
                  );
                },
                child: const Text('Input Transaction'),
              ),
            ),

            
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                    );
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}