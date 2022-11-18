import 'package:flutter/material.dart';
import 'package:isaveit/page/navbar.dart';
import 'package:isaveit/page/pocket/pocket_details.dart';
import 'package:isaveit/models/user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> sendNewUser(
    String pocketBudget, User user, String pocketname) async {
  String url = 'http://localhost:8000/pocket/edit-pocket/';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'input_pocketbudget': pocketBudget,
        'session_id': user.sessionId,
        'pocketold': pocketname,
      }),
    );

    Map<String, dynamic> result = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return result;
    } else {
      return <String, dynamic>{'error': 'Web service is offline'};
    }
  } catch (error) {
    return {'isSuccessful': false, 'error': ''};
  }
}

class EditPocket extends StatefulWidget {
  final User user;
  final String pocketname;
  final String pocketbudget;
  const EditPocket(this.user, this.pocketname, this.pocketbudget, {super.key});

  @override
  EditPocketPage createState() => EditPocketPage();
}

class EditPocketPage extends State<EditPocket> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController pocketname = TextEditingController();
  TextEditingController pocketbudget = TextEditingController();
  Map<String, dynamic>? fetchedResult;
  bool? isSuccessful;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 60),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      alignment: Alignment.topLeft,
                      child: const Text('Edit Pocket',
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(height: 32),
                    Container(
                        alignment: Alignment.center,
                        child: Center(
                          child: Text('${widget.pocketname} Balance',
                              textAlign: TextAlign.center,
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        )),
                    const SizedBox(height: 10),
                    Container(
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(widget.pocketbudget,
                            textAlign: TextAlign.center,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 32,
                                fontWeight: FontWeight.w700)),
                      ),
                    ),
                    const SizedBox(height: 32),

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
                    const SizedBox(height: 32),
                    SingleChildScrollView(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('My Budget',
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700)),
                              const SizedBox(height: 8),
                              TextFormField(
                                controller: pocketbudget,
                                key: const Key("editPocketBudget"),
                                decoration: const InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0)),
                                        borderSide: BorderSide(
                                            width: 1.0,
                                            color: Color(0xFFDBDBDB))),
                                    hintText: 'Rp 0'),
                                keyboardType: TextInputType.number,
                              )
                            ])),
                    const SizedBox(height: 32),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 30, right: 30),
                      child: ElevatedButton(
                        key: const Key("editPocketButton"),
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(48),
                            elevation: 0,
                            backgroundColor: const Color(0XFF4054FF),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(48),
                            )),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            fetchedResult = await sendNewUser(pocketbudget.text,
                                widget.user, widget.pocketname);
                            isSuccessful = fetchedResult!['isSuccessful'];
                            if (isSuccessful == true) {
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SettingView(widget.user)));
                            } else {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Failed to create pocket')));
                            }
                          }
                        },
                        child: const Text('Edit Pocket'),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(left: 30, right: 30),
                        child: ElevatedButton(
                          key: const Key("deletePocket"),
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(48),
                              elevation: 0,
                              backgroundColor: const Color(0xFFDFE2FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(48),
                              )),
                          onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Delete Pocket'),
                              content: const Text(
                                  'Are you sure you want to delete this pocket?'),
                              actions: <Widget>[
                                TextButton(
                                  key: const Key("cancelDeletePocket"),
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel',
                                      style:
                                          TextStyle(color: Color(0xFFD3180C))),
                                ),
                                TextButton(
                                  key: const Key("confirmDeletePocket"),
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              SettingView(widget.user))),
                                  child: const Text('Delete',
                                      style:
                                          TextStyle(color: Color(0XFF4054FF))),
                                ),
                              ],
                            ),
                          ),
                          child: const Text('Delete Pocket',
                              style: TextStyle(color: Color(0XFF4054FF))),
                        )),
                    const SizedBox(height: 16),

                    TextButton(
                      key: const Key("cancelEditPocket"),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Pocket(widget.user,
                                  widget.pocketname, widget.pocketbudget)),
                        );
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Color(0xFFD3180C)),
                      ),
                    )
                  ],
                ))));
  }
}

            



// const SizedBox(height: 32),

//pocket name


// const SizedBox(height: 32),

// //Pocket budget
// SingleChildScrollView(
//     padding: const EdgeInsets.only(left: 30, right: 30),
//     child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text('My Budget',
//               style: TextStyle(
//                   fontFamily: 'Inter',
//                   fontSize: 16,
//                   fontWeight: FontWeight.w700)),
//           const SizedBox(height: 8),
//           TextFormField(
//             key: const Key("editPocketBudget"),
//             decoration: const InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius:
//                         BorderRadius.all(Radius.circular(8.0)),
//                     borderSide: BorderSide(
//                         width: 1.0, color: Color(0xFFDBDBDB))),
//                 hintText: 'Rp 0'),
//             keyboardType: TextInputType.number,
//           )
//         ])),



// const SizedBox(height: 16),

// //delete button
// Container(
//     alignment: Alignment.center,
//     margin: const EdgeInsets.only(left: 30, right: 30),
//     child: ElevatedButton(
//       key: const Key("deletePocket"),
//       style: ElevatedButton.styleFrom(
//           minimumSize: const Size.fromHeight(48),
//           elevation: 0,
//           backgroundColor: const Color(0xFFDFE2FF),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(48),
//           )),
//       onPressed: () => showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           title: const Text('Delete Pocket'),
//           content: const Text(
//               'Are you sure you want to delete this pocket?'),
//           actions: <Widget>[
//             TextButton(
//               key: const Key("cancelDeletePocket"),
//               onPressed: () => Navigator.pop(context, 'Cancel'),
//               child: const Text('Cancel',
//                   style: TextStyle(color: Color(0xFFD3180C))),
//             ),
//             TextButton(
//               key: const Key("confirmDeletePocket"),
//               onPressed: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           SettingView(widget.user))),
//               child: const Text('Delete',
//                   style: TextStyle(color: Color(0XFF4054FF))),
//             ),
//           ],
//         ),
//       ),
//       child: const Text('Delete Pocket',
//           style: TextStyle(color: Color(0XFF4054FF))),
//     )),

// const SizedBox(height: 16),

//cancel button
// TextButton(
//   key: const Key("cancelEditPocket"),
//   onPressed: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) =>
//               Pocket(widget.user, widget.pocketname)),
//     );
//   },
//   child: const Text(
//     'Cancel',
//     style: TextStyle(color: Color(0xFFD3180C)),
//   ),
// )
