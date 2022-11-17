// ignore_for_file: prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:isaveit/page/newsletter/newsletter_details.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  NewsPage createState() => NewsPage();
}

class NewsPage extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 150,
          leading: Center(
              child: Text(
                'Newsletter',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              
          )),
          body: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                SizedBox(
                  height: 30,
                  width: 100,
                  child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewsDetails()));
                  },
                  child: Text('See More')),
                )
              ]),
            ) ),
    );
  }
}
