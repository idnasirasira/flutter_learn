import 'package:flutter/material.dart';
import 'package:flutterapp/provider_state_management/application_color.dart';
import 'package:provider/provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: ChangeNotifierProvider<ApplicationColor>(
          create: (context) => ApplicationColor(),
          child: Scaffold(
            appBar: AppBar(
                title: Consumer<ApplicationColor>(
                  builder: (context, applicationColor, _) =>
                      Text(
                        "Provider State Management",
                        style: TextStyle(color: applicationColor.color),
                      ),
                )

            ),
            body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Consumer<ApplicationColor>(
                          builder: (context, applicationColor, _) =>
                              AnimatedContainer(
                                width: 100,
                                height: 100,
                                margin: EdgeInsets.all(5),
                                color: applicationColor.color,
                                duration: Duration(seconds: 1),
                              ),
                        ),
                        Container(
                            child: Text("BLUE"),
                            margin: EdgeInsets.all(3)
                        ),
                        Consumer<ApplicationColor>(
                          builder: (context, applicationColor, _) =>
                              Switch(
                                  value: applicationColor.isRed,
                                  onChanged: (val) {
                                    applicationColor.isRed = val;
                                  }
                              ),
                        ),
                        Container(
                            child: Text("RED"),
                            margin: EdgeInsets.all(3)
                        )
                      ],
                    )
                  ],
                )
            ),
          ),
        )


    );
  }

}


