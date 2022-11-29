// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:isaveit/page/feedback/read_feedback.dart';
import 'package:isaveit/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'edit_profile.dart';

Future<Map<String, dynamic>> fetchGroups(User user) async {
  String url =
      'http://localhost:8000/user/user-info/?session_id=${user.sessionId}';

  try {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, dynamic> body = {
      'session_id': user.sessionId,
    };
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return {"isSuccessful": true, "data": data, "error": null};
    } else {
      throw Exception('Failed to load data');
    }
  } catch (error) {
    return {
      "isSuccessful": false,
      "data": [],
      "error": "Our web service is down."
    };
  }
}
// heroku link:

// ignore: must_be_immutable
class ProfileView extends StatefulWidget {
  final User user;
  const ProfileView(this.user, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileDetailPage createState() => _ProfileDetailPage();
}

class _ProfileDetailPage extends State<ProfileView> {
  Map<String, dynamic> response = {};
  Map<String, dynamic> thedata = {};
  final _formKey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userOccupation = TextEditingController();

  TextEditingController transactionDate = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  Future<void> _intializeData() async {
    response = await fetchGroups(
      widget.user,
    );
    if (response["isSuccessful"]) {
      thedata = response["data"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: FutureBuilder(
              future: _intializeData(),
              builder: (context, snapshot) {
                return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60),
                      Row(
                          //Page Title
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(left: 20),
                              alignment: Alignment.topLeft,
                              child: const Text('Profile',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditProfile(widget.user))),
                                icon: const Icon(Icons.edit,
                                    color: Colors.black, size: 20))
                          ]),

                      const SizedBox(height: 32),

                      //Name
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
                                  enabled: false,
                                  controller: userName,
                                  key: const Key("editName"),
                                  decoration: InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color: Color(0xFFDBDBDB))),
                                      hintText: thedata["name"]),
                                ),
                              ])),

                      const SizedBox(height: 32),

                      //Email
                      SingleChildScrollView(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Email',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700)),
                                const SizedBox(height: 8),
                                TextFormField(
                                  enabled: false,
                                  controller: userEmail,
                                  key: const Key("editEmail"),
                                  decoration: InputDecoration(
                                      enabledBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color: Color(0xFFDBDBDB))),
                                      hintText: thedata["email"]),
                                )
                              ])),
                      const SizedBox(height: 32),
                      Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFDFE2FF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  //add text
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: const EdgeInsets.only(
                                        left: 30, right: 30, top: 20),
                                    child: const Text(
                                      'Set your goals and satisfaction here! ',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF4054FF),
                                      ),
                                    ),
                                  ),

                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: const EdgeInsets.only(
                                        left: 30, right: 30, top: 20),
                                    child: const Text(
                                      'Keep track of your monthly progress and see how you’ve been managing your money!',
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),

                                  //add button to create_feedback.dart
                                  Container(
                                      alignment: Alignment.bottomRight,
                                      margin: const EdgeInsets.only(
                                          left: 30, right: 30, top: 20),
                                      child: TextButton(
                                        onPressed: () => Navigator.of(context)
                                            .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    const ReadFeedback())),
                                        child:
                                            const Text('Click here to see more',
                                                style: TextStyle(
                                                  color: Color(0xFF4054FF),
                                                )),
                                      )),

                                  const SizedBox(height: 5),
                                ],
                              ))),
                      const SizedBox(height: 32),
                    ]);
              })),
    );
  }
}
