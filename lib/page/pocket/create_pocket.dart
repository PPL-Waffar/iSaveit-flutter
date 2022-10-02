import 'package:flutter/material.dart';

class CreatePocket extends StatefulWidget {
  const CreatePocket({Key? key}) : super(key: key);


  @override
  CreatePocketPage createState() => CreatePocketPage();
}


class CreatePocketPage extends State<CreatePocket> {

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 32),

            //Create pocket title
            Container(
              margin: const EdgeInsets.only(left: 20),
              alignment: Alignment.topLeft,
                child: 
                const Text('Create Pocket',
                style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)
                ),
              ),

            const SizedBox(height: 32),

            SingleChildScrollView( 
              padding: const EdgeInsets.only(left: 70, right: 70),
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Name', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                TextFormField(
                      key: const Key("addPocketName"),
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
              padding: const EdgeInsets.only(left: 70, right: 70),
              child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('My Budget', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                TextFormField(
                      key: const Key("addPocketBudget"),
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

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 70, right: 70),
              child: ElevatedButton(
                key: const Key("createPocketButton"),
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
                    MaterialPageRoute(builder: (context) => const CreatePocket()),
                  );
                },
                child: const Text('Create Pocket'),
              ),
            ),

            const SizedBox(height: 32),

            TextButton(
              key: const Key("cancelCreatePocket"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreatePocket()),
                );
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Color(0xFFD3180C)),
              ),
          ),
          ],
        )
      )
    );  
  }
}