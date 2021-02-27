
import 'package:bytebank/models/balance.dart';
import 'package:bytebank/screens/dashboard/balance_card.dart';
import 'package:bytebank/screens/deposit/form.dart';
import 'package:bytebank/screens/transfer/forms.dart';
import 'package:bytebank/screens/transfer/list.dart';
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
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: const Text('Receber depósito'),
                  color: Colors.green,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return FormWithdraw();
                        })
                    );
                  },
                ),
                RaisedButton(
                  child: const Text('Nova transferência'),
                  color: Colors.green,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context){
                          return TransferForm();
                        })
                    );
                  },
                )
              ],

            ),
            RaisedButton(
              child: const Text('Transferências'),
              color: Colors.green,
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context){
                      return TransferList();
                    })
                );
              },
            )

          ],
        ));
  }
}