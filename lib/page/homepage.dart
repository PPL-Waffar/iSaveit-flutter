import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Welcome Back! \nYourname",
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.left,
        ),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                side: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Add_pocket()));
              },
              child: const Icon(
                Icons.add,
                color: Colors.black,
                size: 40,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            Balance(),
            SizedBox(
              height: 10,
            ),
            planned_payment(),
            SizedBox(
              height: 15,
            ),
            Divide(),
            Pocket(),
          ],
        ),
      ),
    );
  }
}

class Balance extends StatelessWidget {
  const Balance({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
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
    const Text(
      "Don't miss your payment",
      textAlign: TextAlign.left,
      style: TextStyle(fontSize: 20),
    ),
      ],
    );
  }
}

class Divide extends StatelessWidget {
  const Divide({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: const Divider(
        color: Color(0xFFDBDBDB),
        height: 20,
        thickness: 1,
        indent: 0,
        endIndent: 0,
      ),
    );
  }
}

// ignore: camel_case_types
class planned_payment extends StatelessWidget {
  const planned_payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      const SizedBox(
        width: 10,
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: Colors.indigoAccent.shade100,
        ),
        height: 110,
        width: 161,
        child: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(text: '\n'),
              TextSpan(
                  text: 'Spotify\n',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.indigo)),
              TextSpan(text: 'Rp 50.000\n', style: TextStyle(fontSize: 18)),
              TextSpan(text: '\n'),
              TextSpan(
                  text: 'Date            Type\n',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                  text: '19/08/22        Entertaiment',
                  style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: Colors.indigoAccent.shade100,
        ),
        height: 110,
        width: 161,
        child: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: const <TextSpan>[
              TextSpan(text: '\n'),
              TextSpan(
                  text: 'Netflix\n',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.indigo)),
              TextSpan(text: 'Rp 150.000\n', style: TextStyle(fontSize: 18)),
              TextSpan(text: '\n'),
              TextSpan(
                  text: 'Date            Type\n',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                  text: '25/08/22       Entertaiment',
                  style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    ]);
  }
}

class Pocket extends StatelessWidget {
  const Pocket({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 10,
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
            onPressed: null,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigoAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                    text: 'Groceries\n',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
                backgroundColor: Colors.indigoAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            onPressed: null,
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                    text: 'Groceries\n',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
                backgroundColor: Colors.indigoAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            onPressed: null,
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                    text: 'Groceries\n',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
                backgroundColor: Colors.indigoAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            onPressed: null,
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(
                    text: 'Groceries\n',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
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
    );
  }
}

// ignore: camel_case_types
class Add_pocket extends StatelessWidget {
  const Add_pocket({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Add planned payment & pocket',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Add',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo), // <-- ElevatedButton
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('New Pocket'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFdfe2ff)),
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Planned Payment',
              style: TextStyle(color: Colors.indigo),
            ),
          ),
          TextButton(
            // <-- TextButton
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ]),
      ),
    );
  }
}
