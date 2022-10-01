import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 
import 'pocket/createPocket.dart';
import 'pocket/pocketdetails.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Homepage"),
            directPocket(),
            addPocket()
          ]
      ); 
  }
}

class directPocket extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    //create pocket button
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => pocket()),
          );
        },
        child: const Text('Pocket'),
      ),
    );
  }
}

//create button to createPocket page
class addPocket extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    //create pocket button
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => createPocket()),
          );
        },
        child: const Text('Create Pocket'),
      ),
    );
  }
}

