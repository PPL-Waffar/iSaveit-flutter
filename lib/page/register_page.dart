import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:isaveit/models/user.dart';
import '../page/login_page.dart';
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
        await post(Uri.parse("http://10.0.2.2:8000/user/flu-register-user/"),
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

    return Future.delayed(const Duration(seconds: 0), () => user);
  } else {
    return Future.error("internal");
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

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
          'Create an account',
          style: TextStyle(fontSize: 24, color: Color(0xff3444CE)),
        ),
        const SizedBox(
          height: 7,
        ),
        const Text(
          'Welcome to iSaveIt!',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Name',
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 14),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  key: const Key("addName"),
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your name'),
                  controller: _name,
                ),
              ),
            ],
          ),
        ),
        const Text(
          'Date of Birth',
          style: TextStyle(fontSize: 14),
        ),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
                child: TextField(
              key: const Key("addDate"),
              controller: dateinput,
              decoration: const InputDecoration(
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
            ))),
        const Text(
          'Email',
          style: TextStyle(fontSize: 14),
        ),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    key: const Key("addEmail"),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email'),
                    controller: _email,
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
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your password'),
                  controller: _password,
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
            key: const Key("addAccount"),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(48),
              elevation: 0,
              backgroundColor: const Color(0XFF4054FF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
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
                                builder: (BuildContext context) =>
                                    // ignore: prefer_const_constructors
                                    Login()),
                            (Route<dynamic> route) => false);
                      });
                    }
                  },
            child: const Text(
              'Create Account',
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
                MaterialPageRoute(builder: (context) => const Login()));
          },
          child: const Text(
            'Already have an account?',
            style: TextStyle(
              color: Color(0XFF4054FF),
            ),
          ),
        ),
      ])),
    );
  }
}