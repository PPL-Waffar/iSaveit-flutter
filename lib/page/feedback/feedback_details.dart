// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:isaveit/page/feedback/delete_report.dart';

class FeedbackDetails extends StatefulWidget {
  const FeedbackDetails({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _FeedbackDetails createState() => _FeedbackDetails();
}

class _FeedbackDetails extends State<FeedbackDetails> {
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
          actions: const <Widget>[
            DeleteFeedback()
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  '12th June 2022',
                  style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff4054FF),
                      fontWeight: FontWeight.w700),
                ),
              Text(
                  '!  This report is over 3 months old, you can delete this',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.red,
                      fontWeight: FontWeight.w500),
                ),
              SizedBox(
                height: 20,
              ),
              Text(
                "How satisfied are you with this month’s money management?",
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w700),
              ),
              Text(
                '9/10',
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
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
                'Reduce unecessary expense and save income weekly',
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w400),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
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
                'I think the application has quiet good features, however it is preferable to have..',
                style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 14),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
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
                'Very helpful especially in keeping track of my expenses',
                style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: 14),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: const Divider(
                  color: Color(0xFFDBDBDB),
                  height: 20,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                ),
              ),
                    ]),
              )
          
        ));
  }
}
