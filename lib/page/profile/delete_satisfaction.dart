import 'package:flutter/material.dart';
import 'package:isaveit/page/profile/feedback.dart';

class DeleteFeedback extends StatefulWidget {
  const DeleteFeedback({super.key});
  @override
  
  DeleteFeedbacks createState() => DeleteFeedbacks();
}

class DeleteFeedbacks extends State<DeleteFeedback> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body :Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children : <Widget>[
        AlertDialog(
          title: const Text('Delete Satisfaction Report', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),),
          content: const Text('Are you sure you want to delete a report card that is more than 4 months old?'),
          actions: <Widget>[
            Column(
              children: [
            Container(
          height: 52,
          width: 384,
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
                                      const FeedbackPage()));},
              child: const Text('Yes', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
              ),
            
        ),
        const SizedBox(height: 15,),
        
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
            )
            
        ],
      ),
      ]
      ),
    );  
  }
}
