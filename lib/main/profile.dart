import 'package:flutter/material.dart';
import 'package:idexx/main/bottombar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Discover',style: TextStyle(fontSize: 27),),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Text("asia is petux")
    );
  }
}
