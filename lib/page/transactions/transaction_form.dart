import 'package:flutter/material.dart';
import 'package:isaveit/page/navbar.dart';



class InputTransaction extends StatefulWidget {
  const InputTransaction({super.key});

  @override
  InputTransactionForm createState() => InputTransactionForm();
}

List<String> transactionType = <String>['Expense', 'Income'];
List<String> paymentType = <String>['Debit Card', 'E-Wallet', 'Cash'];
List<String> pocket = <String>['Grocery', 'Transportation', 'Entertainment'];
List<String> list = <String>['item1', 'item2', 'item3'];
class InputTransactionForm extends State<InputTransaction> {

  String dropdownValue = list.first;
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
                const Text('Input Transactions 💰',
                style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)
                ),
              ),

            const SizedBox(height: 32),

            //pocket balance
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
                    Text('Rp 5.000.000',
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
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Transaction Name', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                TextFormField(
                      key: const Key("transactionName"),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                          hintText: 'Lunch at Canteen'),
                    ),  
                ]
            )
            ),

            const SizedBox(height: 32),

            
            //Pocket budget
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Amount', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                TextFormField(
                      key: const Key("transactionAmount"),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                          hintText: 'Rp 0'),
                      keyboardType: TextInputType.number,
                  )
              ]
            )
            ),


            const SizedBox(height: 32),

                        //Pocket budget
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Date', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                TextFormField(
                      key: const Key("transactionDate"),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                          hintText: 'DD/MM/YY'),
                      keyboardType: TextInputType.number,
                  )
              ]
            )
            ),


            const SizedBox(height: 32),

            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Type of Transaction', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                      filled: true,
                    ),
                    dropdownColor: Colors.white,
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                ]
              )
            ),
            
            const SizedBox(height: 32),

            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Type of Payment', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                      filled: true,
                    ),
                    dropdownColor: Colors.white,
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                ]
              )
            ),
            

            const SizedBox(height: 32),

            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Pocket', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                    decoration: const InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                      filled: true,
                    ),
                    dropdownColor: Colors.white,
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                    });
                  },
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                ]
              )
            ),
            
            const SizedBox(height: 32),

            //edit button
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
                      borderRadius: BorderRadius.circular(48),
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

            const SizedBox(height: 16),
            
            //cancel button
            TextButton(
              key: const Key("cancelEditPocket"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingView()),
                );
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Color(0xFFD3180C)),
              ),
            )
          ]
        )
      )
    );
  }
}

// List<DropdownMenuItem<String>> get transactionDropdown{
//   List<DropdownMenuItem<String>> transactionItems = [
//     const DropdownMenuItem(value: "Income", child: Text("Income")),
//     const DropdownMenuItem(value: "Expense", child: Text("Expense")),  
//   ];
//   return transactionItems;
// }