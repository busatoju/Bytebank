import 'package:bytebank/models/Transfers.dart';
import 'package:bytebank/screens/transfer/list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _title = "Últimas transferências";

class LastTransfer extends StatelessWidget{

  Widget build(BuildContext context){
    return Column(
      children: <Widget>[
        Text(_title,
          style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 20,
          ),),
        Consumer<Transfers>(
          builder: (context, transfers, child){

            final _lastTransfers = transfers.transfers.reversed.toList();
            final _count  = transfers.transfers.length;
            int size = 2;

            if(_count == 0){
              return NoTransfer();
            }
            if(_count < 2){
              size = _count;
            }

              return ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: size,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ItemTransfer(_lastTransfers[index]);
                },
              );
            }
          ),
        RaisedButton(
          child: const Text("Ver todas as transferências"),
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
    );
  }
}

class NoTransfer extends StatelessWidget{
  Widget build(BuildContext context){
    return Card(
      margin: EdgeInsets.all(40),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Text("Você ainda não cadastrou nenhuma transferência",
        textAlign: TextAlign.center),
      ),
    );

  }
}