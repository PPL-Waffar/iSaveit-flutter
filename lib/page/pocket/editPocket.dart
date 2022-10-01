import 'package:flutter/material.dart';
import 'package:isaveit/page/homepage.dart';
import 'package:isaveit/page/pocket/pocketdetails.dart';

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
            pocketBalance(),
            const SizedBox(height: 32),
            divider(),
            const SizedBox(height: 32),
            name(),
            const SizedBox(height: 32),
            myBudget(),
            const SizedBox(height: 32),
            editButton(),
            const SizedBox(height: 16),
            deleteDialog(),
            const SizedBox(height: 16),
            cancelButton(),
        ],)
      )
    );
  }
}
class pocketBalance extends StatelessWidget{
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
      margin: const EdgeInsets.only(left: 70, right: 70),
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
            MaterialPageRoute(builder: (context) => pocket()),
          );
        },
        child: const Text('Edit Pocket'),
      ),
    );
  }
}

class deleteDialog extends StatelessWidget {
  const deleteDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 70, right: 70),
      child: ElevatedButton(
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
            title: const Text('Delete Pocket'),
            content: const Text('Are you sure you want to delete this pocket?'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel', style: TextStyle(color: Color(0xFFD3180C))),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'Delete', ),
                child: const Text('Delete', style: TextStyle(color: Color(0XFF4054FF))),
              ),
            ],
          ),
        ),
        child: const Text('Delete Pocket', style: TextStyle(color: Color(0XFF4054FF))),
      )
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
          MaterialPageRoute(builder: (context) => pocket()),
        );
      },
  child: const Text(
    'Cancel',
    style: TextStyle(color: Color(0xFFD3180C)),
  ),
);
  }
}

