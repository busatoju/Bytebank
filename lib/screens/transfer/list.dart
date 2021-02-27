import 'package:bytebank/models/Transfers.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer/forms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const String _titleAppBar = 'Transferências';

class TransferList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_titleAppBar)
      ),
      body: Consumer<Transfers>(
        builder: (context, transfers, child){
          return ListView.builder(
            itemCount: transfers.transfers.length,
            itemBuilder: (context, index) {
              final transfer = transfers.transfers[index];
              return ItemTransfer(transfer);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), onPressed: () {
        final Future<Transfer> future = Navigator.push(
            context, MaterialPageRoute(builder: (context) {
          return TransferForm();
        }));
      },
      ),
    );
  }
}

class ItemTransfer extends StatelessWidget {

  final Transfer _transfer;
  const ItemTransfer(this._transfer);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transfer.toStringValue()),
        subtitle: Text(_transfer.toStringAccount()),
      ),
    );
  }
}