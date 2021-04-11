

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int triwizard=0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Make Payment Here'),
        centerTitle: true,
        backgroundColor: Colors.cyan[400]
      ),
      body: Column(
        children: [
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: ElevatedButton(
                onPressed: () {},
                child: Text('click here'),

                ),
              ),
              SizedBox(width: 10.0),
              Expanded(
                  flex: 6,
                  child: ElevatedButton(onPressed: () {}, child: Text('click here'), )),
              SizedBox(width: 15.0),
              Expanded(
                flex: 9,
                child: Container(
                  padding: EdgeInsets.all(30.0),
                  color: Colors.indigo,
                  child: Text('here'),
                ),
              ),
CircleAvatar(
  backgroundColor: Colors.yellow,
  radius: 30.0,
)
            ],
          ),
        SizedBox(height: 40.0),
        Text('count'),
        Text('$triwizard'),
        ],
      ),



      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            triwizard += 1;
          });
        },
        child: Text('CLICK'
        ),
        backgroundColor: Colors.black38
      ),
    );
  }
}


