
import 'package:bytebank/models/balance.dart';
import 'package:bytebank/screens/dashboard/balance_card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget{
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
          child: BalanceCard(Balance(10.0)),
      ),
      appBar: AppBar(
        title: Text('Bytebank'),
      ),

    );
  }
}