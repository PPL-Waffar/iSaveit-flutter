import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DownloadReport extends StatefulWidget {
  const DownloadReport({super.key});
  @override
  DownloadReportPage createState() => DownloadReportPage();
}

class DownloadReportPage extends State<DownloadReport> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          ElevatedButton(
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) =>
                    AlertDialog(
                      title: const Text('Download Report'),
                      content: const Text(
                          'Are you sure you want to download this report?'),
                      actions: <Widget>[
                        TextButton(
                          key: const Key("cancelDownloadReport"),
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel',
                              style: TextStyle(color: Color(0xFFD3180C))),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          key: const Key("confirmDownloadReport"),
                          onPressed: () => Navigator.pop(context, 'Yes'),
                          child: const Text('Yes',
                              style: TextStyle(color: Color(0xFF26A69A))),
                        ),
                      ],
                    ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: const Icon(Icons.download, color: Colors.black,),)
        ]
    );
  }
}