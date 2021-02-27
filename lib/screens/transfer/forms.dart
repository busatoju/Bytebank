import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/Transfers.dart';
import 'package:bytebank/models/balance.dart';
import 'package:bytebank/models/transfer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const  String _titleAppBar = 'Transferir';

const String _labelNumberAccount = 'Número da conta';
const String _tipNumberAccount = '0000000';

const String _labelValue = 'Valor';
const String _tipValue = '0.00';

const String _confirmation = 'Confirmar';


class TransferForm extends StatelessWidget {

  final TextEditingController _controllerNumberAccount = TextEditingController();
  final TextEditingController _controllerValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_titleAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(controller: _controllerNumberAccount,
                tip: _tipNumberAccount,
                label: _labelNumberAccount,
                icon: Icons.account_balance),
            Editor(controller: _controllerValue,
                tip: _tipValue,
                label: _labelValue,
                icon: Icons.monetization_on),

            RaisedButton(
                child: Text(_confirmation),
                onPressed: () {
                  _createTransfer(
                      _controllerNumberAccount, _controllerValue, context);
                }
            ),
          ],
        ),
      ),
    );
  }
}
void _createTransfer(TextEditingController _controllerNumberAccount, TextEditingController _controllerValue, BuildContext context) {
  final int numberAccount = int.tryParse(_controllerNumberAccount.text);
  final double value = double.tryParse(_controllerValue.text);

  final validTransfer = _validateTransfer(context, numberAccount, value);

  if (validTransfer) {
    final newTransfer = Transfer(value, numberAccount);

    _refreshState(context, newTransfer, value);
    Navigator.pop(context);
  }
}
_validateTransfer(context, numberAccount, value){
  final _filledFields = numberAccount != null && value != null;
  final sufficientBalance = value <= Provider.of<Balance> (context, listen: false).value;

  return _filledFields && sufficientBalance;
}

_refreshState(context, newTransfer, value){
  Provider.of<Transfers>(context, listen: false).add(newTransfer);
  Provider.of<Balance>(context, listen: false).withdraw(value);

}