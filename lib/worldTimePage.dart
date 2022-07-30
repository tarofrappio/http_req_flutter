// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http_req/detailWorldPage.dart';
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
    WorldTime(
        location: 'Pyongyang', flag: 'northkorea.png', url: 'Asia/Pyongyang'),
    WorldTime(location: 'Tokyo', flag: 'japan.png', url: 'Asia/Tokyo'),
    WorldTime(location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta'),
    WorldTime(location: 'Kuching', flag: 'malaysia.png', url: 'Asia/Kuching'),
  ];

  Map data = {};

  Future<void> updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getData();
    locations[index] = instance;
  }

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
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (((context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 0.0),
                  child: Card(
                    elevation: 5.0,
                    color: Colors.teal[600],
                    child: ListTile(
                      onTap: () async {
                        await updateTime(index);
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailWorldPage(
                                      locations[index].location,
                                      locations[index].time,
                                      locations[index].flag,
                                      locations[index].isDayTime,
                                    )));
                        print(locations[index]);
                      },
                      title: Text(
                        locations[index].location,
                        style: TextStyle(color: Colors.teal[200]),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(locations[index].flag),
                      ),
                    ),
                  ),
                );
              }))),
        ));
  }
}
