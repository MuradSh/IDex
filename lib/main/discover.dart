import 'package:flutter/material.dart';
import 'package:idexx/main/bottombar.dart';
import 'package:idexx/rapeirerbox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:idexx/classes/HM.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var items = [
    'Plumber',
    'Window/Door',
    'Drywall Installation',
    'Flooring',
    'Car',
  ];
  late double _mediaHeight;
  late double _mediaWidth;
  var selectedValue = "Plumber";

  List<HM> _ustas=[];

  void _getUstas() async{
    Query _ustasFB = firestore.collection("handymen");
    QuerySnapshot querySnapshot = await _ustasFB.get();
    var list = querySnapshot.docs;
    list.forEach((element) {
      dynamic document = element;

      HM _usta = HM(
        document.id,
        document['name'],
        document['specialty'],
        document['price'],
        document['rating'],
      );
      print(document);
      if(this.mounted) {
        setState(() {
          _ustas.add(_usta);
          print(_ustas);
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    _getUstas();
  }

  @override
  Widget build(BuildContext context) {
    _mediaHeight = MediaQuery.of(context).size.height;
    _mediaWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Discover',style: TextStyle(fontSize: 27),),
        backgroundColor: Colors.indigoAccent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 20,
              ),
              Center(
                child: DropdownButton(
                  value: selectedValue,
                  onChanged: (newValue) {
                    setState(() {
                      selectedValue = newValue.toString();
                    });
                    print(selectedValue);
                  },
                  items: items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style: TextStyle(fontSize:20)),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              for(var u in _ustas)...{
                tile(width: _mediaWidth,name:u.name,specialty: u.specialty,price: u.price,rating: int.parse(u.rating)),
              },
            ]
          ),
        )
      ),
    );
  }
}
