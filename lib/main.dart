import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StoryBrain s = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: Column(children: <Widget>[
              Expanded(
                flex: 6,
                child: Text(
                  s.getStory(),
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                color: Colors.blueAccent[200],
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      s.nextStory(1);
                    });
                  },
                  child: Expanded(
                    flex: 2,
                    child: Text(
                      s.getChoice1(),
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Visibility(
                visible: s.buttonVisible(),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  color: Colors.redAccent[200],
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        s.nextStory(2);
                      });
                    },
                    child: Expanded(
                      flex: 2,
                      child: Text(
                        s.getChoice2(),
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
