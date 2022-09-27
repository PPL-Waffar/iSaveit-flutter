import 'package:flutter/material.dart';
import 'package:isaveit/page/pocket.dart';

class editPocket extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 96),
            balance(),
            const SizedBox(height: 32),
            divider(),
            const SizedBox(height: 32),
            name(),
            const SizedBox(height: 32),
            myBudget(),
            const SizedBox(height: 32),
            editButton(),
            const SizedBox(height: 16),
            deleteButton(),
            const SizedBox(height: 16),
            cancelButton(),
        ],)
      )
    );
  }
}
class balance extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: const Center(
            child: 
            Text('Grocery Balance',
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
    );
  }
}

//create divider
class divider extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: const Divider(
        color: Color(0xFFDBDBDB),
        height: 20,
        thickness: 1,
        indent: 0,
        endIndent: 0,
      ),
    );
  }
}

class name extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Name', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
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
              labelText: 'Enter pocket name',
            ),
          ),
        )
      ]
    );
  }
}

class myBudget extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('My Budget', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
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
              labelText: 'Rp 0',
            ),
            keyboardType: TextInputType.number,
          ),
        )
      ]
    );
  }
}

class editButton extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    //create pocket button
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
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
            MaterialPageRoute(builder: (context) => editPocket()),
          );
        },
        child: const Text('Edit Pocket'),
      ),
    );
  }
}

class deleteButton extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    //create pocket button
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          
          elevation: 0,
          backgroundColor: const Color(0xFFDFE2FF),
          shape: 
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(48),
            )
          ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => editPocket()),
          );
        },
        child: const Text('Delete Pocket', style: TextStyle(color: Color(0xFF4054FF))),
      ),
    );
  }
}

class cancelButton extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    //create pocket button
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => editPocket()),
        );
      },
  child: const Text(
    'Cancel',
    style: TextStyle(color: Color(0xFFD3180C)),
  ),
);
  }
}
