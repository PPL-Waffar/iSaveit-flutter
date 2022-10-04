import 'package:flutter/material.dart'; 


class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  ProfilePage createState() => ProfilePage();
}

class ProfilePage extends State<ProfileView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          ),
          body: const SingleChildScrollView(
            child: Text('Profile'),
      )
    );
  }
}

