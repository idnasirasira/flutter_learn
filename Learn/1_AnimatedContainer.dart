import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MyApp> {
  Random random = Random();

  double addHeight = 0.00;
  double addWidth = 0.00;

  bool isShow = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
          body: Container(
            color: Colors.blue[200],
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedContainer(
                      duration: Duration(milliseconds:500),
                      width: addWidth,
                      height: addHeight,
                      decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    Center(
                      child:(
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)

                            ),
                            color: Colors.white,
                            highlightColor: Colors.redAccent,
                            highlightElevation: 2,
                            splashColor: Colors.red,
                            onPressed: () {
                              setState(() {
                                isShow = (isShow) ? false : true;
                                addHeight = (isShow) ? 300.00 : 0.00;
                                addWidth = (isShow) ? 300.00 : 0.00;
                              });
                            },
                            child: Text(
                              'Toggle',
                              style: TextStyle(
                                fontSize: 16.00,
                                color: Colors.black,
                              ),
                            ),
                          )
                      ),
                    )

                  ],
                )
            ),
          ),

        )
    );
  }
}

