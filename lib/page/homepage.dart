import 'package:flutter/material.dart'; 
import 'pocket/create_pocket.dart';
import 'pocket/pocket_details.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Homepage"),
            DirectPocket(),
            AddPocket()
          ]
      ); 
  }
}

class DirectPocket extends StatelessWidget{
  const DirectPocket({super.key});

  @override 
  Widget build(BuildContext context){
    //create pocket button
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Pocket()),
          );
        },
        child: const Text('Pocket'),
      ),
    );
  }
}

//create button to createPocket page
class AddPocket extends StatelessWidget{
  const AddPocket({super.key});

  @override 
  Widget build(BuildContext context){
    //create pocket button
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CreatePocket()),
          );
        },
        child: const Text('Create Pocket'),
      ),
    );
  }
}

