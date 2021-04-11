import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {
    //simulate network request for a username
    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'mihika';
    });


  //simulate network request for occupation of username
   String occ = await Future.delayed(Duration(seconds: 2), () {
  return 'student';
  });
   print('$username - $occ');
}

  @override
  void initState() {
    super.initState();
    print('initstate funcn ran');
    getData();
  }
  @override
  Widget build(BuildContext context) {
    print('build funcn ran');
    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan[300],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ElevatedButton(
        onPressed: () {},

        child: Text('Counter'),
      ),
    );
  }
}
