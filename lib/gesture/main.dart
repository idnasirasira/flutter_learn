import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: _MainPage()
    );
  }
}

class _MainPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Hero New Page"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
              child: GestureDetector(
                  onTap: () {
                    print("asd");
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return _DetailPage();
                    }));
                  },
                  child: Hero(
                    tag: 'tagProfile',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          'images/abstract_1.jpeg',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )
              )
          ),

        ],
      ),
    );
  }
}

class _DetailPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.pink[100],
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Detail Page"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Hero(
                  tag: 'tagProfile',
                  child: Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Container(
                            width: 200,
                            height: 200,
                            child: Image.asset(
                              'images/abstract_1.jpeg',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,)
                        )
                    ),
                  )
              ),
            ),

          ],
        )
    );
  }

}

