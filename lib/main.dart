import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

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
            title: Text('Transferências')
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
            debugPrint('Chegou no then do Future');
            debugPrint('$transferReceived');
            Future.delayed(Duration(seconds: 1), () {
              if (transferReceived != null) {
                widget._transfer.add(transferReceived);
                setState(() {

                });
              }
            });
          },
          );
        }
        )
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
class TransferForm extends StatefulWidget {
  final TextEditingController _controllerNumberAccount =
  TextEditingController();
  final TextEditingController _controllerValue =
  TextEditingController();


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TransferFormState();
  }

}
class TransferFormState extends State<TransferForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Transferir')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(controller: widget._controllerNumberAccount,
                tip: '0000000',
                label: 'Número da conta',
                icon: Icons.account_balance),
            Editor(controller: widget._controllerValue,
                tip: '0.00',
                label: 'Valor',
                icon: Icons.monetization_on),

            RaisedButton(
                child: Text('Confirmar'),
                onPressed: () {
                  _createTransfer(
                      widget._controllerNumberAccount, widget._controllerValue, context);
                }
            ),
          ],
        ),
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
      theme: ThemeData(primaryColor: Colors.green[900],
      accentColor: Colors.blue[700],
      buttonTheme: ButtonThemeData(buttonColor: Colors.blueAccent[700],
      textTheme: ButtonTextTheme.primary)
      ),


      home:  TransferList());
  }
}

void _createTransfer(TextEditingController _controllerNumberAccount, TextEditingController _controllerValue, BuildContext context){
  final int numberAccount = int.tryParse(_controllerNumberAccount.text);
  final double value = double.tryParse(_controllerValue.text);
  if(numberAccount != null && value != null) {
    final createTransfer = Transfer(value, numberAccount);
    debugPrint('Criando Transferência');
    debugPrint('$createTransfer');
    Navigator.pop(context, createTransfer);


  }
}