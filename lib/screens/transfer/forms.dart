import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';

const  String _titleAppBar = 'Transferir';

const String _labelNumberAccount = 'Número da conta';
const String _tipNumberAccount = '0000000';

const String _labelValue = 'Valor';
const String _tipValue = '0.00';

const String _confirmation = 'Confirmar';

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
          title: Text(_titleAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(controller: widget._controllerNumberAccount,
                tip: _tipNumberAccount,
                label: _labelNumberAccount,
                icon: Icons.account_balance),
            Editor(controller: widget._controllerValue,
                tip: _tipValue,
                label: _labelValue,
                icon: Icons.monetization_on),

            RaisedButton(
                child: Text(_confirmation),
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