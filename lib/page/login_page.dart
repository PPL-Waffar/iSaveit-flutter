import 'dart:convert';
import '../page/navbar.dart';
import '../page/register_page.dart';
import '../models/user.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dart:async';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  Future<User> webServiceLogin(String telephone, String password) async {
    var response =
        await post(Uri.parse("https://isaveit-staging.herokuapp.com/user/flu-login/"),
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(children: <Widget>[
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Login to your account',
          style: TextStyle(fontSize: 24, color: Color(0xff3444CE)),
        ),
        const SizedBox(
          height: 7,
        ),
        const Text(
          "Welcome back, you've been missed",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Email',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 14),
        ),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    key: const Key("addEmail"),
                    controller: _email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your name'),
                  ),
                ),
              ],
            ),
          ),
        
        const Text(
          'Password',
          style: TextStyle(fontSize: 14),
        ),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    key: const Key("addPassword"),
                    controller: _password,
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your password'),
                  ),
                ),
              ],
            ),
          ),
        
        const SizedBox(
          height: 25,
        ),
        Container(
          height: 48,
          width: 327,
          padding: const EdgeInsets.fromLTRB(70, 16, 70, 16),
          decoration: const BoxDecoration(color: Color(0xff4054FF)),
          child: ElevatedButton(
            key: const Key("loginAccount"),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
              elevation: 0,
              backgroundColor: const Color(0XFF4054FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () async {
              setState(() {
                loading = true;
              });
              {
                User user =
                    await widget.webServiceLogin(_email.text, _password.text);

                {
                  SchedulerBinding.instance.addPostFrameCallback((_) {
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
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          // <-- TextButton
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Register()));
          },
          child: const Text(
            "Don't have an account?",
            style: TextStyle(
              color: Color(0XFF4054FF),
            ),
          ),
        ),
      ])),
    );
  }
}