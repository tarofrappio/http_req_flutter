import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailWorldPage extends StatefulWidget {
  final location, time, flag, isDayTime;

  DetailWorldPage(this.location, this.time, this.flag, this.isDayTime);

  @override
  State<DetailWorldPage> createState() => _DetailWorldPageState();
}

class _DetailWorldPageState extends State<DetailWorldPage> {
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 4.0),
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              child: Image.asset(data['flag']),
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  data['isDayTime'] ? Icons.sunny : Icons.nightlight,
                  size: 28.0,
                  color: Colors.teal[200],
                ),
                SizedBox(
                  width: 6.0,
                ),
                Text(
                  data['location'],
                  style: TextStyle(fontSize: 28.0, color: Colors.teal[200]),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              data['time'],
              style: TextStyle(fontSize: 36.0, color: Colors.teal[200]),
            ),
          ],
        )),
      ),
    );
    ;
  }
}
