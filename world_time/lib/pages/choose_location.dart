import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {





  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk1.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany1.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india1.png'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan1.png'),
    WorldTime(url: 'America/New_York', location: 'NewYork', flag: 'usa1.png'),
    WorldTime(url: 'America/Argentina/Buenos_Aires', location: 'BuenosAires', flag: 'argentina1.png'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia1.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt1.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }


  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.cyan[50],
      appBar: AppBar(
        backgroundColor: Colors.cyan[300],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                )
                )
              ),
          );

        }
      ),

    );
  }
}
