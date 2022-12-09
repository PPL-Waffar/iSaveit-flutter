// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:isaveit/page/newsletter/newsletter_details.dart';
// import 'package:isaveit/page/newsletter/newsletter_details.dart';
class NewsletterToday extends StatefulWidget {
  const NewsletterToday({super.key});

  @override
  NewsToday createState() => NewsToday();
}

class NewsToday extends State<NewsletterToday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: SingleChildScrollView(
            child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    const SizedBox(height: 30),
                    
                    Padding(padding: EdgeInsets.only(left: 30, right: 30),
                    child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 132,
                              height: 32,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: Color.fromARGB(255, 239, 238, 239)),
                              child: const Center(
                                child :Text("Today's News", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff090A0A)),),
                              ),
                            ),
                        
                        SizedBox(height: 10),

                        Image.asset('assets/images/newsletter.png', width: 343, height: 154,),

                        SizedBox(height: 5),

                        TextButton(
                          key: const Key("today1"),
                          child: const Text(
                            "Student loan debt: How to pay off your student loans faster",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: Color(0xff090A0A)),
                          ),
                          onPressed: () async {Navigator.push(context,MaterialPageRoute(builder: (context) =>const NewsDetails()));},
                          ),

                          SizedBox(height: 5),

                          Text('By Detik.com', style: TextStyle(color: Color(0xff979C9E), fontSize: 12, fontWeight: FontWeight.w500)),
                          ]
                    )),
              const SizedBox(height: 24), 
              Divider(
                color: Color(0xFFDBDBDB),
                height: 20,
                thickness: 1,
                indent: 0,
                endIndent: 0,
                ),
          
              const SizedBox(height: 24), 
              Padding(padding: EdgeInsets.only(left: 30, right: 30),
                    child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 132,
                              height: 32,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: Color.fromARGB(255, 239, 238, 239)),
                              child: const Center(
                                child :Text("Today's news", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff090A0A)),),
                              ),
                            ),
                        
                        SizedBox(height: 10),

                        Image.asset('assets/images/newsletter2.png', width: 343, height: 154,),

                        SizedBox(height: 5),

                        TextButton(
                          key: const Key("today2"),
                          child: const Text(
                            "This student start saving money since he was 12 years old. Here's how he did it.",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: Color(0xff090A0A)),
                          ),
                          onPressed: () async {Navigator.push(context,MaterialPageRoute(builder: (context) =>const NewsDetails()));},
                          ),

                          SizedBox(height: 5),

                          Text('By Academia.com', style: TextStyle(color: Color(0xff979C9E), fontSize: 12, fontWeight: FontWeight.w500)),
                          ]
                    )),
              
              
                ]
          )
      )
      
      );
      
      
  }
}