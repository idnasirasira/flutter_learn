import 'package:flutter/material.dart';
import 'package:flutterapp/provider_state_management_multi/chart.dart';
import 'package:flutterapp/provider_state_management_multi/money.dart';
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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Money(),
          ),
          ChangeNotifierProvider(
            create: (context) => Chart(),
          )
        ],
        child: Scaffold(
          floatingActionButton: Consumer<Money>(
            builder: (context, money, _) =>  Consumer<Chart>(
              builder: (context, chart, _) => FloatingActionButton(
                onPressed: () {
                  if(money.balance >= 100){
                    chart.quantity += 1;
                    money.balance -= 100;
                  }
                },
                child: Icon(
                    Icons.add_shopping_cart
                ),
                backgroundColor: Colors.red,
              ),
            ),
          ),


          appBar: AppBar(
              title: Text("Provider State Management Multi")
          ),
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Balance"),
                      Container(
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Consumer<Money>(
                              builder: (context, money, _) => Text(
                                  money.balance.toString(),
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.w700
                                  )
                              ),
                            )

                        ),
                        height: 30,
                        width: 150,
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red[100],
                            border: Border.all(
                              color: Colors.red[300],
                              width: 2,
                            )
                        ),
                      )
                    ],
                  ),
                  Container(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Consumer<Chart>(
                          builder: (context, chart, _) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                  "Book (100) x "+ chart.quantity.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500
                                  )
                              ),
                              Text(
                                  "Rp." + (100 * chart.quantity).toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500
                                  )
                              ),
                            ],
                          ),
                        )
                    ),
                    height: 30,
                    width: 300,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        )
                    ),
                  )
                ],
              )
          ),
        ),
      ),

    );
  }

}


