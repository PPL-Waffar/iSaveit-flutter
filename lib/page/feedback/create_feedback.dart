import 'package:flutter/material.dart';
import 'package:isaveit/page/feedback/read_feedback.dart';
import 'package:isaveit/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:isaveit/page/navbar.dart';

Future<Map<String, dynamic>> sendNewUser(String feedback1, String feedback2,
    String feedback3, String feedback4, String feedback5, User user) async {
  const url =
      'https://isaveit-backend.herokuapp.com/feedbackreport/add-feedback-report/';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'feedback1': feedback1,
        'feedback2': feedback2,
        'feedback3': feedback3,
        'feedback4': feedback4,
        'feedback5': feedback5,
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
// heroku link:

// ignore: must_be_immutable
class CreateFeedback extends StatefulWidget {
  final User user;
  const CreateFeedback(this.user, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CreateFeedbackPage createState() => _CreateFeedbackPage();
}

class _CreateFeedbackPage extends State<CreateFeedback> {
  final _formKey = GlobalKey<FormState>();
  bool? isSuccessful;
  Map<String, dynamic>? fetchedResult;
  TextEditingController feedbackText = TextEditingController();
  TextEditingController feedbackText2 = TextEditingController();
  TextEditingController feedbackText3 = TextEditingController();
  TextEditingController feedbackText4 = TextEditingController();
  TextEditingController feedbackText5 = TextEditingController();

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

                      //Name
                      SingleChildScrollView(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding: EdgeInsets.only(left: 30, right: 30),
                              child: Text('Monthly Satisfaction Survey',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700))),

                          const SizedBox(height: 32),

                          SingleChildScrollView(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                        "In 1-5, How satisfied are you with this month's money management?",
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700)),
                                    const SizedBox(height: 8),
                                    TextFormField(
                                      controller: feedbackText,
                                      key: const Key("question1"),
                                      decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                              borderSide: BorderSide(
                                                  width: 1.0,
                                                  color: Color(0xFFDBDBDB))),
                                          hintText: 'Enter your rating'),
                                    ),
                                  ])),

                          const SizedBox(height: 24),

                          SingleChildScrollView(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                        "What goals do you hope to achieve next month?",
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700)),
                                    const SizedBox(height: 8),
                                    TextFormField(
                                      controller: feedbackText2,
                                      key: const Key("question2"),
                                      decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                              borderSide: BorderSide(
                                                  width: 1.0,
                                                  color: Color(0xFFDBDBDB))),
                                          hintText: 'Enter your goals'),
                                    ),
                                  ])),

                          const SizedBox(height: 24),

                          SingleChildScrollView(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                        "What are you looking to improve in managing your money?",
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700)),
                                    const SizedBox(height: 8),
                                    TextFormField(
                                        controller: feedbackText3,
                                        key: const Key("question3"),
                                        decoration: const InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0)),
                                                borderSide: BorderSide(
                                                    width: 1.0,
                                                    color: Color(0xFFDBDBDB))),
                                            hintText: 'Enter your thoughts'),
                                        validator: (String? value) {
                                          if (value!.isEmpty) {
                                            return "Textfield cannot be empty";
                                          }

                                          return null;
                                        }),
                                  ])),
                          const SizedBox(height: 24),
                          SingleChildScrollView(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                        "How helpful do you think this service in your daily life?",
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700)),
                                    const SizedBox(height: 8),
                                    TextFormField(
                                      key: const Key("question4"),
                                      controller: feedbackText4,
                                      decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                              borderSide: BorderSide(
                                                  width: 1.0,
                                                  color: Color(0xFFDBDBDB))),
                                          hintText: 'Enter your thoughts'),
                                    ),
                                  ])),

                          const SizedBox(height: 24),
                          SingleChildScrollView(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                        "Do you have any feedback for the application to ease your experience?",
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700)),
                                    const SizedBox(height: 8),
                                    TextFormField(
                                      controller: feedbackText5,
                                      key: const Key("question5"),
                                      decoration: const InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8.0)),
                                              borderSide: BorderSide(
                                                  width: 1.0,
                                                  color: Color(0xFFDBDBDB))),
                                          hintText: 'Enter your thoughts'),
                                    ),
                                  ])),

                          const SizedBox(height: 24),

                          //submit feedback Button
                          Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: ElevatedButton(
                                key: const Key("submitFeedback"),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(48),
                                    elevation: 0,
                                    backgroundColor: const Color(0XFF4054FF),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(48),
                                    )),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    fetchedResult = await sendNewUser(
                                        feedbackText.text,
                                        feedbackText2.text,
                                        feedbackText3.text,
                                        feedbackText4.text,
                                        feedbackText5.text,
                                        widget.user);
                                    isSuccessful =
                                        fetchedResult!['isSuccessful'];
                                    if (isSuccessful == true) {
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text('Pocket created')));
                                      // ignore: use_build_context_synchronously
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SettingView(widget.user)));
                                    } else {
                                      // ignore: use_build_context_synchronously
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Failed to create pocket')));
                                    }
                                  }
                                },
                                child: const Text('Submit'),
                              )),

                          const SizedBox(height: 12),

                          Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: ElevatedButton(
                                key: const Key("cancelFeedback"),
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(48),
                                    elevation: 0,
                                    shadowColor: Colors.transparent,
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(48),
                                    )),
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ReadFeedback(widget.user))),
                                child: const Text('Cancel',
                                    style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.red)),
                              )),
                          const SizedBox(height: 32),
                        ],
                      ))
                    ]))));
  }
}
