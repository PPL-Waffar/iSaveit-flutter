import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../page/homepage.dart';


class Login extends StatefulWidget {
  @override
  LoginPage createState() => LoginPage();
}


class LoginPage extends State<Login> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          ),
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Text('Login to your account', style: TextStyle(fontSize: 24, color: Color(0xff3444CE)),),
          SizedBox(height: 7,),
          const Text("Welcome back, you've been missed", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
          const SizedBox(height: 20,),
          Text('Email', textAlign: TextAlign.left, style: TextStyle(fontSize: 14),),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      key: Key("addEmail"),
                      decoration: const InputDecoration(
                          border : OutlineInputBorder(), hintText: 'Enter your name'
                        ),
                    ),
                  ),  
                ],
              ),
            ),
          ),
          Text('Password', style: TextStyle(fontSize: 14),),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      key: Key("addPassword"),
                      obscureText: true,
                      decoration: const InputDecoration(
                          border : OutlineInputBorder(), hintText: 'Enter your password'
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25,),
          Container(
              height: 48,
              width: 327,
              padding: EdgeInsets.fromLTRB(70, 16, 70, 16),
              decoration: BoxDecoration(
                color: Color(0xff4054FF)
              ),
              child: ElevatedButton(
                  key: Key("loginAccount"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                    elevation: 0,
                    backgroundColor: const Color(0XFF4054FF),
                    shape:
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView())
                  );
                },
                child: const Text('Login', style: TextStyle(fontSize: 16, color: Colors.white), ),
              ),
            ),
            SizedBox(height: 20,),
            TextButton(     // <-- TextButton
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeView())
                  );
              },
              child: Text("Don't have an account?", style: TextStyle(color: Color(0XFF4054FF),),),
            ),
          ]
        )
      ),
    );
  }
}