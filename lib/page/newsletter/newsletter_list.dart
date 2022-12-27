// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
// import 'package:isaveit/page/newsletter/newsletter_details.dart';

import 'newsletter_details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<Map<String, dynamic>> fetchGroups() async {
  String url =
      'https://isaveit-backend.herokuapp.com/newsletter/view-all-newsletter/';

  try {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, dynamic> body = {};

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    List<dynamic> extractedData = jsonDecode(response.body);

    // await Future.delayed(Duration(seconds: 10));
    if (response.statusCode == 200) {
      return {"isSuccessful": true, "data": extractedData, "error": null};
    } else {
      return {
        "isSuccessful": false,
        "data": extractedData,
        "error": "An error has occurred"
      };
    }
  } catch (error) {
    return {
      "isSuccessful": false,
      "data": [],
      "error": "Our web service is down."
    };
  }
}

class NewsletterList extends StatefulWidget {
  const NewsletterList({super.key});

  @override
  NewsList createState() => NewsList();
}

class NewsList extends State<NewsletterList> {
  List<dynamic> allpocket = [];
  Map<String, dynamic> response = {};

  @override
  void initState() {
    super.initState();
  }

  Future<void> _intializeData() async {
    response = await fetchGroups();
    if (response["isSuccessful"]) {
      allpocket = response["data"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          FutureBuilder(
              future: _intializeData(),
              builder: (context, snapshot) {
                return Column(children: [
                  for (int i = 0; i < allpocket.length; i++)
                    const SizedBox(height: 24),
                  for (int i = 0; i < allpocket.length; i++)
                    Padding(
                        padding: EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 132,
                                height: 32,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32),
                                    color: Color.fromARGB(255, 239, 238, 239)),
                                child: Center(
                                  child: Text(
                                    allpocket[i]['newsletter_title'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff090A0A)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Image.network(
                                'https://isaveit-backend.herokuapp.com' +
                                    jsonDecode(
                                        allpocket[i]['newsletter_picture']),
                                width: 343,
                                height: 154,
                              ),
                              SizedBox(height: 5),
                              TextButton(
                                key: const Key("title1"),
                                child: Text(
                                  allpocket[i]['newsletter_title'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xff090A0A)),
                                ),
                                onPressed: () async {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NewsDetails(
                                              allpocket[i]['newsletter_id'])));
                                },
                              ),
                              SizedBox(height: 5),
                              Text(allpocket[i]['newsletter_category'],
                                  style: TextStyle(
                                      color: Color(0xff979C9E),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500)),
                            ])),
                  const SizedBox(height: 24),
                  Divider(
                    color: Color(0xFFDBDBDB),
                    height: 20,
                    thickness: 1,
                    indent: 0,
                    endIndent: 0,
                  ),
                ]);
              })
        ])));
  }
}

      
//   }
// }
