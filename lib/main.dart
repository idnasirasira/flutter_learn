import 'package:flutter/material.dart';
import 'package:flutterapp/http/model/post_result_model.dart';
import 'package:flutterapp/http/model/user_model.dart';
import 'package:http/http.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MyApp> {
  PostResult postResult;
  User user;

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
                  Text(postResult != null ? "POST : " + postResult.id + " | " + postResult.name + " | " + postResult.job + " | " + postResult.created : "Data Tidak Ada"),
                  RaisedButton(
                    onPressed: () => {
                      PostResult.connectToAPI("Badu", "Dokter").then((value) {
                        postResult = value;
                        setState(() => {});
                      })
                    },
                    child: Text("POST"),
                  ),
                  Text(user != null ? "GET : " + user.id.toString() +" | "+ user.firstName : "Data Tidak Ada"),
                  RaisedButton(
                    onPressed: () => {
                      User.connectToAPI("5").then((value) {
                        user = value;
                        setState(() => {});
                      })
                    },
                    child: Text("GET"),
                  )
                ],

              ),
            )
        )
    );
  }

}


