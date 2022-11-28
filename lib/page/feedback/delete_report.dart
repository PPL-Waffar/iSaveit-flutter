import 'package:flutter/material.dart';
import 'package:isaveit/page/feedback/create_feedback.dart';

// ignore: must_be_immutable
class DeleteFeedback extends StatefulWidget {
  const DeleteFeedback({super.key});
  @override
  DeleteFeedbackPage createState() => DeleteFeedbackPage();
}

class DeleteFeedbackPage extends State<DeleteFeedback> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          ElevatedButton(
        key: const Key("DeleteButton"),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) =>
                    AlertDialog(
                      title: const Text('Delete Feedback'),
                      content: const Text(
                          'Are you sure you want to delete this satisfaction feedback?'),
                      actions: <Widget>[
                        Center(
                          child: Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(48),
                                elevation: 0,
                                backgroundColor: const Color(0XFF4054FF),
                                shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(48),
                              )),
                              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateFeedback())), 
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
            child: const Icon(Icons.delete, color: Colors.black,),)
        ]
    );
  }
}