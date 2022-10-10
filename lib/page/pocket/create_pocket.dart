import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:isaveit/page/homepage.dart';
// import 'package:isaveit/page/pocket/pocket_details.dart';
import 'package:isaveit/models/user.dart';
import 'package:http/http.dart';

Future<Map<String, dynamic>> sendNewUser(
    String pocketname, String pocketbudget, User user) async{
      var response = await post(
        Uri.parse("http://localhost:8000/user/flu-login/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "input_pocketname": pocketname, 
          'input_pocketbudget': pocketbudget,
          'session_id': user.sessionId,
        })
      );
    Map<String, dynamic> result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print('ebrhsil');
      return result;
      print('ebrhsil');
    } else {
      print('web server offlien');
      return <String, dynamic>{'error': 'Web service is offline'};
    }
  }


class CreatePocket extends StatefulWidget {
  User user;
  CreatePocket(this.user, {super.key});
  // const CreatePocket({Key? key}) : super(key: key);
  
  @override
  CreatePocketPage createState() => CreatePocketPage();
}

class CreatePocketPage extends State<CreatePocket> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController pocketname = TextEditingController();
  TextEditingController pocketbudget = TextEditingController();
  Map<String, dynamic>? fetchedResult;
  bool? isSuccessful;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 60),

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

            Padding(padding: const EdgeInsets.all(30),
            child:
            Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                const Text('Pocket Name', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: pocketname, 
                      key: const Key("addPocketName"),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                          hintText: 'Enter pocket name',
                          
                    ), 
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Pocket name cannot be empty";
                      }
                      return null;
                    })
                ]
              )))),
              

            const SizedBox(height: 32),

            Padding(padding: const EdgeInsets.all(30),
            child:
            Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                const Text('Pocket Budget', style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: pocketname, 
                      key: const Key("addPocketBudget"),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                          hintText: 'Rp 0',
                          
                    ), 
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Pocket budget cannot be empty";
                      }
                      return null;
                    })
                ]
              )))),

            const SizedBox(height: 32),

            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 70, right: 70),
              child: ElevatedButton(
                key: const Key("createPocket"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  elevation: 0,
                  backgroundColor: const Color(0XFF4054FF),
                  shape: 
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48),
                    )
                  ),
                onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      fetchedResult = await sendNewUser(pocketname.text,
                          pocketbudget.text, widget.user);
                      print(isSuccessful);
                      isSuccessful = fetchedResult!["isSuccessful"];
                      if (isSuccessful!) {
                        Navigator.pop(context);
                      } else {
                        setState(() {
                          final snackBar = SnackBar(
                            content: Text(fetchedResult!["eror123"]),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.blue,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      }
                    } else {}
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
                  MaterialPageRoute(builder: (context) =>  HomeView()),
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