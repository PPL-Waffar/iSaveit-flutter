import 'package:flutter/material.dart';
// import 'package:dropdownfield/dropdownfield.dart';

class plannedpayment extends StatefulWidget{
  @override
  State<plannedpayment> createState() => _plannedpaymentState();
}
class _plannedpaymentState extends State<plannedpayment> {
  // int index =0;
  // List<paying> payment = [
  //   new paying(name: "Debit", icon: Icons.location_city),
  //   new paying(name: "Credit", icon: Icons.location_city),
  //   new paying(name: "e-money", icon: Icons.location_city),
  // ];
  // String _selectedDropdown = "choose";
  // final _listCategory = ["a", "b",];
  // TextEditingController etInput = TextEditingController();
  //
  // _onChangedDropdown(String value){
  //   setState(() {
  //     _selectedDropdown = value;
  //   });
  // }
  // var _currencies = [
  //   "Food",
  //   "Transport",
  //   "Personal",
  //   "Shopping",
  //   "Medical",
  //   "Rent",
  //   "Movie",
  //   "Salary"
  // ];
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

          // actions: <Widget>[
          //   IconButton(
          //     icon: const Icon(Icons.edit),
          //     color: Colors.black,
          //     onPressed: () {},
          //   ),
          // ],
        ),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Input(etInput: etInput),
              // Dropdown(
              //   selectedDropdown: _selectedDropdown,
              //   listCatgory: _listCategory,
              //   onChangedDropdown: _onChangedDropdown
              // ),
              // DropDownField(
              //   controller: paymentSelected,
              //   hintText: "Select any payment",
              //   enabled: true,
              //   itemsVisibleInDropdown: 5,
              //   items: payments,
              //   onValueChanged: (value){
              //     setState(){
              //       selectPayment = value;
              //     };
              //   },
              // ),
              SizedBox(height: 0.5,),
              expense(),
              const SizedBox(height: 32),
              // DropdownButtonFormField(
              //   decoration: InputDecoration(
              //     enabledBorder: OutlineInputBorder( //<-- SEE HERE
              //       borderSide: BorderSide(color: Colors.black, width: 2),
              //     ),
              //     focusedBorder: OutlineInputBorder( //<-- SEE HERE
              //       borderSide: BorderSide(color: Colors.black, width: 2),
              //     ),
              //     filled: true,
              //     fillColor: Colors.greenAccent,
              //   ),
              //   dropdownColor: Colors.greenAccent,
              //   value: selectPayment,
              //   onChanged: (String? newValue) {
              //     setState() {
              //       selectPayment = newValue!;
              //     };
              //   },
              //   items: <String>['Dog', 'Cat', 'Tiger', 'Lion'].map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(
              //         value,
              //         style: TextStyle(fontSize: 20),
              //       ),
              //     );
              //   }).toList(),
              // ),
              TextFormField(
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
            // DropdownButton(
            //     value: payment[index],
            //     hint: new Text("Ville"),
            //     items: payment.map((paying value) {
            //       return new DropdownMenuItem(
            //         value: value,
            //         child: new Row(
            //           children: <Widget>[
            //             // new Icon(
            //             //   value.icon,
            //             //   color: Colors.deepOrange,
            //             // ),
            //             // new Text(value.name)
            //           ],
            //         ),
            //       );
            //     }).toList(),
            //     onChanged: (paying? value) {
            //       setState(() {
            //         index = payment.indexOf(value!);
            //         print(index);
            //       });
            //       //getTravelCity(value.name);
            // //     }),
            //   FormField<String>(
            //     builder: (FormFieldState<String> state) {
            //       return InputDecorator(
            //         decoration: InputDecoration(
            //             // labelStyle: textStyle,
            //             errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0),
            //             hintText: 'Please select expense',
            //             border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
            //         isEmpty: _currentSelectedValue == '',
            //         child: DropdownButtonHideUnderline(
            //           child: DropdownButton<String>(
            //             value: _currentSelectedValue,
            //             isDense: true,
            //             onChanged: (String?newValue) {
            //               setState(() {
            //                 _currentSelectedValue = newValue!;
            //                 state.didChange(newValue);
            //               });
            //             },
            //             items: _currencies.map((String value) {
            //               return DropdownMenuItem<String>(
            //                 value: value,
            //                 child: Text(value),
            //               );
            //             }).toList(),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
              TextFormField(
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
              TextFormField(
                decoration: InputDecoration(
                    labelText: 'Type of Payment',
                    hintText: 'Cash, Debit, or E-money',
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
// class PaymentList{
//     String payment_name;
//     PaymentList(this.payment_name);
// }

// class paymentMethod extends StatelessWidget{
//   List<String> payments = ['debit', 'credit'],
//   String? selectedPayment = 'choose payment';
//
//   @override
//   Widget build(BuildContext context){
//     body: Center(
//       child: DropdownButton<String>(
//         value: selectedPayment,
//         items: items
//           .map((item) => DropdownMenuItem<String>(
//         value: item,
//         child: Text(item, style: TextStyle(fontSize: 24)),,))
//     .toList(),
//     onChanged: (item) => setState(() => selectedPayment=item),
//     )
//   }
// }
// final paymentSelected = TextEditingController();
//String _currentSelectedValue = "";
// // List<String> payment = [
// //   "Debit card",
// //   "Credit card",
// //   "e-money",
// // ];
// class paying {
//   final String name;
//   final IconData icon;
//
//   const paying({
//     required this.name,
//     required this.icon,
//   });
// }
// int index =0;
// // List<paying> payment = [
// //   "Debit card",
// //   "Credit card",
// //   "e-money",
// // ];
// class pay extends StatefulWidget{
//   paymentform createState()=> paymentform();
// }

// class paymentform extends State<pay>{
//   int index =0;
//   List<paying> payment = [
//     new paying(name: "Debit", icon: Icons.location_city),
//     new paying(name: "Credit", icon: Icons.location_city),
//     new paying(name: "e-money", icon: Icons.location_city),
//   ];
//   @override
//
//   Widget build(BuildContext context){
//     return DropdownButton(
//         value: payment[index],
//         hint: new Text("Ville"),
//         items: payment.map((paying value) {
//           return new DropdownMenuItem(
//             value: value,
//             child: new Row(
//               children: <Widget>[
//                 // new Icon(
//                 //   value.icon,
//                 //   color: Colors.deepOrange,
//                 // ),
//                 // new Text(value.name)
//               ],
//             ),
//           );
//         }).toList(),
//         onChanged: (paying? value) {
//           setState(() {
//             index = payment.indexOf(value!);
//             print(index);
//           });
//           //getTravelCity(value.name);
//         });
//     //   Container(
//     //     padding: const EdgeInsets.all(15),
//     //     width: 164,
//     //     height: 90,
//     //     decoration: BoxDecoration(
//     //       color: const Color(0xFFDFE2FF),
//     //       borderRadius: BorderRadius.circular(8),
//     //     ),
//     //     child:DropdownButton<String>(
//     //       value: selectPayment,
//     //       items: payment
//     //           .map((item) => DropdownMenuItem<String>(
//     //           value: item,
//     //           child: Text(item, style: TextStyle(fontSize: 24)),))
//     //           .toList(),
//     //       onChanged: (item) => setState(() => selectPayment= selectPayment),
//     //     ),
//     //     // Column(
//     //     //     crossAxisAlignment: CrossAxisAlignment.start,
//     //     //     children: const [
//     //     //       //Text for budget
//     //     //       Text('Payment',
//     //     //           style: TextStyle(fontFamily: 'Inter', fontSize: 24,
//     //     //               fontWeight: FontWeight.w700, color: Color(0xFF4054FF))
//     //     //       ),
//     //     //       SizedBox(height: 5),
//     //     //       //Text for amount of money
//     //     //       Text('Payment Name',
//     //     //           style: TextStyle(fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w500)
//     //     //       ),
//     //     //     ]
//     //     // )
//     // );
//   }
// }
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
        //     ),
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
// class pp extends StatelessWidget{
//   const pp({
//     Key? key,
//     required this.selectedDropdown,
//     required this.listCategory,
//     required this.onChangedDropdown,
// })  : super(key: key);
//   final String selectedDropdown;
//   final List<String> listCategory;
//   final Function onChangedDropdown;
//   @override
//   Widget build(BuildContext context){
//     return DropdownButton<String>(
//         items: listCategory.map((String value){
//           return DropdownMenuItem<String>(
//               child: Text(value),
//               value: value,
//           );
//         }).toList(),
//
//         onChanged: (value){
//           onChangedDropdown(value);
//         });
//     //   Container(
//     //     padding: const EdgeInsets.all(15),
//     //     width: 164,
//     //     height: 90,
//     //     decoration: BoxDecoration(
//     //       color: const Color(0xFFDFE2FF),
//     //       borderRadius: BorderRadius.circular(8),
//     //     ),
//     //     child:
//     //     Column(
//     //         crossAxisAlignment: CrossAxisAlignment.start,
//     //         children: const [
//     //           //Text for budget
//     //           Text('Expense',
//     //               style: TextStyle(fontFamily: 'Inter', fontSize: 24,
//     //                   fontWeight: FontWeight.w700, color: Color(0xFF4054FF))
//     //           ),
//     //           SizedBox(height: 5),
//     //           //Text for amount of money
//     //           Text('Category',
//     //               style: TextStyle(fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w500)
//     //           ),
//     //         ]
//     //     )
//     // );
//   }
// }
//create submit button
class submitpayment extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20),
      child: ElevatedButton(
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

