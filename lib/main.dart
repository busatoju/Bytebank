import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

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


        home:  TransferList());
  }
}





