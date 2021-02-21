import 'package:bytebank/models/transfer.dart';
import 'package:bytebank/screens/transfer/forms.dart';
import 'package:flutter/material.dart';
const String _titleAppBar = 'Transferências';
class TransferList extends StatefulWidget{

  final List<Transfer> _transfer = List();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TransferListState();
  }

}

class TransferListState extends State<TransferList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_titleAppBar)
      ),
      body: ListView.builder(
        itemCount: widget._transfer.length,
        itemBuilder: (context, index) {
          final transfer = widget._transfer[index];
          return ItemTransfer(transfer);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), onPressed: () {
        final Future<Transfer> future = Navigator.push(
            context, MaterialPageRoute(builder: (context) {
          return TransferForm();
        }));
        future.then((transferReceived) {
          Future.delayed(Duration(seconds: 1), () {
            if (transferReceived != null) {
              widget._transfer.add(transferReceived);
              setState(() {

              });
            }
          });
        },
        );
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
        title: Text(_transfer.value.toString()),
        subtitle: Text(_transfer.numberAccount.toString()),
      ),
    );
  }
}