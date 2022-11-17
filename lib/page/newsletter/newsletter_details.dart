import 'package:flutter/material.dart';

class NewsDetails extends StatefulWidget{
  const NewsDetails({super.key});

  @override
  _NewsDetails createState() => _NewsDetails();
}

class _NewsDetails extends State<NewsDetails>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop()),
      ),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 132,
                    height: 32,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(32), color: const Color(0xffE7E7FF)),
                    child: const Center(
                      child :Text('Tips for you', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Color(0xff4054FF)),),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text('You need this! Tips on how to save more money if you live alone and still in college.', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                  const SizedBox(height: 10,),
                  const Text('By Detik.com', style: TextStyle(color: Color(0xff979C9E), fontSize: 12, fontWeight: FontWeight.w500),),
                  const SizedBox(height: 7,),
                  SizedBox(
                    child: Image.asset('assets/images/newsletter.png', width: 343, height: 154,),
                  ),
                  const Text("\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. \n \nClass aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Praesent auctor purus luctus enim egestas, ac scelerisque ante pulvinar. Donec ut rhoncus ex. Suspendisse ac rhoncus nisl, eu tempor urna. Curabitur vel bibendum lorem. Morbi convallis convallis diam sit amet lacinia. Aliquam in elementum tellus. \n \nLorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),)
                ]
            ),
          )
      ),
    );
  }
}