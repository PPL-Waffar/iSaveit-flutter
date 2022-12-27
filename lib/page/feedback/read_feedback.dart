// ignore_for_file: unused_field, duplicate_ignore, prefer_const_constructors, annotate_overrides

import 'package:flutter/material.dart';
import 'package:isaveit/page/feedback/create_feedback.dart';
import 'package:isaveit/page/feedback/feedback_details.dart';
import 'package:isaveit/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<Map<String, dynamic>> fetchGroups(User user) async {
  String url =
      'http://localhost:8000/feedbackreport/view-feedback-report/?session_id=${user.sessionId}';

  try {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, dynamic> body = {'session_id': user.sessionId};

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

class ReadFeedback extends StatefulWidget {
  final User user;
  const ReadFeedback(this.user, {super.key});

  @override
  ReadFeedbackPage createState() => ReadFeedbackPage();
}

class ReadFeedbackPage extends State<ReadFeedback> {
  bool _isLoading = false;
  List<dynamic> allpocket = [];
  Map<String, dynamic> response = {};
  // ignore: unused_field
  late Timer _timer;
  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 3), (timer) async {
      await _intializeData();
      if (mounted) {
        _isLoading = true;
        setState(() => _isLoading = true);
      }
    });
  }
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  Future<void> _intializeData() async {
    response = await fetchGroups(widget.user);
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
              onPressed: () => Navigator.of(context).pop()),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CreateFeedback(widget.user)),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(height: 60),

          //title
          Container(
            margin: const EdgeInsets.only(left: 20),
            alignment: Alignment.topLeft,
            child: const Text('Your Satisfaction Report',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w700)),
          ),

          SingleChildScrollView(
              // padding: const EdgeInsets.only(left: 30, right: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                FutureBuilder(
                    future: _intializeData(),
                    builder: (context, snapshot) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 0.5,
                            ),
                            const SizedBox(height: 24),

                            for (int i = 0; i < allpocket.length; i++)
                              Column(
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: const EdgeInsets.only(left: 20),
                                    child: Text(allpocket[i]['feedback_date'],
                                        style: const TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF4054FF))),
                                  ),

                                  const SizedBox(height: 12),

                                  //Feedback content
                                  SizedBox(
                                    child: Row(children: [
                                      Flexible(
                                        child: Container(
                                          height: 46,
                                          width: 200,
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: RichText(
                                            text: TextSpan(
                                                style:
                                                    DefaultTextStyle.of(context)
                                                        .style,
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: allpocket[i]
                                                          ['feedback_goal'],
                                                      style: const TextStyle(
                                                          fontSize: 14.0,
                                                          fontFamily: 'Roboto',
                                                          color: Color(
                                                              0xFF212121))),
                                                ]),
                                          ),
                                        ),
                                      ),
                                    ]),
                                  ),
                                  TextButton(
                                      onPressed: () => Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  FeedbackDetails(
                                                      widget.user,
                                                      allpocket[i]
                                                          ['feedback_id']))),
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                                EdgeInsets>(
                                            const EdgeInsets.all(20)),
                                      ),
                                      child: RichText(
                                        text:
                                            const TextSpan(children: <TextSpan>[
                                          TextSpan(
                                              text: 'See more',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xff979C9E),
                                                  fontWeight: FontWeight.w700))
                                        ]),
                                      )),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: const Divider(
                                      color: Color(0xFFDBDBDB),
                                      height: 20,
                                      thickness: 1,
                                      indent: 0,
                                      endIndent: 0,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 38,
                                  ),
                                ],
                              ),
                            //Name of the user
                          ]);
                    }),
              ])),
        ])));
  }
}
