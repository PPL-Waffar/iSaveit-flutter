import 'package:flutter/material.dart';
// import 'package:dropdownfield/dropdownfield.dart';

class editplannedpayment extends StatefulWidget{
  @override
  State<editplannedpayment> createState() => _editplannedpaymentState();
}
class _editplannedpaymentState extends State<editplannedpayment> {
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
                editexpense(),
                const SizedBox(height: 32),
                // TextFormField(
                //   decoration: InputDecoration(
                //       labelText: 'Payment Name',
                //       hintText: 'Enter your payment',
                //       filled: true,
                //       fillColor: Colors.blue.withOpacity(0.2),
                //       border: OutlineInputBorder(
                //           borderSide: BorderSide.none,
                //           borderRadius: BorderRadius.circular(10)
                //       )
                //   ),
                // ),
                // const SizedBox(height: 24),
                // TextFormField(
                //   decoration: InputDecoration(
                //       labelText: 'Expense',
                //       hintText: 'Rp 0',
                //       filled: true,
                //       fillColor: Colors.blue.withOpacity(0.2),
                //       border: OutlineInputBorder(
                //           borderSide: BorderSide.none,
                //           borderRadius: BorderRadius.circular(10)
                //       )
                //   ),
                // ),
                // const SizedBox(height: 24),
                // TextFormField(
                //   decoration: InputDecoration(
                //       labelText: 'Date',
                //       hintText: 'DD/MM/YYYY',
                //       filled: true,
                //       fillColor: Colors.blue.withOpacity(0.2),
                //       border: OutlineInputBorder(
                //           borderSide: BorderSide.none,
                //           borderRadius: BorderRadius.circular(10)
                //       )
                //   ),
                // ),
                // const SizedBox(height: 24),
                // TextFormField(
                //   decoration: InputDecoration(
                //       labelText: 'Type of Payment',
                //       hintText: 'Cash, Debit, or E-money',
                //       filled: true,
                //       fillColor: Colors.blue.withOpacity(0.2),
                //       border: OutlineInputBorder(
                //           borderSide: BorderSide.none,
                //           borderRadius: BorderRadius.circular(10)
                //       )
                //   ),
                // ),
                // const SizedBox(height: 24),
                // TextFormField(
                //   decoration: InputDecoration(
                //       labelText: 'Category',
                //       hintText: 'Groceries, Food, Entertainment',
                //       filled: true,
                //       fillColor: Colors.blue.withOpacity(0.2),
                //       border: OutlineInputBorder(
                //           borderSide: BorderSide.none,
                //           borderRadius: BorderRadius.circular(10)
                //       )
                //   ),
                // ),
                paymentname(),
                expensename(),
                dateDetails(),
                paymentType(),
                pocketCategory(),



                const SizedBox(height: 24),
                editsubmitpayment(),
                const SizedBox(height: 24),
                deletesubmitpayment(),
                const SizedBox(height: 24),
                editcancelpayment()

              ],
            )
        ));
  }
}
class paymentname extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Payment Name', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Container(
            width: 343,
            child: const TextField(
              style:  TextStyle(height: 0),
              decoration:  InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(
                        width: 1.0, color: Color(0xFFDBDBDB))),
                labelText: 'Spotify',
              ),
            ),
          )
        ]
    );
  }
}
class expensename extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Expense', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Container(
            width: 343,
            child: const TextField(
              style:  TextStyle(height: 0),
              decoration:  InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(
                        width: 1.0, color: Color(0xFFDBDBDB))),
                labelText: 'Rp 64.000',
              ),
            ),
          )
        ]
    );
  }
}
class dateDetails extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Date', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Container(
            width: 343,
            child: const TextField(
              style:  TextStyle(height: 0),
              decoration:  InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(
                        width: 1.0, color: Color(0xFFDBDBDB))),
                labelText: '22/09/2022',
              ),
            ),
          )
        ]
    );
  }
}
class paymentType extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Type of Payment', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Container(
            width: 343,
            child: const TextField(
              style:  TextStyle(height: 0),
              decoration:  InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(
                        width: 1.0, color: Color(0xFFDBDBDB))),
                labelText: 'Cash',
              ),
            ),
          )
        ]
    );
  }
}
class pocketCategory extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Pocket', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Container(
            width: 343,
            child: const TextField(
              style:  TextStyle(height: 0),
              decoration:  InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(
                        width: 1.0, color: Color(0xFFDBDBDB))),
                labelText: 'Entertainment',
              ),
            ),
          )
        ]
    );
  }
}
class editexpense extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        // Container(
        //     alignment: Alignment.center,
        //     child: const Center(
        //       child:
        //       Text('Edit Planned Payments',
        //           textAlign: TextAlign.center,
        //           style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w500)
        //       ),
        //     )
        // ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.all(15),
          width: 320,
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
                    Text('Edit your planned payment here!',
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
      ],
    );
  }
}
class  editPayment extends StatelessWidget{
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
class editsubmitpayment extends StatelessWidget{
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
            MaterialPageRoute(builder: (context) => editplannedpayment()),
          );
        },
        child: const Text('Edit Planned Payment',
            style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)
        ),
      ),
    );
  }
}
class deletesubmitpayment extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
            elevation: 0,
            backgroundColor: const Color(0xFFDFE2FF),
            shape:
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => editplannedpayment()),
          );
        },
        child: const Text('Delete Planned Payment',
            style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Colors.red)
        ),
      ),
    );
  }
}
class editcancelpayment extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
            elevation: 0,
            primary: Colors.grey,
            // backgroundColor: const Color(0xffb74093),
            shape:
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),)),
        // style: ElevatedButton.styleFrom(
        //     primary: Colors.white70,),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => editplannedpayment()),
          );
        },
        child: const Text('Cancel',
            style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFFDFE2FF))
        ),
      ),
    );
  }
}