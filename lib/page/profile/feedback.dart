import 'package:isaveit/page/profile/delete_feedback.dart';
import 'package:meta/meta.dart';

import 'package:flutter/material.dart';

class Feedback extends StatefulWidget {
  final String text;

  const Feedback({required this.text});

  @override
  DescriptionFeedback createState() => DescriptionFeedback();
}

class DescriptionFeedback extends State<Feedback> {
  late String firstHalf;
  late String secondHalf;
  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: secondHalf.isEmpty
          ? Text(firstHalf)
          : new Column(
              children: <Widget>[
                new Text(flag ? ("$firstHalf...") : (firstHalf + secondHalf)),
                new InkWell(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text(
                        flag ? "show more" : "show less",
                        style: const TextStyle(color: Color(0xff979C9E)),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                )
              ],
            ),
    );
  }
}

class FeedbackPage extends StatelessWidget {
  final String description =
      "I think the application has quiet good features, however it is preferable to have ....";

  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Feedback Report', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                      SizedBox(height: 15,),
                      Text(
                        'John Doe',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Feedback(text: description),
                      Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        child: const Divider(
                          color: Color(0xFFDBDBDB),
                          height: 20,
                          thickness: 1,
                          indent: 0,
                          endIndent: 0,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: 
                        SizedBox(
                          height: 48,
                          width: 327,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                backgroundColor: const Color(0xff4054FF),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            onPressed: () => {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DeleteFeedback()))
                            },
                            child: Text(
                              'Delete Feedback',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                        child: Center(
                          child: TextButton(
                            key: const Key("cancel"),
                            onPressed: () {
                              Navigator.pop(context);},
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
              ]
              ),
              )  
              ],
            ),
          )
        ])));
  }
}
