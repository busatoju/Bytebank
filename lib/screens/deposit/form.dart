import 'package:bytebank/components/editor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
  void _createWithdraw(context){
    Navigator.pop(context);
  }
}