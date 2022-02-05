import 'package:flutter/material.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {

  late double _mediaHeight;
  late double _mediaWidth;

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
              children: const [
                Text(
                    "Idex",
                    style: TextStyle(
                      fontSize: 30
                    ),
                ),
                Text(
                    "Welcome back",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 19
                  ),
                ),
              ],
            ),
          ),
        ),
      )
      ),
    );
  }
}
