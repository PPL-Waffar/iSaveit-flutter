import 'package:flutter/material.dart';
import 'package:isaveit/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

import '../navbar.dart';

// ignore: must_be_immutable
class DeleteFeedback extends StatefulWidget {
  final User user;
  final int id;
  const DeleteFeedback(this.user, this.id, {super.key});
  @override
  DeleteFeedbackPage createState() => DeleteFeedbackPage();
}

Future<Map<String, dynamic>> deleteFeedback(User user, int id) async {
  String url =
      'https://isaveit-backend.herokuapp.com/feedbackreport/delete-feedback-report/?session_id=${user.sessionId}&input_id=$id';
  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
  };
  Map<String, dynamic> body = {'session_id': user.sessionId, 'input_id': id};

  final response = await http.delete(
    Uri.parse(url),
    headers: headers,
    body: jsonEncode(body),
  );
  if (response.statusCode == 200) {
    return {"isSuccessful": true, "error": null};
  } else {
    return {"isSuccessful": false, "error": "An error has occurred"};
  }
}

class DeleteFeedbackPage extends State<DeleteFeedback> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ElevatedButton(
        key: const Key("DeleteButton"),
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Delete Feedback'),
              content: const Text(
                  'Are you sure you want to delete this satisfaction feedback?'),
              actions: <Widget>[
                Center(
                  child: Column(children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(48),
                          elevation: 0,
                          backgroundColor: const Color(0XFF4054FF),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(48),
                          )),
                      onPressed: () {
                        deleteFeedback(widget.user, widget.id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingView(widget.user)),
                        );
                      },
                      child: const Text('Yes'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel',
                          style: TextStyle(color: Color(0xFFD3180C))),
                    ),
                  ]),
                )
              ],
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.black,
        ),
      )
    ]);
  }
}
