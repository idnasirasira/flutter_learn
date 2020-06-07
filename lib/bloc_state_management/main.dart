import 'package:flutter/material.dart';
import 'package:flutterapp/bloc_state_management/color_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MyApp>{
  ColorBloc bloc = ColorBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_red);
              },
              backgroundColor: Colors.red,
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              onPressed: () {
                bloc.eventSink.add(ColorEvent.to_blue);
              },
              backgroundColor: Colors.blue,
            )
          ],
        ),
        appBar: AppBar(
            title: Text("BLoC State Management")
        ),
        body: Center(
            child: StreamBuilder(
              stream: bloc.stateStream,
              initialData: Colors.red,
              builder: (context, snapshot) {
                return AnimatedContainer(
                    width: 100,
                    height: 100,
                    color: snapshot.data,
                    duration: Duration(seconds: 1)
                );
              },
            )
        ),
      ),
    );
  }

}


