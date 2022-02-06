// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:idexx/start_up/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idexx/main/discover.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  _signupState createState() => _signupState();
}

class _signupState extends State<signup> {

  late double _mediaHeight;
  late double _mediaWidth;

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _nameController = TextEditingController();

  _signUp() async{
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passController.text
      );

      var userId = _auth.currentUser!.uid;
      CollectionReference usersFB = FirebaseFirestore.instance.collection(
          'users');
      usersFB.doc(userId)
          .set({
        "long": 49.94207056963833,
        "lat":-119.39586855396729,
        "isSeller":0,
        "name": _nameController.text,
      })
          .onError((error, stackTrace) => print(error))
          .then((value) {
        Navigator.push(context, new MaterialPageRoute(
            builder: (context) =>
            new Discover()
        ));
      });
    } on FirebaseAuthException catch (e) {

      new Future.delayed(new Duration(seconds: 0), () {
        Navigator.pop(context); //pop dialog
      }).then((value){
        print(e.code);
        if (e.code == 'weak-password') {
          print("Error");
        } else if (e.code == 'email-already-in-use') {
          print("Error");
        }else {
          print("Error");
        }
      });
    }
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
                      controller: _emailController,
                      enableSuggestions: false,
                      autocorrect: false,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(fontSize: _mediaHeight*0.03, color: Color(0xffc1c1c1)),
                          prefixIcon: (Icon(
                              Icons.person,
                              size: 23,
                              color:Color(0xffc1c1c1)
                          ))
                      ),
                      controller: _nameController,
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
                      controller: _passController,
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
                            _signUp();
                          },
                          child: Text(
                            "Sign Up",
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
                                        new login()
                                    )
                                    );
                                  },
                                  child: Text(
                                    "Sign In",
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
