// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:isaveit/page/newsletter/newsletter_details.dart';
import 'newsletter_details.dart';

class NewsletterTips extends StatefulWidget {
  const NewsletterTips({super.key});

  @override
  NewsTips createState() => NewsTips();
}

class NewsTips extends State<NewsletterTips> {
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
                                child :Text('Tips for you', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff090A0A)),),
                              ),
                            ),
                        
                        SizedBox(height: 10),

                        Image.asset('assets/images/newsletter.png', width: 343, height: 154,),

                        SizedBox(height: 5),

                        TextButton(
                          key: const Key("titleOne"),
                          child: const Text(
                            "You need this! Tips on how to save more money if you live alone and still in college.",
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
                                child :Text("Tips for you", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff090A0A)),),
                              ),
                            ),
                        
                        SizedBox(height: 10),

                        Image.asset('assets/images/newsletter2.png', width: 343, height: 154,),

                        SizedBox(height: 5),

                        TextButton(
                          key: const Key("titleTwo"),
                          child: const Text(
                            "Start your side hustle now! Here are some tips on how to start your own business.",
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