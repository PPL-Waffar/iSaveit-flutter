import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<Map<String, dynamic>> fetchGroups(int id) async {
  String url =
      'http://localhost:8000/newsletter/view-detail-newsletter/?input_id=$id';

  try {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, dynamic> body = {'input_id': id};

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    List<dynamic> extractedData = jsonDecode(response.body);

    // await Future.delayed(Duration(seconds: 10));
    if (response.statusCode == 200) {
      return {"isSuccessful": true, "data": extractedData, "error": null};
    } else {
      return {
        "isSuccessful": false,
        "data": extractedData,
        "error": "An error has occurred"
      };
    }
  } catch (error) {
    return {
      "isSuccessful": false,
      "data": [],
      "error": "Our web service is down."
    };
  }
}

class NewsDetails extends StatefulWidget {
  final int id;
  const NewsDetails(this.id, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NewsDetails createState() => _NewsDetails();
}

class _NewsDetails extends State<NewsDetails> {
  List<dynamic> allpocket = [];
  Map<String, dynamic> response = {};

  @override
  void initState() {
    super.initState();
  }

  Future<void> _intializeData() async {
    response = await fetchGroups(widget.id);
    if (response["isSuccessful"]) {
      allpocket = response["data"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FutureBuilder(
                  future: _intializeData(),
                  builder: (context, snapshot) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 132,
                          height: 32,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: const Color(0xffE7E7FF)),
                          child: const Center(
                            child: Text(
                              'Newsletter for you',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff4054FF)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          allpocket[0]['newsletter_title'],
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          allpocket[0]['newsletter_text'],
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )
                      ],
                    );
                  }),
            ]),
      )),
    );
  }
}
