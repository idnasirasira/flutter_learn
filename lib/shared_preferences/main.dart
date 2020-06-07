import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*
* Notes
*
*   shared_preferences: ^0.5.3+4

* */

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MyApp>{
  TextEditingController textController = TextEditingController(text: "Default");
  bool isSwitchOn = false;

  void saveData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("name", textController.text);
    pref.setBool("switchStatus", isSwitchOn);
  }

  Future<String> getName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("name") ?? "Default";
  }

  Future<bool> getSwitchStatus() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool("switchStatus") ?? false;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text("Shared Preference Example")
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextField(
                  controller: textController,
                ),
                Switch(
                  value: isSwitchOn,
                  onChanged: (newVal) {
                    setState(() {
                      isSwitchOn = newVal;
                    });
                  },
                ),
                RaisedButton(
                  child: Text("Save"),
                  onPressed: () {
                    saveData();
                  },
                ),
                RaisedButton(
                  child: Text("Load"),
                  onPressed: () {
                    getName().then((s) {
                      textController.text = s;
                      setState(() {});
                    });

                    getSwitchStatus().then((s) {
                      isSwitchOn = s;
                      setState(() {});
                    });
                  },
                )

              ],
            )
        ),
      ),
    );
  }

}


