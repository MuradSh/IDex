// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:idexx/start_up/signup.dart';
import 'package:idexx/main/discover.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  late double _mediaHeight;
  late double _mediaWidth;
  FirebaseAuth _auth = FirebaseAuth.instance;


  final _emailFieldController = TextEditingController();
  final _passFieldController = TextEditingController();

  _signIn() async{
    try{
      print(_emailFieldController.text+" "+_passFieldController.text.trim());
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _emailFieldController.text,
          password: _passFieldController.text.trim()
      );
      // var userId = _auth.currentUser!.uid;
      // String name = await getUserName(userId);
      Navigator.push(context, new MaterialPageRoute(
          builder: (context) =>
          new Discover()
      ));
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found' ) {
        print("Error");
      }else if (e.code == 'wrong-password') {
        print("Error");
      }else{
        print("Error");
      }
    }
  }

  Future<String> getUserName(String userID) async{
    String name="";
    CollectionReference usersFirestore = FirebaseFirestore.instance.collection('users');
    Future<DocumentSnapshot> doc = usersFirestore.doc(userID).get();
    await doc.then((value) {
      final data = (value.data()! as Map)['name'];
      name = data;
    }
    );
    return name;
  }

  @override
  Widget build(BuildContext context) {

    _mediaHeight = MediaQuery.of(context).size.height;
    _mediaWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 50, horizontal: _mediaWidth * 0.03),
          child: SizedBox.expand(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                    "IDex",
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Poppins'
                    ),
                ),
                Text(
                    "Welcome back",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 29
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: _mediaHeight*0.03, color: Color(0xffc1c1c1)),
                      prefixIcon: (Icon(
                          Icons.email,
                          size: 23,
                          color:Color(0xffc1c1c1)
                      ))
                  ),
                  controller: _emailFieldController,
                  enableSuggestions: false,
                  autocorrect: false,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(fontSize: _mediaHeight*0.03, color: Color(0xffc1c1c1)),
                      prefixIcon: (Icon(
                          Icons.lock,
                          size: 23,
                          color:Color(0xffc1c1c1)
                      ))
                  ),
                  controller: _passFieldController,
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: true,
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: _mediaWidth*0.65,
                  height: _mediaHeight*0.07,
                  child: ElevatedButton(
                      onPressed: (){
                        _signIn();
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 24
                        ),
                      )),
                ),
                SizedBox(
                  height: 30,
                ),
                Expanded(
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, new MaterialPageRoute(
                                    builder: (context) =>
                                    new signup()
                                )
                                );
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.grey),
                              ),
                            )
                          ],
                        )
                    )
                )
              ],
            ),
          ),
        ),
      )
      ),
    );
  }
}
