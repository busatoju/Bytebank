import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/balance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const _title = 'Depósito';
const _titleConfirmation = 'Confirmar';
const _tipValue = '0.00';
const _labelValue = 'Valor';

class FormWithdraw extends StatelessWidget{
  final TextEditingController _controllerValue =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(controller: _controllerValue,
                tip: _tipValue,
                label: _labelValue,
                icon: Icons.monetization_on),

            RaisedButton(
                child: Text(_titleConfirmation),
                onPressed: () {
                  _createWithdraw(
                    /* _controllerValue, */context);
                }
            ),
          ],
        ),

      ),

    );
  }
  _createWithdraw(context){

    final double value = double.tryParse(_controllerValue.text);
    final validWithdraw = _validadeWithdraw(value);

    if(validWithdraw) {
      _refreshState(context, value);
      Navigator.pop(context);
    }
  }

  _validadeWithdraw(value){
    final _filledField = value != null;

    return _filledField;
  }
  _refreshState(context, value){
    Provider.of<Balance>(context, listen: false).add(value);

  }
}