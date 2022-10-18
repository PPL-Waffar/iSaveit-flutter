import 'package:flutter/material.dart';
import 'package:isaveit/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// heroku link: https://isaveit-staging.herokuapp.com/pocket/add-pocket/

Future<Map<String, dynamic>> sendNewUser(
    String pocketName, String pocketBudget, User user) async {
  const url = 'http://127.0.0.1:8000/pocket/add-pocket/';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'input_pocketname': pocketName,
        'input_pocketbudget': pocketBudget,
        'session_id': user.sessionId,
      }),
    );

    Map<String, dynamic> result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return result;
    } else {
      return <String, dynamic>{'error': 'Web service is offline'};
    }
  } catch (error) {
    return {'isSuccessful': false, 'error': ''};
  }
}

// ignore: must_be_immutable
class CreatePocket extends StatefulWidget {
  User user;
  CreatePocket(this.user, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreatePocketPage createState() => _CreatePocketPage();
}

class _CreatePocketPage extends State<CreatePocket> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController pocketName = TextEditingController();
  TextEditingController pocketBudget = TextEditingController();
  Map<String, dynamic>? fetchedResult;
  bool? isSuccessful;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),

                    //Create pocket title
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      alignment: Alignment.topLeft,
                      child: const Text('Create Pocket',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                    ),

                    const SizedBox(height: 32),

                    SingleChildScrollView(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Name',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(height: 8),
                              TextFormField(
                                  controller: pocketName,
                                  key: const Key("addPocketName"),
                                  decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color: Color(0xFFDBDBDB))),
                                      hintText: 'Enter pocket name'),
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Pocket name cannot be empty";
                                    }

                                    return null;
                                  }),
                            ])),

                    const SizedBox(height: 32),

                    //Pocket budget
                    SingleChildScrollView(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('My Budget',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(height: 8),
                              TextFormField(
                                  controller: pocketBudget,
                                  key: const Key("addPocketBudget"),
                                  decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color: Color(0xFFDBDBDB))),
                                      hintText: 'Rp 0'),
                                  keyboardType: TextInputType.number,
                                  validator: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Pocket budget can't be empty";
                                    }

                                    return null;
                                  })
                            ])),

                    const SizedBox(height: 32),

                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: ElevatedButton(
                          key: const Key("createPocketButton"),
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(48),
                              elevation: 0,
                              backgroundColor: const Color(0XFF4054FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(48),
                              )),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              fetchedResult = await sendNewUser(
                                  pocketName.text,
                                  pocketBudget.text,
                                  widget.user);
                              isSuccessful = fetchedResult!['isSuccessful'];
                              if (isSuccessful == true) {
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context);
                              } else {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Failed to create pocket')));
                              }
                            }
                          },
                          child: const Text('Create Pocket')),
                    ),

                    const SizedBox(height: 32),

                    TextButton(
                      key: const Key("cancelCreatePocket"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Color(0xFFD3180C)),
                      ),
                    ),
                  ],
                ))));
  }
}