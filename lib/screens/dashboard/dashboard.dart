
import 'package:bytebank/models/balance.dart';
import 'package:bytebank/screens/dashboard/balance_card.dart';
import 'package:bytebank/screens/deposit/form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget{
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Bytebank'),
        ),
        body: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: BalanceCard(),
            ),

            RaisedButton(
              child: const Text('Receber depósito'),
              onPressed: (){
                /*balance.add(10);*/
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context){
                      return FormWithdraw();
                    })
                );
              },
            )
          ],
        ));
  }
}