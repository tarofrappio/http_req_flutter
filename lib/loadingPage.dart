import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:http_req/worldTime.dart';

import 'worldTimePage.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  String time = 'Loading...';

  void setupWorldTime() async {
    WorldTime berlin =
        WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Asia/jakarta');
    await berlin.getData();
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            WorldPage(berlin.location, berlin.time, berlin.flag, berlin.isDayTime),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setupWorldTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Choose Location Page'),
          leading: BackButton(),
        ),
        body: Center(
          child: SpinKitRotatingCircle(
            color: Colors.teal[200],
            size: 50.0,
          ),
        ));
  }
}
