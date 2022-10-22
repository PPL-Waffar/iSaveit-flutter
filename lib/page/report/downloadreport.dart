import 'package:flutter/material.dart';
import 'package:isaveit/models/user.dart';

// ignore: must_be_immutable
class DownloadReport extends StatefulWidget {
  User user;
  DownloadReport(this.user, {super.key});


  @override
  DownloadReportPage createState() => DownloadReportPage();
}

class DownloadReportPage extends State<DownloadReport> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //Download button
                  Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: ElevatedButton(
                        key: const Key("downloadReport"),
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                            elevation: 0,
                            backgroundColor: const Color(0xFFDFE2FF),
                            shape:
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(48),
                            )
                        ),
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Download Report'),
                            content: const Text('Are you sure you want to download this report?'),
                            actions: <Widget>[
                              TextButton(
                                key: const Key("cancelDownloadReport"),
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel', style: TextStyle(color: Color(0xFFD3180C))),
                              ),
                              // TextButton(
                              //   key: const Key("confirmDeletePocket"),
                              //   onPressed: (),
                              //   child: const Text('Delete', style: TextStyle(color: Color(0XFF4054FF))),
                              // ),
                            ],
                          ),
                        ),
                        child: const Text('Delete Pocket', style: TextStyle(color: Color(0XFF4054FF))),
                      )
                  ),

                  const SizedBox(height: 16),

                  //cancel button
                  TextButton(
                    key: const Key("cancelEditPocket"),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => HomeView()),
                      // );
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Color(0xFFD3180C)),
                    ),
                  )
                ]
            )
        ));
  }
}