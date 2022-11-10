import 'package:flutter/material.dart';
import 'package:isaveit/page/feedback/read_feedback.dart';
import 'package:isaveit/page/profile/profile_detail.dart';

// heroku link: 

// ignore: must_be_immutable
class CreateFeedback extends StatefulWidget {
  const CreateFeedback({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _CreateFeedbackPage createState() => _CreateFeedbackPage();
}

class _CreateFeedbackPage extends State<CreateFeedback> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController feedbackText = TextEditingController();

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
                                padding: const EdgeInsets.only(left: 30, right: 30),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("In 1-5, How satisfied are you with this month's money management?",
                                          style: TextStyle(
                                              fontFamily: 'Inter',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700)),
                                      const SizedBox(height: 8),
                                      TextFormField(
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
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("What goals do you hope to achieve next month?",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            TextFormField(
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
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("What are you looking to improve in managing your money?",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            TextFormField(
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
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("How helpful do you think this service in your daily life?",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            TextFormField(
                                key: const Key("question4"),
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
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Do you have any feedback for the application to ease your experience?",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(height: 8),
                            TextFormField(
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
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: ElevatedButton(
                          key: const Key("submitFeedback"),
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(48),
                              elevation: 0,
                              backgroundColor: const Color(0XFF4054FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(48),
                              )),
                          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ReadFeedback())), 
                          child: const Text('Submit'),
                      )
                    ),
                    
                    const SizedBox(height: 12),

                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 30, right: 30),
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
                          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ReadFeedback())), 
                          child: const Text('Cancel',
                          style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red)),
                      )
                    ),
                    const SizedBox(height: 32),
                    
                  ],
                        )
                    )
                ]))));
  }
}