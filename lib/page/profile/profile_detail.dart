import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:isaveit/page/feedback/create_feedback.dart';

import 'edit_profile.dart';

// heroku link: 

// ignore: must_be_immutable
class ProfileView extends StatefulWidget {
  const ProfileView({super.key});


  @override
  // ignore: library_private_types_in_public_api
  _ProfileDetailPage createState() => _ProfileDetailPage();
}

class _ProfileDetailPage extends State<ProfileView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userOccupation = TextEditingController();

  TextEditingController transactionDate = TextEditingController(); 
    @override
    void initState() {
      transactionDate.text = ""; //set the initial value of text field
      super.initState();
  }

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
                    Row(
                    //Page Title
                    children: <Widget>[
                      Container(
                      margin: const EdgeInsets.only(left: 20),
                      alignment: Alignment.topLeft,
                      child: const Text('Profile',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                    ),
                    const Spacer(),
                    IconButton(onPressed: () => 
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const EditProfile())), 
                           icon: const Icon(Icons.edit, color: Colors.black, size: 20))
                    ]),

                    const SizedBox(height: 32),
                    

                    //Name
                    SingleChildScrollView(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Name',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(height: 8),
                              TextFormField(
                                  enabled: false,
                                  controller: userName,
                                  key: const Key("editName"),
                                  decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color: Color(0xFFDBDBDB))),
                                      hintText: 'John Doe'),
                                  ),
                            ])),

                    const SizedBox(height: 32),

                    //Email
                    SingleChildScrollView(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Email',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(height: 8),
                              TextFormField(
                                  enabled: false,
                                  controller: userEmail,
                                  key: const Key("editEmail"),
                                  decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color: Color(0xFFDBDBDB))),
                                      hintText: 'johndoe@isaveit.com'),
                                  )
                            ])),
                    
                    const SizedBox(height: 32),

                    //Birth Date
                    SingleChildScrollView(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          const Text('Birth Date',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                          const SizedBox(height: 8),
                          
                      //Date Picker
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child:Center( 
                            child:TextField(
                                enabled: false,
                                key: const Key("birthDate"),
                                controller: transactionDate,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.calendar_today),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                    borderSide: BorderSide(width: 1.0, color: Color(0xFFDBDBDB))),
                                    hintText: '2002-09-12'), //editing controller of this TextField
                                
                                readOnly: true,  //set it true, so that user will not able to edit text
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                      context: context, initialDate: DateTime.now(),
                                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                                      lastDate: DateTime(2101)
                                  );
                                  
                                  if(pickedDate != null ){
                                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                                      setState(() {
                                        transactionDate.text = formattedDate; //set output date to TextField value. 
                                      });
                                  }else{
                                  }
                                },
                            ))),
                    ])),

                    const SizedBox(height: 32),

                    //Occupation
                    SingleChildScrollView(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Occupation',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(height: 8),
                              TextFormField(
                                enabled: false,
                                  controller: userOccupation,
                                  key: const Key("editOccupation"),
                                  decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
                                          borderSide: BorderSide(
                                              width: 1.0,
                                              color: Color(0xFFDBDBDB))),
                                      hintText: 'Student'),
                                  ),
                            ])),
                    
                    const SizedBox(height: 32),

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
                

                  ]))
                    ),
                  );
  }
}