import 'package:flutter/material.dart';


class ReadFeedback extends StatefulWidget {
  const ReadFeedback({super.key});

  @override
  ReadFeedbackPage createState() => ReadFeedbackPage();
}

class ReadFeedbackPage extends State<ReadFeedback> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),

                  //title
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child:
                    const Text('Feedback Report',
                        style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)
                    ),
                  ),



                  SingleChildScrollView(
                      // padding: const EdgeInsets.only(left: 30, right: 30),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 0.5,),
                            const SizedBox(height: 24),


                            const SizedBox(height: 24),

                            //Name of the user
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(left: 20),
                              child: const Text('John Doe',
                                  style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)
                              ),
                            ),

                            const SizedBox(height: 12),

                            //Feedback content
                            SizedBox(
                              child: Row(children: [
                                Flexible(
                                  child: Container(
                                    height: 46,
                                    width: 200,
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: RichText(
                                      text: TextSpan(
                                          style: DefaultTextStyle.of(context).style,
                                          children: const <TextSpan>[
                                            TextSpan(text: 'I think the application is good, however there are...\n',style: TextStyle(fontSize: 14.0,fontFamily: 'Roboto',color: Color(0xFF212121),fontWeight: FontWeight.bold,)),
                                            TextSpan(text: 'See more', style: TextStyle(fontSize: 12, color: Color(0xff979C9E), fontWeight: FontWeight.w700))
                                          ]
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                              ),
                            ),

                            //divider
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

                            const SizedBox(height: 38,),

                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(left: 20),
                              child: const Text('John Doe',
                                  style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)
                              ),
                            ),

                            const SizedBox(height: 12),

                            SizedBox(
                              child: Row(children: [
                                Flexible(
                                  child: Container(
                                    height: 46,
                                    width: 200,
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: RichText(
                                      text: TextSpan(
                                          style: DefaultTextStyle.of(context).style,
                                          children: const <TextSpan>[
                                            TextSpan(text: 'I think the application is good, however there are...\n',style: TextStyle(fontSize: 14.0,fontFamily: 'Roboto',color: Color(0xFF212121),fontWeight: FontWeight.bold,)),
                                            TextSpan(text: 'See more', style: TextStyle(fontSize: 12, color: Color(0xff979C9E), fontWeight: FontWeight.w700))
                                          ]
                                      ),
                                    ),
                                  ),
                                ),
                              ]
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
                            const SizedBox(height: 38),


                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(left: 20),
                              child: const Text('John Doe',
                                  style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)
                              ),
                            ),

                            const SizedBox(height: 12),


                            SizedBox(
                              child: Row(children: [
                                Flexible(
                                  child: Container(
                                    height: 46,
                                    width: 200,
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: RichText(
                                      text: TextSpan(
                                          style: DefaultTextStyle.of(context).style,
                                          children: const <TextSpan>[
                                            TextSpan(text: 'I think the application is good, however there are...\n',style: TextStyle(fontSize: 14.0,fontFamily: 'Roboto',color: Color(0xFF212121),fontWeight: FontWeight.bold,)),
                                            TextSpan(text: 'See more', style: TextStyle(fontSize: 12, color: Color(0xff979C9E), fontWeight: FontWeight.w700))
                                          ]
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                              ),
                            ),
                            //divider
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
                            const SizedBox(height: 38,),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(left: 20),
                              child: const Text('John Doe',
                                  style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)
                              ),
                            ),

                            const SizedBox(height: 12),

                            SizedBox(
                              child: Row(children: [
                                Flexible(
                                  child: Container(
                                    height: 46,
                                    width: 200,
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: RichText(
                                      text: TextSpan(
                                          style: DefaultTextStyle.of(context).style,
                                          children: const <TextSpan>[
                                            TextSpan(text: 'I think the application is good, however there are...\n',style: TextStyle(fontSize: 14.0,fontFamily: 'Roboto',color: Color(0xFF212121),fontWeight: FontWeight.bold,)),
                                            TextSpan(text: 'See more', style: TextStyle(fontSize: 12, color: Color(0xff979C9E), fontWeight: FontWeight.w700))
                                          ]
                                      ),
                                    ),
                                  ),
                                ),
                              ]
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
                            const SizedBox(height: 38),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: const EdgeInsets.only(left: 20),
                              child: const Text('John Doe',
                                  style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700)
                              ),
                            ),

                            const SizedBox(height: 12),

                            SizedBox(
                              child: Row(children: [
                                Flexible(
                                  child: Container(
                                    height: 46,
                                    width: 200,
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: RichText(
                                      text: TextSpan(
                                          style: DefaultTextStyle.of(context).style,
                                          children: const <TextSpan>[
                                            TextSpan(text: 'I think the application is good, however there are...\n',style: TextStyle(fontSize: 14.0,fontFamily: 'Roboto',color: Color(0xFF212121),fontWeight: FontWeight.bold,)),
                                            TextSpan(text: 'See more', style: TextStyle(fontSize: 12, color: Color(0xff979C9E), fontWeight: FontWeight.w700))
                                          ]
                                      ),
                                    ),
                                  ),
                                ),
                              ]
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
                            const SizedBox(height: 38),
                          ]
                      )
                  ),
                ]
            )
        )
    );
  }
}