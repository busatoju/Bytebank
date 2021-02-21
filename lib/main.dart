import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class ListaTransferencias extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Transferências')
      ),
      body: Column(
        children: <Widget>[
          ItemTransfer(Transfer(100,27665843)),
          ItemTransfer(Transfer(300,27665843)),
          ItemTransfer(Transfer(200,27665843)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add),
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

class Transfer {
  final double value;
  final int numberAccount;

  const Transfer(this.value, this.numberAccount);

  @override
  String toString() {
    return 'Transfer{value: $value, numberAccount: $numberAccount}';
  }
}
class TransferForm extends StatelessWidget {
  final TextEditingController _controllerNumberAccount =
  TextEditingController();
  final TextEditingController _controllerValue =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Transferir')),
      body: Column(
        children: <Widget>[
          Editor(controller: _controllerNumberAccount, tip: '0000000', label: 'Número da conta', icon: Icons.monetization_on),
          Editor(controller: _controllerValue, tip: '0.00' , label: 'Valor', icon: Icons.account_balance),

          RaisedButton(
              child: Text('Confirmar'),
              onPressed: () {
                _CreateTransfer(_controllerNumberAccount, _controllerValue);

              }
          ),
        ],
      ),
    );

  }

}
class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String tip;
  final String label;
  final IconData icon;

  Editor({this.controller, this.tip, this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: Icon(icon),
          labelText: label,
          hintText: tip,

        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class BytebankApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: TransferForm(),
      ),
    );
  }
}

void _CreateTransfer(TextEditingController controllerNumberAccount, TextEditingController controllerValue){
  final int numberAccount =
  int.tryParse(controllerNumberAccount.text);
  final double value =
  double.tryParse(controllerValue.text);
  if(numberAccount != null && value != null) {
    final createTransfer = Transfer(value, numberAccount);
    debugPrint('$createTransfer');
  }
}