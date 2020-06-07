import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MyApp>{
  double customPadding = 5;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: Text("Aninmated Padding")
          ),
          body: Column(
            children: <Widget>[
              /*Flex_1*/
              Flexible(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Flexible(
                        flex: 1,
                        child: AnimatedPadding(
                          duration: Duration(seconds: 1),
                          padding: EdgeInsets.all(customPadding),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                customPadding = 20;
                              });
                            },
                            child: Container(
                              color: Colors.red,
                            ),
                          ),
                        )

                    ),
                    Flexible(
                        flex: 1,
                        child: AnimatedPadding(
                          duration: Duration(seconds: 1),
                          padding: EdgeInsets.all(customPadding),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                customPadding = 20;
                              });
                            },
                            child: Container(
                              color: Colors.green,
                            ),
                          ),
                        )
                    )
                  ],
                ),
              ),
              /*Flex_2*/
              Flexible(
                flex: 1,
                child: Row(
                  children: <Widget>[
                    Flexible(
                        flex: 1,
                        child: AnimatedPadding(
                          duration: Duration(seconds: 1),
                          padding: EdgeInsets.all(customPadding),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                customPadding = 20;
                              });
                            },
                            child: Container(
                              color: Colors.blue,
                            ),
                          ),
                        )
                    ),
                    Flexible(
                        flex: 1,
                        child: AnimatedPadding(
                          duration: Duration(seconds: 1),
                          padding: EdgeInsets.all(customPadding),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                customPadding = 20;
                              });
                            },
                            child: Container(
                              color: Colors.yellow,
                            ),
                          ),
                        )
                    )
                  ],
                ),
              )
            ],
          )
      ),
    );
  }

}


