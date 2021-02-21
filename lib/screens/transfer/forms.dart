import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

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