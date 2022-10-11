import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:isaveit/page/plannedpayment/plannedpaymentdetails.dart';
import 'package:isaveit/page/pocket/create_pocket.dart';
import 'package:isaveit/models/user.dart';

// import '../page//profile.dart';

//----------------------------------------//
class HomeView extends StatefulWidget {
  final User user;
  const HomeView(this.user, {super.key});

  @override
  State<HomeView> createState() => HomePage();
}

class HomePage extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Welcome Back! \nYourname",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>
                        AlertDialog(title: const Text('Add'), actions: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.indigo), // <-- ElevatedButton
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CreatePocket(widget.user)));
                        },
                        child: const Text('New Pocket'),
                      ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //       backgroundColor:
                      //           Colors.indigo), // <-- ElevatedButton
                      //   onPressed: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) =>
                      //                 const Plannedpayment()));
                      //   },
                      //   child: const Text(
                      //     'Planned Payment',
                      //     style: TextStyle(color: Colors.white),
                      //   ),
                      // ),
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
                      ),
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
            CarouselSlider(
              items: [
                //1st Image of Slider
                SizedBox(
                  height: 30,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Plannedpaymentdetails()))
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffDFE2FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Spotify\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Color(0xff4054FF))),
                          TextSpan(
                              text: 'Rp 150.000\n',
                              style: TextStyle(fontSize: 18)),
                          TextSpan(
                              text: 'Date            Type\n',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff4054FF),
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: '25/08/22       Entertaiment',
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ),

                //2nd Image of Slider
                SizedBox(
                  height: 30,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffDFE2FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Youtube\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Color(0xff4054FF))),
                          TextSpan(
                              text: 'Rp 150.000\n',
                              style: TextStyle(fontSize: 18)),
                          TextSpan(
                              text: 'Date            Type\n',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff4054FF),
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: '25/08/22       Entertaiment',
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ),
                //3rd Image of Slider
                SizedBox(
                  height: 30,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffDFE2FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Netflix\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Color(0xff4054FF))),
                          TextSpan(
                              text: 'Rp 150.000\n',
                              style: TextStyle(fontSize: 18)),
                          TextSpan(
                              text: 'Date            Type\n',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff4054FF),
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: '25/08/22       Entertaiment',
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ),
                //4th Image of Slider
                SizedBox(
                  height: 30,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffDFE2FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'HBO GO\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Color(0xff4054FF))),
                          TextSpan(
                              text: 'Rp 150.000\n',
                              style: TextStyle(fontSize: 18)),
                          TextSpan(
                              text: 'Date            Type\n',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff4054FF),
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: '25/08/22       Entertaiment',
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ),
                //5th Image of Slider
                SizedBox(
                  height: 30,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffDFE2FF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: RichText(
                      text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'Code Academy\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                  color: Color(0xff4054FF))),
                          TextSpan(
                              text: 'Rp 150.000\n',
                              style: TextStyle(fontSize: 18)),
                          TextSpan(
                              text: 'Date            Type\n',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff4054FF),
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: '25/08/22       Entertaiment',
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              //Slider Container properties
              options: CarouselOptions(
                height: 110.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
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
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 72,
              width: 343,
              child: ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        //INGET INI HARUS DIUBAH
                        builder: (context) => const Plannedpaymentdetails()),
                  )
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffDFE2FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Groceries\n',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                          text: 'Rp 200.000 spent of Rp 400.000',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 72,
              width: 343,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffDFE2FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () => {},
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Groceries\n',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                          text: 'Rp 200.000 spent of Rp 400.000',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 72,
              width: 343,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffDFE2FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () => {},
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Health\n',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                          text: 'Rp 200.000 spent of Rp 400.000',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 72,
              width: 343,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    backgroundColor: const Color(0xffDFE2FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () => {},
                child: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Groceries\n',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                          text: 'Rp 200.000 spent of Rp 400.000',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}