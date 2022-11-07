import 'package:flutter/material.dart';

import 'package:isaveit/page/feedback/feedback_details.dart';
import 'package:isaveit/page/feedback/create_feedback.dart';

class Feedbacks extends StatefulWidget{
  const Feedbacks({super.key});
  
  @override
  // ignore: library_private_types_in_public_api
  _Feedback createState() => _Feedback();
}

class _Feedback extends State<Feedbacks>{
  @override
  Widget build (BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Column(
              children: [
            Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(48),
                    elevation: 0,
                    backgroundColor: const Color(0XFF4054FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48),
                    )),
                onPressed: () => 
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FeedbackDetails())), 
                child: const Text('See More'),
            )
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 30, right: 30),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(48),
                      elevation: 0,
                      backgroundColor: const Color(0XFF4054FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(48),
                      )),
                  onPressed: () => 
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const CreateFeedback())), 
                  child: const Text('Create Feedback'),
              )
            ),
          ])
          )
          )
        ),
    );
  }
}