// ignore_for_file: prefer_ _ ructors, duplicate_ignore, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:isaveit/models/user.dart';
import 'login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
//heroku link: https://isaveit-staging.herokuapp.com/user/flu-register-user/"

Future<User> registerUser(
  String email,
  String password,
  String name,
  String datetime,
) async {
  Response response;
  try {
    response =
        await post(Uri.parse("http://localhost:8000/user/flu-register-user/"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode({
              "email": email,
              "password": password,
              "name": name,
              "datetime": datetime,
            }));
  } catch (e) {
    return Future.error("offline");
  }
  if (response.statusCode == 200) {
    Map userData = jsonDecode(response.body);
    User user = User(
        datetime: userData["datetime"],
        sessionId: userData["session-id"],
        isCitizen: true,
        email: userData["email"],
        name: userData["name"]);

    final prefs = await SharedPreferences.getInstance();

    prefs.setString('sessionId', userData["session-id"]);
    prefs.setBool('isCitizen', userData["role_users"]);
    prefs.setString('email', userData["email"]);
    prefs.setString('name', userData["name"]);

    return Future.delayed(Duration(seconds: 0), () => user);
  } else {
    return Future.error("internal");
  }
}

class Register extends StatefulWidget {
  Register({super.key});

  @override
  RegisterPage createState() {
    return RegisterPage();
  }
}

class RegisterPage extends State<Register> {
  TextEditingController dateinput = TextEditingController();
  @override
  void initState() {
    dateinput.text = ""; //set the initial value of text field
    super.initState();
  }

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _datetime = TextEditingController();
  bool submitting = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                    Widget>[
      SizedBox(
        height: 100,
      ),
      Image.asset(
        'assets/images/isaveit_logo.png',
        width: 200,
        height: 100,
      ),

      Text(
        'Create an account',
        style: TextStyle(
            fontSize: 24, color: Colors.black, fontWeight: FontWeight.w500),
      ),

      SizedBox(
        height: 32,
      ),

      //textformfield for Name
      SingleChildScrollView(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            SizedBox(height: 8),
            TextFormField(
              key: Key("addName"),
              controller: _name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                  hintText: 'Enter your name'),
            ),
          ],
        ),
      ),

      SizedBox(height: 32),

      //textformfield for Name
      SingleChildScrollView(
          padding: EdgeInsets.only(left: 30, right: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Date of Birth',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            SizedBox(height: 8),
            TextField(
              key: Key("addDate"),
              controller: dateinput,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      borderSide:
                          BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                  hintText:
                      'YYYY-MM-dd'), //editing controller of this TextField
              readOnly:
                  true, //set it true, so that user will not able to edit text
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(
                        2000), //DateTime.now() - not to allow to choose before today.
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  setState(() {
                    dateinput.text =
                        formattedDate; //set output date to TextField value.
                  });
                } else {}
              },
            )
          ])),

      SizedBox(height: 32),

      //textformfield for email
      SingleChildScrollView(
          padding: EdgeInsets.only(left: 30, right: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Email',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
            SizedBox(height: 8),
            TextFormField(
              key: Key("addEmail"),
              controller: _email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                  hintText: 'Enter your email'),
            ),
            SizedBox(height: 32),
            SingleChildScrollView(
                // padding:   EdgeInsets.only(left: 30, right: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text('Password',
                      style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                  SizedBox(height: 8),
                  TextFormField(
                    key: Key("addPassword"),
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            borderSide: BorderSide(
                                width: 1.0, color: Color(0xFFDBDBDB))),
                        hintText: 'Enter your password'),
                  ),
                ])),
            SizedBox(height: 32),
            Container(
              alignment: Alignment.center,
              child: ElevatedButton(
                key: Key("addAccount"),
                style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(48),
                    elevation: 0,
                    backgroundColor: Color(0XFF4054FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48),
                    )),
                onPressed: submitting
                    ? null
                    : () async {
                        setState(() {
                          submitting = true;
                        });
                        {
                          await registerUser(_email.text, _password.text,
                                  _name.text, _datetime.text)
                              .then((user) {
                            // create User and then pushAndRemoveUntil(MyHomePage(user:uset))
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute<void>(
                                    builder: (BuildContext context) => Login()),
                                (Route<dynamic> route) => false);
                          });
                        }
                      },
                child: Text(
                  'Create Account',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                // <-- TextButton
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text(
                  'Already have an account?',
                  style: TextStyle(
                      color: Color(0XFF4054FF),
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
            ),
          ]))
    ])));
  }
}
