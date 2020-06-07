import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Progress Bar with Timer"),
        ),
        body: Center(
            child: ChangeNotifierProvider<TimeState>(
                create: (context) => TimeState(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Consumer<TimeState>(
                      builder: (context, timeState, _) => CustomProgressBar(
                        width: 200,
                        value: timeState.time,
                        totalValue: 15,
                      ),
                    ),

                    SizedBox(height:10,),
                    Consumer<TimeState>(
                      builder: (context, timeState, _) => RaisedButton(
                        color: Colors.red,
                        child: Text("Start"),
                        onPressed: () {
                          Timer.periodic(Duration(seconds: 1), (timer){
                            if(timeState.time == 0){
                              timer.cancel();
                            }else{
                              timeState.time -= 1;
                            }
                          });
                        },
                      ),
                    ),

                  ],
                )
            )


        ),
      ),
    );
  }
}

class CustomProgressBar extends StatelessWidget{
  final double width;
  final int value;
  final int totalValue;

  CustomProgressBar({this.width, this.value, this.totalValue});

  @override
  Widget build(BuildContext context) {
    double ratio = value / totalValue;

    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.timer, color: Colors.grey,),
        SizedBox(
          width: 5,
        ),
        Stack(
          children: <Widget>[
            Container(
              width: width,
              height: 10,
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(5),
              elevation: 3,
              child: AnimatedContainer(
                width: width * ratio,
                height: 10,
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                    color: (ratio < 0.3) ? Colors.red : (ratio < 0.6) ? Colors.amber[400] : Colors.lightGreen[400],
                    borderRadius: BorderRadius.circular(5)
                ),
              ),
            )
          ],
        )
      ],
    );
  }

}

class TimeState with ChangeNotifier{
  int _time = 15;

  int get time => _time;

  set time(int newTime){
    _time = newTime;
    notifyListeners();
  }
}


