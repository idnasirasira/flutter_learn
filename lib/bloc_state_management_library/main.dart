import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterapp/bloc_state_management_library/color_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider<ColorBloc>(
          builder: (context) => ColorBloc(),
          child: MainPage(),
        )
    );
  }

}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);

    // TODO: implement build
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              bloc.dispatch(ColorEvent.to_red);
            },
            backgroundColor: Colors.red,
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              bloc.dispatch(ColorEvent.to_blue);
            },
            backgroundColor: Colors.blue,
          )
        ],
      ),
      appBar: AppBar(
          title: Text("BLoC State Management")
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) => AnimatedContainer(
            height: 100,
            width: 100,
            color: currentColor,
            duration: Duration(milliseconds: 500),
          ),
        ),
//
//        child: AnimatedContainer(
//          height: 100,
//          width: 100,
//          color: Colors.red,
//          duration: Duration(milliseconds: 500),
//        ),
      ),
    );
  }
}


