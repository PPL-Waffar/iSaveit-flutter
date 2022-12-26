// ignore_for_file: prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:isaveit/page/feedback/delete_report.dart';
import 'package:isaveit/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<Map<String, dynamic>> fetchGroups(User user, int id) async {
  String url =
      'http://localhost:8000/feedbackreport/view-feedback-detail/?session_id=${user.sessionId}&input_id=$id';

  try {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, dynamic> body = {'session_id': user.sessionId, 'input_id': id};

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

class FeedbackDetails extends StatefulWidget {
  final User user;
  final int id;

  const FeedbackDetails(this.user, this.id, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FeedbackDetails createState() => _FeedbackDetails();
}

class _FeedbackDetails extends State<FeedbackDetails> {
  Map<String, dynamic> response = {};
  List<dynamic> allpocket = [];
  late Timer _timer;
  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 3), (timer) async {
      await _intializeData();
    });
  }

  Future<void> _intializeData() async {
    response = await fetchGroups(widget.user, widget.id);
    if (response["isSuccessful"]) {
      allpocket = response["data"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          actions: <Widget>[DeleteFeedback(widget.user, widget.id)],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    FutureBuilder(
                        future: _intializeData(),
                        builder: ((context, snapshot) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                allpocket[0]['feedback_date'],
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff4054FF),
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "How satisfied are you with this month's money management?",
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                allpocket[0]['feedback_rating'].toString(),
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: const Divider(
                                  color: Color(0xFFDBDBDB),
                                  height: 20,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                ),
                              ),
                              Text(
                                'What goals do you hope to achieve next month?',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              ),
                              Text(
                                allpocket[0]['feedback_goal'],
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w400),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: const Divider(
                                  color: Color(0xFFDBDBDB),
                                  height: 20,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                ),
                              ),
                              Text(
                                'What are you looking to improve in managing your money?',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 14),
                              ),
                              Text(
                                allpocket[0]['feedback_text'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 14),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: const Divider(
                                  color: Color(0xFFDBDBDB),
                                  height: 20,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                ),
                              ),
                              Text(
                                'How helpful do you think this service in your daily life?',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 14),
                              ),
                              Text(
                                allpocket[0]['feedback_text2'],
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 14),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: const Divider(
                                  color: Color(0xFFDBDBDB),
                                  height: 20,
                                  thickness: 1,
                                  indent: 0,
                                  endIndent: 0,
                                ),
                              ),
                            ],
                          );
                        })),
                  ],
                ))) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
