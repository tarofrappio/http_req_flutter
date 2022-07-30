import 'package:flutter/material.dart';
import 'package:http_req/customQuote.dart';
import 'package:http_req/worldTimePage.dart';

import 'loadingPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
        colorScheme: ColorScheme.light(
      primary: Colors.teal,
    )),
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentAge = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[900],
        appBar: AppBar(
          title: Text("Profiler"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            currentAge += 1;
          });
        }),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('santorini.jpg'),
                      radius: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Saya Siapa',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.teal[200],
                            fontSize: 24.0,
                            fontFamily: 'Champagne',
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5),
                      ),
                    ),
                    Divider(
                      color: Colors.teal[200],
                      thickness: 2.0,
                    ),
                  ],
                ),
              ),
              Text(
                'Current age: $currentAge',
                style: TextStyle(fontSize: 18.0, color: Colors.teal[200]),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Center(
                  child: Text('Quote Of The Day',
                      style:
                          TextStyle(fontSize: 24.0, color: Colors.teal[200])),
                ),
              ),
              Divider(
                color: Colors.teal[200],
                thickness: 2.0,
              ),
              CustomQuote(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoadingPage()));
                  },
                  child: Text('Check World Time'))
            ],
          ),
        ));
  }
}
