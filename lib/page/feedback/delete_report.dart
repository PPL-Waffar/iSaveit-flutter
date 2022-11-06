import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DeleteReport extends StatefulWidget {
  const DeleteReport({super.key});
  @override
  DeleteReportPage createState() => DeleteReportPage();
}

class DeleteReportPage extends State<DeleteReport> {
  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
        SizedBox(
          width: 327,
          height: 48,

        child:
          ElevatedButton(

        key: const Key("DeleteButton"),
            onPressed: () {
              showDialog<String>(
                context: context,
                builder: (BuildContext context) =>
                    AlertDialog(
                      title: const Text('Delete Satisfaction Report'),
                      content: const Text(
                          'Are you sure you want to delete a report card that is more than 4 months old?'),
                      actions: <Widget>[
                        TextButton(
                          key: const Key("cancelDeleteReport"),
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel',
                              style: TextStyle(color: Color(0xFFD3180C))),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          key: const Key("DeleteReport"),
                          onPressed: () => Navigator.pop(context, 'Yes'),
                          child: const Text('Yes',
                              style: TextStyle(color: Color(0xFF26A69A))),
                        ),
                      ],
                    ),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              backgroundColor: const Color(0xff4054FF),
            ),
            child: const Text('Delete Report', style: TextStyle(fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),)
    )
    )
    ]
    );
  }
}