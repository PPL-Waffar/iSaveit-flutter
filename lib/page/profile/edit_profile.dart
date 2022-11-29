// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';
import 'package:isaveit/page/navbar.dart';
import 'package:isaveit/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


// heroku link:

Future<Map<String, dynamic>> sendNewUser(String name, User user) async {
  // const url = 'http://127.0.0.1:8000/payment/flu-add-payment/';
  const url = 'http://localhost:8000/user/edit-user/';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
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

// ignore: must_be_immutable
class EditProfile extends StatefulWidget {
  User user;
  EditProfile(this.user, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EditProfilePage createState() => _EditProfilePage();
}

class _EditProfilePage extends State<EditProfile> {
  Map<String, dynamic> response = {};
  Map<String, dynamic>? fetchedResult;
  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> thedata = {};
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
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),

                    //Page Title
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      alignment: Alignment.topLeft,
                      child: const Text('Edit your Personal Information',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                    ),

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
                                controller: userName,
                                key: Key("editName"),
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

                    // SingleChildScrollView(
                    //     padding: const EdgeInsets.only(left: 30, right: 30),
                    //     child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           const Text('Birth Date',
                    //               style: TextStyle(
                    //                   fontFamily: 'Inter',
                    //                   fontSize: 16,
                    //                   fontWeight: FontWeight.w700)),
                    //           const SizedBox(height: 8),
                    //           //Date Picker
                    //           // ignore: avoid_unnecessary_containers
                    //           Container(
                    //               child: Center(
                    //                   child: TextField(
                    //             key: const Key("birthDate"),
                    //             controller: transactionDate,
                    //             decoration: const InputDecoration(
                    //                 prefixIcon: Icon(Icons.calendar_today),
                    //                 enabledBorder: OutlineInputBorder(
                    //                     borderRadius: BorderRadius.all(
                    //                         Radius.circular(8.0)),
                    //                     borderSide: BorderSide(
                    //                         width: 1.0,
                    //                         color: Color(0xFFDBDBDB))),
                    //                 hintText:
                    //                     '2002-09-12'), //editing controller of this TextField

                    //             readOnly:
                    //                 true, //set it true, so that user will not able to edit text
                    //             onTap: () async {
                    //               DateTime? pickedDate = await showDatePicker(
                    //                   context: context,
                    //                   initialDate: DateTime.now(),
                    //                   firstDate: DateTime(
                    //                       2000), //DateTime.now() - not to allow to choose before today.
                    //                   lastDate: DateTime(2101));

                    //               if (pickedDate != null) {
                    //                 String formattedDate =
                    //                     DateFormat('yyyy-MM-dd')
                    //                         .format(pickedDate);
                    //                 setState(() {
                    //                   transactionDate.text =
                    //                       formattedDate; //set output date to TextField value.
                    //                 });
                    //               } else {}
                    //             },
                    //           ))),
                    //         ])),

                    // const SizedBox(height: 32),

                    // //Occupation
                    // SingleChildScrollView(
                    //     padding: const EdgeInsets.only(left: 30, right: 30),
                    //     child: Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           const Text('Occupation',
                    //               style: TextStyle(
                    //                   fontFamily: 'Inter',
                    //                   fontSize: 16,
                    //                   fontWeight: FontWeight.w700)),
                    //           const SizedBox(height: 8),
                    //           TextFormField(
                    //             controller: userOccupation,
                    //             key: const Key("editOccupation"),
                    //             decoration: const InputDecoration(
                    //                 enabledBorder: OutlineInputBorder(
                    //                     borderRadius: BorderRadius.all(
                    //                         Radius.circular(8.0)),
                    //                     borderSide: BorderSide(
                    //                         width: 1.0,
                    //                         color: Color(0xFFDBDBDB))),
                    //                 hintText: 'Student'),
                    //           ),
                    //         ])),

                    // const SizedBox(height: 32),

                    //Edit Profile Button
                    Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        child: ElevatedButton(
                          key: const Key("saveEditProfile"),
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(48),
                              elevation: 0,
                              backgroundColor: const Color(0XFF4054FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(48),
                              )),
                          onPressed: () async {
                            fetchedResult =
                                await sendNewUser(userName.text, widget.user);
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SettingView(widget.user)));
                          },
                          // Navigator.of(context).push(
                          // MaterialPageRoute(
                          // builder: (context) => => Navigator.pop(context), const ProfileView())),
                          child: const Text('Save Profile'),
                        )),

                    const SizedBox(height: 32),

                    Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        child: ElevatedButton(
                          key: const Key("cancelEditProfile"),
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(48),
                              elevation: 0,
                              shadowColor: Colors.transparent,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(48),
                              )),
                          onPressed: () => Navigator.pop(context),
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  ProfileView())),
                          child: const Text('Cancel',
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red)),
                        )),
                  ],
                ))));
  }
}
