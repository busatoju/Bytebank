import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bytebank/models/balance.dart';

import 'models/Transfers.dart';

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(
        create: (context) => Balance(0)),
    ChangeNotifierProvider(
        create: (context) => Transfers()),
  ],
  child: BytebankApp(),
),
);

class BytebankApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.green[900],
            accentColor: Colors.blue[700],
            buttonTheme: ButtonThemeData(buttonColor: Colors.blueAccent[700],
                textTheme: ButtonTextTheme.primary)
        ),


        home:  Dashboard());
  }
}





