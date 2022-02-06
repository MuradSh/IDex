import 'package:flutter/material.dart';

class tile extends StatelessWidget {
  final width;
  const tile({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                "Murad",
                style: TextStyle(
                    fontSize: 23
                ),
              ),
              Text(
                "Plumber",
                style: TextStyle(
                    fontSize: 18
                ),
              ),
            ],
          ),
          SizedBox(
            width: 40,
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(5),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/pp.png"),
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star,color: Colors.orangeAccent,),
                    Icon(Icons.star,color: Colors.orangeAccent,),
                    Icon(Icons.star,color: Colors.orangeAccent,),
                    Icon(Icons.star,color: Colors.orangeAccent,),
                    Icon(Icons.star,color: Colors.orangeAccent,),],
                )
              ],
            )
          ),
          SizedBox(
            width: 40,
          ),
          Column(
            children: [
              Text("60\$",style: TextStyle(fontSize: 23),),
              Text("Online",style: TextStyle(fontSize: 20),),],
          )
        ]
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent)
      ),
    );
  }
}
