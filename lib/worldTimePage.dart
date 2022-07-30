// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http_req/worldTime.dart';

class WorldPage extends StatefulWidget {
  final location, time, flag, isDayTime;

  WorldPage(this.location, this.time, this.flag, this.isDayTime);

  @override
  State<WorldPage> createState() => _WorldPageState();
}

class _WorldPageState extends State<WorldPage> {
  List<WorldTime> locations = [
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin'),
    WorldTime(location: 'London', flag: 'england.png', url: 'Europe/London'),
    WorldTime(location: 'Pyongyang', flag: 'northkorea.png', url: 'Asia/Pyongyang'),
    WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta'),
    WorldTime(location: 'Kuching', flag: 'malaysia.png', url: 'Asia/Kuching'),
  ];

  Map data = {};

  @override
  void initState() {
    super.initState();
    data = {
      'location': widget.location,
      'flag': widget.flag,
      'time': widget.time,
      'isDayTime': widget.isDayTime
    };
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[900],
      appBar: AppBar(
        title: const Text('Choose Location Page'),
        leading: BackButton(),
      ),
      body: Padding(padding: EdgeInsets.all(8.0), 
      child: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (((context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.0),
            child: Card(
              color: Colors.teal[600],
              child: ListTile(
                onTap: () {},
                title: Text(locations[index].location, style: TextStyle(color: Colors.teal[200]),),
                leading: ,
              ),
            ),
          );
        }))
      ),)
    );
  }
}
