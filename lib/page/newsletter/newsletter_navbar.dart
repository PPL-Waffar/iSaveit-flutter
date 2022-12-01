// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:isaveit/page/newsletter/newsletter_list.dart';
import 'package:isaveit/page/newsletter/newsletter_tips.dart';
import 'package:isaveit/page/newsletter/newsletter_today.dart';
import 'package:scroll_navigation/scroll_navigation.dart';

class NewsletterNavbar extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  NewsletterNavbar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsletterNavbar createState() => _NewsletterNavbar();
}

class _NewsletterNavbar extends State<NewsletterNavbar>{
  late final List screens;

  @override
  Widget build(BuildContext context) {
    return TitleScrollNavigation(
    barStyle: TitleNavigationBarStyle(
      style: TextStyle(fontWeight: FontWeight.bold),
      padding: EdgeInsets.symmetric(horizontal: 40.0),
      spaceBetween: 40,
      ),
      // ignore: prefer_const_literals_to_create_immutables
      pages: [
        NewsletterList(),
        NewsletterTips(),
        NewsletterToday()
      ],
      // ignore: prefer_const_literals_to_create_immutables
      titles: [
        "All Articles",
        "Tips",
        "Today's News",
      ],
    );
  }
}