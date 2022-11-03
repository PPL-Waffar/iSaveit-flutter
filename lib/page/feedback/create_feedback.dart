import 'package:flutter/material.dart';
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
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Give us your feedback, please!',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(height: 8),
                              TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  controller: feedbackText,
                                  key: const Key("feedback"),
                                  decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color: Color(0xFFDBDBDB))),
                                      hintText: 'Tell us what you think'),
                                  ),
                            ])),

                    const SizedBox(height: 32),

                    //Edit Profile Button
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
                          onPressed: () => 
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileView())), 
                          child: const Text('Submit Feedback'),
                      )
                    ),
                    
                    const SizedBox(height: 32),

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
                          onPressed: () => 
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileView())), 
                          child: const Text('Cancel',
                          style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red)),
                      )
                    ),
                    
                  ],
                ))));
  }
}