import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Editplannedpayment extends StatefulWidget{
  const Editplannedpayment({super.key});
  @override
  State<Editplannedpayment> createState() => EditplannedpaymentState();
}
class EditplannedpaymentState extends State<Editplannedpayment> {
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
        body: SingleChildScrollView(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Edit Your Planned Payment', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
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
                      hintText: 'Spotify'),
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
                      hintText: 'Rp 64.000'),
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
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Type of Payment',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
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
                const Padding(
                  padding: EdgeInsets.only(),
                  child: Text(
                    'Pocket',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
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
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: ElevatedButton(
                    key: const Key("editPlannedPayment"),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                        elevation: 0,
                        backgroundColor: const Color(0XFF4054FF),
                        shape:
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(48),
                        )
                    ),
                    onPressed: () => {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const Plannedpaymentdetails()))
                    },
                    child: const Text('Edit Planned Payment', style: TextStyle(color: Colors.white),
                    )
                )
            ),
                const SizedBox(height: 24),
                Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(left: 30, right: 30),
                    child: ElevatedButton(
                      key: const Key("deletePlannedPayment"),
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                          elevation: 0,
                          backgroundColor: const Color(0xFFDFE2FF),
                          shape:
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48),
                          )
                      ),
                      onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Delete Planned Payment'),
                          content: const Text('Are you sure you want to delete this planned payment?'),
                          actions: <Widget>[
                            TextButton(
                              key: const Key("cancelDeletePlannedPayment"),
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel', style: TextStyle(color: Color(0xFFD3180C))),
                            ),
                            TextButton(
                              key: const Key("confirmDeletePlannedPayment"),
                              onPressed: () => Navigator.pop(context, 'Delete', ),
                              child: const Text('Delete', style: TextStyle(color: Color(0XFF4054FF))),
                            ),
                          ],
                        ),
                      ),
                      child: const Text('Delete Planned Payment', style: TextStyle(color: Color(0XFF4054FF))),
                    )
                ),
                const SizedBox(height: 24),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 20),
                  child: TextButton(
                    key: const Key("cancelEditPocket"),
                    onPressed: () {
                    // Navigator.push(
                    // context,
                    // MaterialPageRoute(builder: (context) => const Plannedpaymentdetails()),
                    //  );
                   },
                  child: const Text(
                          'Cancel',
                    style: TextStyle(color: Color(0xFFD3180C)),
                    ),
                  )
                )
              ],
            )
        ));
  }
}