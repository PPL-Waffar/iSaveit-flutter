// ignore_for_file: prefer_ _ ructors, prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:convert';
import '../navbar.dart';
import 'register_page.dart';
import '../../models/user.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
//url heroku: "https://isaveit-staging.herokuapp.com/user/flu-login/"
//url local: "http://127.0.0.1:8000/user/flu-login/"

class Login extends StatefulWidget {
  Login({super.key});
  Future<User> webServiceLogin(String telephone, String password) async {
    var response = await post(
        Uri.parse("https://isaveit-backend.herokuapp.com/user/flu-login/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({"email": telephone, "password": password}));

    if (response.statusCode == 200) {
      Map<String, dynamic> userData = jsonDecode(response.body);
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
      // prefs.setString('name', userData["name"]);

      return user;
    } else {
      return Future.error("Incorrect Login");
    }
  }

  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        // ),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
              SizedBox(height: 100),

              //add image isaveit_logo
              Image.asset(
                'assets/images/isaveit_logo.png',
                width: 200,
                height: 100,
              ),

              Text(
                'Login to your account',
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),

              SizedBox(height: 32),

              //textformfield for email
              SingleChildScrollView(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  borderSide: BorderSide(
                                      width: 1.0, color: Color(0xFFDBDBDB))),
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        borderSide: BorderSide(
                                            width: 1.0,
                                            color: Color(0xFFDBDBDB))),
                                    hintText: 'Enter your password'),
                              ),
                            ])),

                        SizedBox(
                          height: 32,
                        ),

                        //login button
                        Container(
                          alignment: Alignment.center,
                          // margin:   EdgeInsets.only(left: 30, right: 30),
                          child: ElevatedButton(
                            key: Key("loginAccount"),
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(48),
                                elevation: 0,
                                backgroundColor: Color(0XFF4054FF),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(48),
                                )),
                            onPressed: () async {
                              setState(() {
                                loading = true;
                              });
                              {
                                User user = await widget.webServiceLogin(
                                    _email.text, _password.text);
                                {
                                  SchedulerBinding.instance
                                      .addPostFrameCallback((_) {
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute<void>(
                                            builder: (BuildContext context) =>
                                                SettingView(user)),
                                        (Route<dynamic> route) => false);
                                  });
                                }
                              }
                              _email.clear();
                              _password.clear();
                            },
                            child: Text(
                              'Login',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),

                        SizedBox(height: 15),

                        //direct to register
                        Container(
                          alignment: Alignment.center,
                          child: TextButton(
                            key: Key("registerAccount"),
                            // <-- TextButton
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Register()));
                            },
                            child: Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  color: Color(0XFF4054FF),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                          ),
                        )
                      ]))
            ])));
  }
}
