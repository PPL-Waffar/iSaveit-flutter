import 'package:flutter/material.dart';

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
          leading: const Center(
              child: Text(
            'Newsletter coming soon',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          ),
      )
    );
  }
}