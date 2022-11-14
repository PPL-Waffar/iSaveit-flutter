// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:isaveit/page/plannedpayment/plannedpayment.dart';
import 'package:isaveit/page/plannedpayment/plannedpaymentdetails.dart';
import 'package:isaveit/page/pocket/create_pocket.dart';
import 'package:isaveit/models/user.dart';
import 'package:isaveit/page/pocket/pocket_details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

// import '../page//profile.dart'; 

//----------------------------------------//

Future<Map<String, dynamic>> fetchPlanned(User user) async {
  String url =
      'http://localhost:8000/payment/flu-get-payment/?session_id=${user.sessionId}';

  try {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, dynamic> body = {'session_id': user.sessionId};

    final response6 = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    List<dynamic> planneddata = jsonDecode(response6.body);
    // await Future.delayed(Duration(seconds: 10));
    if (response6.statusCode == 200) {
      return {"isSuccessful": true, "data": planneddata, "error": null};
    } else {
      return {
        "isSuccessful": false,
        "data": planneddata,
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

Future<Map<String, dynamic>> fetchGroups(User user) async {
  String url =
      'http://localhost:8000/pocket/get-pocket/?session_id=${user.sessionId}';

  try {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, dynamic> body = {'session_id': user.sessionId};

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

Future<Map<String, dynamic>> getUserInfo(User user) async {
  String url2 =
      'http://localhost:8000/user/user-info/?session_id=${user.sessionId}';

  try {
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    Map<String, dynamic> body = {'session_id': user.sessionId};

    final response2 = await http.post(
      Uri.parse(url2),
      headers: headers,
      body: jsonEncode(body),
    );

    Map<String, dynamic> extractedData2 = jsonDecode(response2.body);

    // await Future.delayed(Duration(seconds: 10));
    if (response2.statusCode == 200) {
      return {"isSuccessful": true, "data": extractedData2, "error": null};
    } else {
      return {
        "isSuccessful": false,
        "data": extractedData2,
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

class HomeView extends StatefulWidget {
  final User user;
  const HomeView(this.user, {super.key});

  @override
  State<HomeView> createState() => HomePage();
}

class HomePage extends State<HomeView> {
  bool _isLoading = false;
  List<dynamic> allpocket = [];
  Map<String, dynamic> response = {};
  // ignore: unused_field
  late Timer _timer;
  Map<String, dynamic> response3 = {};
  Map<String, dynamic> thedata = {};
  List<dynamic> allplanned = [];
  Map<String, dynamic> response4 = {};

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 4), (timer) async {
      await _intializeData();
      if (mounted) {
        _isLoading = true;
        setState(() => _isLoading = true);
      }
    });
  }

  Future<void> _intializeData() async {
    response = await fetchGroups(widget.user);
    if (response["isSuccessful"]) {
      allpocket = response["data"];
    }
    response3 = await getUserInfo(widget.user);
    if (response3["isSuccessful"]) {
      thedata = response3["data"];
    }
    response4 = await fetchPlanned(widget.user);
    if (response4["isSuccessful"]) {
      allplanned = response4["data"];
    }
  }

  @override
  Widget build(BuildContext context) {
    FutureBuilder(
        future: getUserInfo(widget.user),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(thedata["name"]);
          } else {
            return CircularProgressIndicator();
          }
        });

    if (_isLoading) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 150,
          backgroundColor: Colors.white,
          leading: Center(
            child: Text('Welcome Back \n ${thedata["name"]}', style: TextStyle(fontSize: 16, color: Colors.black),)),
          
          actions: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                          title: Center(
                            child: Text('Add'),),
                          actions: <Widget>[
                            Center(
                              child:Column(
                              children: [
                              SizedBox(  
                                height: 48,
                                width: 279,
                                child :ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(48),
                                  backgroundColor:
                                      Color(0xff4054FF),
                                      shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(48),)
                                      ), // <-- ElevatedButton
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CreatePocket(widget.user)));
                              },
                              child: const Text('New Pocket', style: TextStyle(fontSize: 16, color: Colors.white),),
                             
                            ),
                              ),
                            SizedBox(height: 10,),
                            SizedBox(
                              height: 48,
                              width: 279,
                            child:ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(48),
                                  backgroundColor:
                                      Color(0xffDFE2FF),
                                      shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(48),)), // <-- ElevatedButton
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PlannedPayment(widget.user)));
                              },
                              child: const Text(
                                'Planned Payment',
                                style: TextStyle(color: Color(0xff4054FF)),
                              ),
                            ),
                            ),
                            SizedBox(height: 10,),
                            TextButton(
                              // <-- TextButton
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),],
                            ),)
                            
                          ]),
                    ),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 40,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Text(
                'My balance ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              const Text(
                'Rp 5.000.000',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
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
              const SizedBox(
                height: 15,
              ),
              FutureBuilder(
                  future: fetchPlanned(widget.user),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return CarouselSlider.builder(
                          itemCount: allplanned.length,
                          options: CarouselOptions(
                            height: 120.0,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            viewportFraction: 1,
                          ),
                          itemBuilder: (context, index, realIndex) {
                            return SizedBox(
                              height: 120,
                              width: 200,
                              child: ElevatedButton(
                                onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PlanPayment(
                                              widget.user,
                                              allplanned[index]["pay_name"])))
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xffDFE2FF),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                child: Padding(padding: EdgeInsets.fromLTRB(5,10,5,3),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(allplanned[index]["pay_name"], style:TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 19,
                                              color: Color(0xff4054FF)) ,),
                                      Text(allplanned[index]["pay_amount"], style: TextStyle(fontSize: 18, color: Colors.black),),
                                      SizedBox(height: 15,),
                                      Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Date", style: TextStyle(fontSize: 14,color: Color(0xff4054FF),fontWeight: FontWeight.bold,)),
                                              Text(allplanned[index]["pay_date"], style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),)
                                            ],
                                          ),
                                          SizedBox(
                                            width: 15,
                                            height: 15,
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Type', style: TextStyle(fontSize: 14,color: Color(0xff4054FF),fontWeight: FontWeight.bold,),),
                                              Text(allplanned[index]["pay_categories"], style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black))
                                            ],
                                          )
                                        ],)

                                    ]),
                                )
                              ),
                            );
                          });
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
              const SizedBox(
                height: 15,
              ),
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
              const SizedBox(
                height: 15,
              ),
              const Text(
                'My Pocket',
                style: TextStyle(
                  fontSize: 18,
                ),
                textDirection: TextDirection.ltr,
              ),
              FutureBuilder(
                  future: _intializeData(),
                  builder: (context, snapshot) {
                    return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                      for (int i = 0; i < allpocket.length; i++)
                      Padding(
                        padding: EdgeInsets.all(10),
                        child:
                        SizedBox(
                            height: 72,
                            width: 343,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffDFE2FF),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              onPressed: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Pocket(
                                            widget.user,
                                            allpocket[i]["pocket_name"],
                                            allpocket[i]["pocket_budget"])))
                              },
                              child: 
                              Padding(
                                padding: EdgeInsets.fromLTRB(10,15,15,10),
                              child :Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                children: [
                                  Text(allpocket[i]["pocket_name"] + '\n' + allpocket[i]["pocket_budget"],style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700, color: Colors.black), textAlign: TextAlign.left,),
                              ],
                            ), 
                            ),
                          ),
                     )))]);
                  })
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
          body: Center(
        child: Text(
          "Loading",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
      ) // this will show when loading is false
          );
    }
  }
}
