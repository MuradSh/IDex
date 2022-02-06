import 'package:flutter/material.dart';

class tile extends StatelessWidget {
  final width;
  final name;
  final specialty;
  final price;
  final rating;
  const tile({Key? key, this.width,this.name,this.specialty,this.price,this.rating}) : super(key: key);

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
                name,
                style: TextStyle(
                    fontSize: 23
                ),
              ),
              Text(
                specialty,
                style: TextStyle(
                    fontSize: 18
                ),
              ),
            ],
          ),
          SizedBox(
            width: 40,
          ),
          Column(
              children: [
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/pp.png"),
                  ),
                ),
                Row(
                  children: [
                    for(int i=0;i<rating;i++)...{
                      Icon(Icons.star,color: Colors.orangeAccent,),
                    }
                  ],
                )
              ]
          ),
          SizedBox(
            width: 40,
          ),
          Column(
            children: [
              Text(price,style: TextStyle(fontSize: 23),),
              Text("Online",style: TextStyle(fontSize: 20),),],
          )
        ]
      ),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width:1, color: Colors.grey))
      ),
    );
  }
}
