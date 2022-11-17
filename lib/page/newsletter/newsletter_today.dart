import 'package:flutter/material.dart';
// import 'package:isaveit/page/newsletter/newsletter_details.dart';
import 'package:isaveit/page/newsletter/newsletter_list.dart';
import 'package:isaveit/page/newsletter/newsletter_tips.dart';

class NewsletterToday extends StatefulWidget {
  const NewsletterToday({super.key});

  @override
  NewsToday createState() => NewsToday();
}

class NewsToday extends State<NewsletterToday> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                // title: const Text('Flutter Tabs', style: TextStyle(color: Colors.black)),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(40),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        isScrollable: true,
                        unselectedLabelStyle:
                        const TextStyle(fontWeight: FontWeight.normal),
                        unselectedLabelColor: Colors.black,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.transparent,
                        labelColor: Colors.red,
                        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
                        tabs: [
                          Container(
                            width: 132,
                            height: 32,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: const Color(0xffE7E7FF)),
                            child:
                            TextButton(
                              child: const Text(
                                "All articles",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff090A0A)),
                              ),
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const NewsletterList()));
                              },
                            ),
                          ),
                          Container(
                            width: 132,
                            height: 32,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: const Color(0xffE7E7FF)),
                            child:
                            TextButton(
                              child: const Text(
                                "Tips for you",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff090A0A)),
                              ),
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const NewsletterTips()));
                              },
                            ),
                          ),
                          Container(
                            width: 132,
                            height: 32,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: const Color(0xffE7E7FF)),
                            child:
                            TextButton(
                              child: const Text(
                                "Today's news",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff4054FF)),
                              ),
                              onPressed: () async {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const NewsletterToday()));
                              },
                            ),
                          ),
                        ]),
                  ),
                ),
              ),

              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 10,),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 132,
                            height: 32,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: const Color(0xffE7E7FF)),
                            child: const Center(
                              child :Text("Today's news", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff090A0A)),),
                            ),
                          ),
                        ]
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Image.asset('assets/images/newsletter2.png', width: 343, height: 154,),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    // const Text('Student Loans: What happens to loans when you leave college?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                    TextButton(
                      child: const Text(
                        "Student Loans: What happens to loans when you leave college?",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: Color(0xff090A0A)),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () async {
                      },
                    ),
                    // const Text('You need this! Tips on how to save more money if you live alone and still in college.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                    const SizedBox(height: 10,),
                    const Text('By Detik.com', style: TextStyle(color: Color(0xff979C9E), fontSize: 12, fontWeight: FontWeight.w500),),
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
                    const SizedBox(height: 18,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 132,
                            height: 32,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: const Color(0xffE7E7FF)),
                            child: const Center(
                              child :Text("Today's news", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff090A0A)),),
                            ),
                          ),
                        ]
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Image.asset('assets/images/newsletter2.png', width: 343, height: 154,),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    // const Text('Student Loans: What happens to loans when you leave college?', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                    TextButton(
                      child: const Text(
                        "Student Loans: What happens to loans when you leave college?",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,color: Color(0xff090A0A)),
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () async {
                      },
                    ),
                    const SizedBox(height: 10,),
                    const Text('By Academia.com', style: TextStyle(color: Color(0xff979C9E), fontSize: 12, fontWeight: FontWeight.w500),),
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
                  ]
                  )
          ),
        )
          )
        )
    );
  }
}