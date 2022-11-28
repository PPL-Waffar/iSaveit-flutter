// ignore_for_file: avoid_unnecessary_containers

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
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Flutter Tabs', style: TextStyle(color: Colors.black)),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(40),
              child: Align(
                alignment: Alignment.centerRight,
                child: TabBar(
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
                        child: const Text('Tips for you', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff4054FF)),),
                      ),
                      const Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Text("About"),
                          ),
                        ),
                      ),
                      const Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Text("Projects"),
                          ),
                        ),
                      ),
                      const Tab(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Text("Contact"),
                          ),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Center(child:
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NewsDetails()),
                  );
                },
                child: const Text('See More'),)
              ),
              const Center(child: Text("About")),
              const Center(child: Text("Projects")),
              const Center(child: Text("Contact")),
            ],
          ),
        ),
      ),
    );
  }
}