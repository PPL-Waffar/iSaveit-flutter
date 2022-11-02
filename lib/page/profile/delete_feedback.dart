import 'package:flutter/material.dart';
import 'package:isaveit/page/profile/feedback.dart';

class DeleteFeedback extends StatefulWidget {
  DeleteFeedback({super.key});
  @override
  _DeleteFeedback createState() => _DeleteFeedback();
}

class _DeleteFeedback extends State<DeleteFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children : <Widget>[
        
        AlertDialog(
          title: const Text('Delete Feedback', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
          content: Text('Are you sure you want to delete this feedback report?'),
          actions: <Widget>[
            Container(
              height: 48,
              width: 327,
              decoration:BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xff4054FF),),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff4054FF),
                elevation: 0,
                ),
                onPressed: () { Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  FeedbackPage()));},
                child: const Text('Yes', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                )
              ),
            ),
            const SizedBox(height: 8,),
            TextButton(
        // <-- TextButton
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
      ]
      ),
    );  
  }
}
