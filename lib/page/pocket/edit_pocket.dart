import 'package:flutter/material.dart';
import 'package:isaveit/page/homepage.dart';
import 'package:isaveit/page/pocket/pocket_details.dart';

import '../../models/user.dart';

class EditPocket extends StatefulWidget {
  User? user;
  EditPocket({Key? key, this.user}) : super(key: key);

  @override
  EditPocketPage createState() => EditPocketPage();
}

class EditPocketPage extends State<EditPocket> {

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
                const Text('Edit Pocket',
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
                const Text('Name', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                TextFormField(
                      key: const Key("editPocketName"),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                          hintText: 'Enter pocket name'),
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
                const Text('My Budget', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                TextFormField(
                      key: const Key("editPocketBudget"),
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

            //edit button
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: ElevatedButton(
                key: const Key("editPocketButton"),
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
                    MaterialPageRoute(builder: (context) => Pocket()),
                  );
                },
                child: const Text('Edit Pocket'),
              ),
            ),

            const SizedBox(height: 16),

            //delete button
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: ElevatedButton(
                key: const Key("deletePocket"),
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
                        key: const Key("cancelDeletePocket"),
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel', style: TextStyle(color: Color(0xFFD3180C))),
                      ),
                      TextButton(
                        key: const Key("confirmDeletePocket"),
                        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomeView())),
                        child: const Text('Delete', style: TextStyle(color: Color(0XFF4054FF))),
                      ),
                    ],
                  ),
                ),
                child: const Text('Delete Pocket', style: TextStyle(color: Color(0XFF4054FF))),
              )
            ),
            
            const SizedBox(height: 16),
            
            //cancel button
            TextButton(
              key: const Key("cancelEditPocket"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Pocket()),
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