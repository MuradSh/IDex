import 'package:flutter/material.dart';
import 'package:idexx/main/bottombar.dart';
import 'package:idexx/rapeirerbox.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {

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
            tile(width: _mediaWidth),
          ]
        )
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }
}
