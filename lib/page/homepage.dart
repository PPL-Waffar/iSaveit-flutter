import 'package:flutter/material.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text ("Welcome Back! \nYourname", style: TextStyle(color: Colors.black),),
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
                        onPressed: () {},
                        child: const Text('New Pocket'),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                            Colors.indigo), // <-- ElevatedButton
                        onPressed: () {},
                        child: const Text(
                          'Planned Payment',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
        body : SingleChildScrollView(
          child: Column(
            children: const [
            Balance(),
            SizedBox(height: 10,),
            Plannedpayment(),
            SizedBox(height: 15,),
            DividerLine(),
            Pocket(),

            ],
          ),
      ),
    );
  }
}

class Balance extends StatelessWidget{
  const Balance({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        const SizedBox(height: 10,),
        const Text('My balance ', textAlign: TextAlign.center, style: TextStyle(fontSize: 20),),
        const Text ('Rp 5.000.000', style: TextStyle(fontSize: 25, ),),
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
        const SizedBox(height: 15,),
      ],
    );
  }
}
class DividerLine extends StatelessWidget{
  const DividerLine({super.key});

  @override
  Widget build(BuildContext context){
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
class Plannedpayment extends StatelessWidget{
  const Plannedpayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
            const Text("Don't miss your payment",  textAlign: TextAlign.left, style: TextStyle(fontSize: 20),),
            const SizedBox( width: 5,),
            Row(
            children : <Widget> [
              Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Colors.indigoAccent.shade100,
              ),
              height: 110,
              width: 161,
              child :RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: const <TextSpan>[
                    TextSpan(text :'\n'),
                    TextSpan(text: 'Spotify\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19, color: Colors.indigo)),
                    TextSpan(text: 'Rp 50.000\n', style: TextStyle(fontSize: 18)),
                    TextSpan(text: '\n'),
                    TextSpan(text: 'Date            Type\n', style: TextStyle(fontSize: 14, color: Colors.indigo, fontWeight: FontWeight.bold,)),
                    TextSpan(text: '19/08/22        Entertaiment', style: TextStyle(fontSize: 12)),

                  ],
                ),
                ),


            ),
            
            
            const SizedBox(width: 5,),

          Container(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              color: Colors.indigoAccent.shade100,
            ),
            height: 110,
            width: 161,
            child :RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: const <TextSpan>[
                  TextSpan(text :'\n'),
                  TextSpan(text: 'Netflix\n', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19, color: Colors.indigo)),
                  TextSpan(text: 'Rp 150.000\n', style: TextStyle(fontSize: 18)),
                  TextSpan(text: '\n'),
                  TextSpan(text: 'Date            Type\n', style: TextStyle(fontSize: 14, color: Colors.indigo,fontWeight: FontWeight.bold,)),
                  TextSpan(text: '25/08/22       Entertaiment', style: TextStyle(fontSize: 12)),

                ],
              ),
            ),


          ),
            ],
            ),
        ]
        );
  }

}
class Pocket extends StatelessWidget {
  const Pocket({super.key});

  @override
  Widget build(BuildContext context){
    return Column(
    children : <Widget>[
      const SizedBox(height: 10,),
      const Text('My Pocket', style: TextStyle(fontSize: 18,), textDirection: TextDirection.ltr,),
      const SizedBox(height: 10,),
      SizedBox(
          height: 72,
          width: 343,
          child: ElevatedButton(
            onPressed: null,
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigoAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))

            ),
            child: RichText(
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: const <TextSpan>[
                    TextSpan(text: 'Groceries\n', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                    TextSpan(text: 'Rp 200.000 spent of Rp 400.000', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
                  ],
              ),
            ),
          ),
        ),
      const SizedBox(height: 10,),
      SizedBox(
        height: 72,
        width: 343,

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigoAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))

          ),
          onPressed: null,
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(text: 'Groceries\n', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                TextSpan(text: 'Rp 200.000 spent of Rp 400.000', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
      ),
      const SizedBox(height: 10,),
      SizedBox(
        height: 72,
        width: 343,

        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigoAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))

          ),
          onPressed: null,
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(text: 'Groceries\n', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                TextSpan(text: 'Rp 200.000 spent of Rp 400.000', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
      ),
      const SizedBox(height: 10,),
      SizedBox(
        height: 72,
        width: 343,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.fromLTRB(0, 0,0 ,0),
              backgroundColor: Colors.indigoAccent,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))

          ),
          onPressed: null,
          child: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: const <TextSpan>[
                TextSpan(text: 'Groceries\n', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                TextSpan(text: 'Rp 200.000 spent of Rp 400.000', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500))
              ],
            ),
          ),
        ),
      ),
      ],
    );
  }
}

