import 'package:flutter/material.dart';
import 'package:isaveit/page/feedback/create_feedback.dart';


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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(Icons.add, color: Colors.black),
              onPressed: () => Navigator.of(context).pop()),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              color: Colors.black,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreateFeedback()),
                );
              },
            ),
          ],
        ),
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
                    const Text('Your Satisfaction Report',
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
                              child: const Text('12 June 2022',
                                  style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF4054FF))
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
                                            TextSpan(text: 'Save money for buying new phone\n',style: TextStyle(fontSize: 14.0,fontFamily: 'Roboto',color: Color(0xFF212121))),
                                          ]
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                              ),
                            ),
                            TextButton(onPressed: () => Navigator.of(context).pop(),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                      const EdgeInsets.all(20)),
                                ),
                                child:RichText(
                                  text: const TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: 'See more', style: TextStyle(fontSize: 12, color: Color(0xff979C9E), fontWeight: FontWeight.w700))
                                      ]
                                  ),
                                )
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
                              child: const Text('13 May 2022',
                                  style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF4054FF))
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
                                            TextSpan(text: 'Reduce unnecessary expense and save income weekly\n',style: TextStyle(fontSize: 14.0,fontFamily: 'Roboto',color: Color(0xFF212121))),
                                          ]
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                              ),
                            ),
                            TextButton(onPressed: () => Navigator.of(context).pop(),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                      const EdgeInsets.all(20)),
                                ),
                                child:RichText(
                                  text: const TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: 'See more', style: TextStyle(fontSize: 12, color: Color(0xff979C9E), fontWeight: FontWeight.w700))
                                      ]
                                  ),
                                )
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
                              child: const Text('15 July 2022',
                                  style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF4054FF))
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
                                            TextSpan(text: 'Keep track of the details of my expenses and incomes\n',style: TextStyle(fontSize: 14.0,fontFamily: 'Roboto',color: Color(0xFF212121))),
                                          ]
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                              ),
                            ),
                            TextButton(onPressed: () => Navigator.of(context).pop(),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                      const EdgeInsets.all(20)),
                                ),
                                child:RichText(
                                  text: const TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: 'See more', style: TextStyle(fontSize: 12, color: Color(0xff979C9E), fontWeight: FontWeight.w700))
                                      ]
                                  ),
                                )
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
                              child: const Text('20 August 2022',
                                  style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF4054FF))
                              ),
                            ),

                            const SizedBox(height: 12),
                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.end,
                              children: const <Widget>[
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Icon(
                                      Icons.warning_amber_rounded,
                                      color: Colors.red,
                                    )),
                                Expanded(
                                    child: Text(
                                      'This report is over 3 months old, you can delete this',
                                      style: TextStyle(color: Color(0xFFFF0000)),
                                    )
                                )],
                            ),
                            const SizedBox(height: 8),
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
                                            TextSpan(text: 'Keep track of the details of my expenses and incomes\n',style: TextStyle(fontSize: 14.0,fontFamily: 'Roboto',color: Color(0xFF212121))),
                                          ]
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                              ),
                            ),
                            TextButton(onPressed: () => Navigator.of(context).pop(),
                                key: const Key("seeMoreButton"),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all<EdgeInsets>(
                                      const EdgeInsets.all(20)),
                                ),
                                child:RichText(
                                  text: const TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(text: 'See more', style: TextStyle(fontSize: 12, color: Color(0xff979C9E), fontWeight: FontWeight.w700))
                                      ]
                                  ),
                                )
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
                              child: const Text('21 June 2022',
                                  style: TextStyle(fontFamily: 'Inter', fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF4054FF))
                              ),
                            ),

                            const SizedBox(height: 12),

                            Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.end,
                              children: const <Widget>[
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Icon(
                                      Icons.warning_amber_rounded,
                                      color: Colors.red,
                                    )),
                                Expanded(
                                    child: Text(
                                      'This report is over 3 months old, you can delete this',
                                        style: TextStyle(color: Color(0xFFFF0000)),
                                        )
                                )],
                            ),
                            const SizedBox(height: 8),


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
                                            TextSpan(text: 'Stop over spending money on clothing and food\n',style: TextStyle(fontSize: 14.0,fontFamily: 'Roboto',color: Color(0xFF212121))),
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