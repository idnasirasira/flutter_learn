import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MyApp> {
  bool isSwitchOn = false;
  Widget myWidget = Container(
    width: 200,
    height: 200,
    decoration: BoxDecoration(
        color: Colors.green,
        border: Border.all(
          color: Colors.black,
          width: 2,
        )
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('API'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  AnimatedSwitcher(
                      child: myWidget,
                      duration: Duration(seconds: 1),
                      transitionBuilder: (child, animation) => ScaleTransition(
                        scale: animation,
                        child: child,
                      )
                  ),
                  Switch(
                      activeColor: Colors.red,
                      inactiveThumbColor: Colors.green,
                      inactiveTrackColor: Colors.green[200],
                      value: isSwitchOn,
                      onChanged: (newVal) {
                        isSwitchOn = newVal;
                        setState(() => {
                          if(isSwitchOn == true){
//                          myWidget = Text("Switch: ON")
                            myWidget = Container(
                                key: ValueKey(1),
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    )
                                )
                            )
                          }else{
                            myWidget = Container(
                              key: ValueKey(2),
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  )
                              ),
                            )
                          }


                        });
                      }
                  )
                ],
              ),
            )
        )
    );
  }

}


